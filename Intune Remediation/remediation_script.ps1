# Remove TempAdmin Account - Intune Platform Script
# Optimized for Microsoft Intune deployment
# Removes the 'tempadmin' administrative account from Windows workstations

#Requires -RunAsAdministrator

# Script configuration
$AccountToRemove = "tempadmin"
$LogPath = "C:\ProgramData\Microsoft\IntuneManagementExtension\Logs"
$LogFile = Join-Path $LogPath "Remove-TempAdmin.log"

# Ensure log directory exists
if (-not (Test-Path $LogPath)) {
    New-Item -Path $LogPath -ItemType Directory -Force | Out-Null
}

# Function to write timestamped log entries
function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO"
    )
    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogEntry = "[$TimeStamp] [$Level] $Message"
    Write-Output $LogEntry
    Add-Content -Path $LogFile -Value $LogEntry -ErrorAction SilentlyContinue
}

# Function to check if account exists
function Test-LocalUser {
    param([string]$Username)
    try {
        $user = Get-LocalUser -Name $Username -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

# Function to remove user from all groups
function Remove-UserFromGroups {
    param([string]$Username)
    try {
        # Get all local groups the user is a member of
        $userGroups = Get-LocalGroup | Where-Object {
            (Get-LocalGroupMember -Group $_.Name -ErrorAction SilentlyContinue).Name -contains "$env:COMPUTERNAME\$Username"
        }
        
        foreach ($group in $userGroups) {
            try {
                Remove-LocalGroupMember -Group $group.Name -Member $Username -ErrorAction Stop
                Write-Log "Removed '$Username' from group '$($group.Name)'" "SUCCESS"
            }
            catch {
                Write-Log "Failed to remove '$Username' from group '$($group.Name)': $($_.Exception.Message)" "WARNING"
            }
        }
    }
    catch {
        Write-Log "Error enumerating user groups: $($_.Exception.Message)" "ERROR"
    }
}

# Main execution
try {
    Write-Log "Starting removal of administrative account: $AccountToRemove"
    
    # Check if the account exists
    if (-not (Test-LocalUser -Username $AccountToRemove)) {
        Write-Log "Account '$AccountToRemove' does not exist on this system" "INFO"
        exit 0
    }
    
    Write-Log "Account '$AccountToRemove' found on system"
    
    # Get account details before removal for logging
    try {
        $userInfo = Get-LocalUser -Name $AccountToRemove
        Write-Log "Account details - Name: $($userInfo.Name), Enabled: $($userInfo.Enabled), LastLogon: $($userInfo.LastLogon)"
    }
    catch {
        Write-Log "Could not retrieve account details: $($_.Exception.Message)" "WARNING"
    }
    
    # Remove user from all groups first
    Write-Log "Removing user from all local groups"
    Remove-UserFromGroups -Username $AccountToRemove
    
    # Remove the user account
    Write-Log "Attempting to remove user account: $AccountToRemove"
    Remove-LocalUser -Name $AccountToRemove -ErrorAction Stop
    
    # Verify removal
    if (-not (Test-LocalUser -Username $AccountToRemove)) {
        Write-Log "Successfully removed account: $AccountToRemove" "SUCCESS"
        
        # Optional: Remove user profile directory if it exists
        $profilePath = "C:\Users\$AccountToRemove"
        if (Test-Path $profilePath) {
            try {
                Remove-Item -Path $profilePath -Recurse -Force -ErrorAction Stop
                Write-Log "Removed user profile directory: $profilePath" "SUCCESS"
            }
            catch {
                Write-Log "Failed to remove user profile directory '$profilePath': $($_.Exception.Message)" "WARNING"
            }
        }
        
        # Clean up registry profile entry
        $profileSID = $null
        try {
            # Get the SID for cleanup (if we can find it in registry)
            $profileList = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*" | 
                          Where-Object { $_.ProfileImagePath -like "*\$AccountToRemove" }
            
            if ($profileList) {
                $profileSID = Split-Path $profileList.PSPath -Leaf
                Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\$profileSID" -Force -ErrorAction Stop
                Write-Log "Cleaned up registry profile entry for SID: $profileSID" "SUCCESS"
            }
        }
        catch {
            Write-Log "Could not clean up registry profile entry: $($_.Exception.Message)" "WARNING"
        }
        
        Write-Log "Account removal completed successfully"
        exit 0
    }
    else {
        Write-Log "Account removal failed - account still exists" "ERROR"
        exit 1
    }
}
catch {
    Write-Log "Critical error during account removal: $($_.Exception.Message)" "ERROR"
    Write-Log "Stack trace: $($_.ScriptStackTrace)" "ERROR"
    exit 1
}

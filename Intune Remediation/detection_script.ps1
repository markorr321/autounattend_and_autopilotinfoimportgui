$userName = "tempadmin"
$Userexist = (Get-LocalUser).Name -Contains $userName
if ($userexist) { 
  Write-Host "$userName exist" 
  Exit 1
} 
Else {
  Write-Host "$userName does not exist"
  Exit 0
}

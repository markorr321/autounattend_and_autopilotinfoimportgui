[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/markorr321/)
[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://x.com/MarkHunterOrr)
[![Medium](https://img.shields.io/badge/Medium-000000?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@markhunterorr)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:markorr321@gmail.com)

---

# 🧰 Autopilot-Ready Windows 11 Deployment (25H2)

## 💡 Overview
This project automates the **end-to-end Autopilot onboarding** process for Windows 11 devices using a custom `autounattend.xml`.  
The unattended setup installs Windows, runs updates, imports the device into Autopilot, and enrolls it into Intune — all **without technician scripting or user interaction**.

### 🎥 Watch the Example Video
[![Watch the Example Video](https://img.youtube.com/vi/90yOurzSGT4/0.jpg)](https://youtu.be/90yOurzSGT4?si=8eL8daCTa03LAy8T)

---

## 🚀 What It Does

With just **three simple touches**:

1. **Boot** from the prepared USB  
2. **Let Windows install** and run the automated setup  
3. **Enter technician credentials** when prompted  

The system then:

- Wipes and installs **Windows 11 25H2**  
- Applies all **Windows Updates**  
- Automatically runs **[Get-WindowsAutoPilotImportGUI](https://github.com/ugurkocde/AutoPilot_Import_GUI)** (integrated directly into the unattended setup)  
- **Imports** the device into **Autopilot**  
- **Enrolls** the device into **Intune**

All of this occurs automatically — no BAT files, no menus, no PowerShell prompts, and no manual steps after image deployment.

---

## 🧑‍💻 Why It Matters

This process eliminates traditional deployment overhead:

- No need for **MDT** or **OSD Cloud**  
- No PowerShell or command-line knowledge required  
- Supports multiple **GroupTags** without multiple USBs  
- Fully **hands-off** after boot — the device completes ESP, reboots, and lands at the Windows 11 sign-in screen ready for end users  

---

## 🖥️ No Babysitting Required

The setup process runs **completely unattended** — there’s **no need to babysit the GUI** or wait manually for profile assignment.  
Once the Autopilot profile is assigned and `Get-WindowsAutoPilotImportGUI` completes the import, the **machine Syspreps itself** and **automatically launches into OOBE (Out-Of-Box Experience)** — ready for **Autopilot self-deployment**.

Technicians don’t need to monitor setup, click through menus, or trigger reboots. Everything from Windows installation to profile assignment to the final OOBE state happens in a single, fully automated flow.

---

## 💾 USB Media Layout & Build Guide

Your USB should be **bootable** and contain both the **Windows 11 ISO files** and your custom `autounattend.xml` at the root.


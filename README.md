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

This process:

- Wipes and installs **Windows 11 25H2**  
- Applies all **Windows Updates**  
- Automatically runs **[Get-WindowsAutoPilotImportGUI](https://github.com/ugurkocde/AutoPilot_Import_GUI)** (integrated directly into the unattended setup)  
- **Imports** the device into **Autopilot**  
- **Enrolls** the device into **Intune**

All of this occurs with just two touches! — no BAT files, no code, no PowerShell prompts, and no manual steps after image deployment.

---

## 🧑‍💻 Why It Matters

This process eliminates traditional deployment overhead:

- No need for **MDT** or **OSD Cloud**  
- No PowerShell or command-line knowledge required  
- Supports multiple **GroupTags** without multiple USBs  
- Only two touches required — one to boot from the USB drive, and one to enter the GroupTag and technician credentials. After that, the process is fully automated: the device completes ESP (Self Deploy Mode), reboots, and lands at the Windows 11 sign-in screen ready for end users.

---

## 💾 USB Media Layout & Build Guide

Your USB should be **bootable** and contain both the **Windows 11 ISO files** and your custom `autounattend.xml` at the root.

![USB Structure](https://github.com/markorr321/autounattend_and_autopilotinfoimportgui/blob/main/images/USB%20Structure.png)

> ⚙️ **Note:**  
> The `autounattend.xml` file must be placed in the **root directory** of the USB drive for Windows Setup to detect and run it automatically.

---

### 🪟 Creating the Bootable USB

#### Use Rufus (Recommended)
1. Download and open [Rufus](https://rufus.ie).  
2. Select your Windows 11 ISO.  
3. Under **Partition scheme**, choose **GPT** (for UEFI systems).  
4. Click **Start** to create the bootable media.  
5. Once complete, copy your `autounattend.xml` file to the **root** of the USB.


Your USB should be **bootable** and contain both the **Windows 11 ISO files** and your custom `autounattend.xml` at the root.


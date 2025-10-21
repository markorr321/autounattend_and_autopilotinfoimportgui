# 🧰 Autopilot-Ready Windows 11 Deployment (25H2)

## 💡 Overview
This project automates the **end-to-end Autopilot onboarding** process for Windows 11 devices using a custom `autounattend.xml`.  
The unattended setup installs Windows, runs updates, imports the device into Autopilot, and enrolls it into Intune — all **without technician scripting or user interaction**.

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

## 🙏 Inspiration & Credits

- **[Steven Weiner](https://www.linkedin.com/in/stevew25/)** — collaboration and early Autopilot deployment work (2019)  
- **[Jon Towles](https://www.linkedin.com/in/jontowles/)** — for the idea to leverage `autounattend.xml` for Autopilot automation  
- **[Ugur Koc](https://www.linkedin.com/in/ugurkocde/)** — creator of [Get-WindowsAutoPilotImportGUI](https://github.com/ugurkocde/AutoPilot_Import_GUI), integrated here for a seamless, no-code import experience  

---

### 🖋️ Author
Created by **Mark Orr** — inspired by past work modernized for today’s Autopilot environments.  

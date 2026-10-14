# Data Science (BIT 2118)

A data science and scientific computing environment configured with key Python packages including NumPy, SciPy, Matplotlib, and Pillow.

---

## Table of Contents
- [Prerequisites](#prerequisites)
- [Ubuntu / Linux Setup](#ubuntu--linux-setup)
- [Windows Setup](#windows-setup)
- [Verification](#verification)
- [Deactivating the Environment](#deactivating-the-environment)
- [Troubleshooting & Tips](#troubleshooting--tips)
- [Key Packages Included](#key-packages-included)

---

## Prerequisites

Ensure you have Git installed to clone and manage the repository:
- **Ubuntu/Debian**: `sudo apt install git -y`
- **Windows**: Download from [git-scm.com](https://git-scm.com/) or run `winget install --id Git.Git -e --source winget`

Clone the repository and enter the directory:
```bash
git clone <repository-url>
cd bit2118
```

---

## 🐧 Ubuntu / Linux Setup

Follow these steps on Ubuntu or Debian-based distributions:

### 1. Update Package List & Install Python

Install Python 3, pip, and the virtual environment module:
```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv -y
```

### 2. Create a Virtual Environment

Create an isolated virtual environment named `.venv`:
```bash
python3 -m venv .venv
```

### 3. Activate the Virtual Environment

Activate the environment in your shell:
```bash
source .venv/bin/activate
```

*(Your terminal prompt should now show `(.venv)`).*

### 4. Install Dependencies

Upgrade `pip` and install all required libraries:
```bash
python3 -m pip install --upgrade pip
pip install -r Requirements.txt
```

---

## 🪟 Windows Setup

Follow these steps on Windows using **PowerShell** or **Command Prompt (CMD)**:

### 1. Install Python

- **Via winget (Recommended)**:
  Open PowerShell and run:
  ```powershell
  winget install Python.Python.3.12
  ```
- **Via Official Installer**:
  Download the installer from [python.org](https://www.python.org/downloads/).
  > **Important**: During installation, check the box **"Add python.exe to PATH"** before clicking *Install Now*.

### 2. Create a Virtual Environment

Open PowerShell or CMD in the project folder and run:
```powershell
python -m venv .venv
```

*(If `python` is not recognized, try `py -m venv .venv`)*

### 3. Activate the Virtual Environment

- **PowerShell**:
  ```powershell
  .\.venv\Scripts\Activate.ps1
  ```
  > *If you encounter a script execution policy error, see the [Troubleshooting](#troubleshooting--tips) section below.*

- **Command Prompt (CMD)**:
  ```cmd
  .\.venv\Scripts\activate.bat
  ```

*(Your terminal prompt will now show `(.venv)`).*

### 4. Install Dependencies

Upgrade `pip` and install all required libraries:
```powershell
python -m pip install --upgrade pip
pip install -r Requirements.txt
```

---

## Verification

To verify that the environment and packages are properly installed, run:

```bash
python -c "import numpy, scipy, matplotlib; print('Data Science environment configured successfully!')"
```

If it prints `Data Science environment configured successfully!`, your setup is complete.

---

## Deactivating the Environment

When you are finished working, deactivate the virtual environment on either operating system:
```bash
deactivate
```

---

## Troubleshooting & Tips

### Ubuntu: `ensurepip is not available` error
If creating the virtual environment fails with an `ensurepip` error, install the Python venv package explicitly:
```bash
sudo apt install python3-venv -y
```

### Windows PowerShell: `Execution_Policies` script error
If running `.\.venv\Scripts\Activate.ps1` gives a script execution policy error (`PSSecurityException`), enable script execution for the current session:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
```
Then rerun the activation command:
```powershell
.\.venv\Scripts\Activate.ps1
```

### Case Sensitivity of Requirements File
Note that the file name is `Requirements.txt` (with a capital `R`). On Linux/Ubuntu, filenames are case-sensitive, so always run:
```bash
pip install -r Requirements.txt
```

---

## Key Packages Included

| Package | Version | Description |
| :--- | :--- | :--- |
| **NumPy** | `2.5.3` | Fundamental package for scientific computing with arrays |
| **SciPy** | `1.18.1` | Advanced mathematics, science, and engineering algorithms |
| **Matplotlib** | `3.11.2` | Comprehensive library for static, animated, and interactive visualizations |
| **Pillow** | `12.3.0` | Python Imaging Library (PIL fork) for image processing |


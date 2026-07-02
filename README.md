# System Disk Health Monitor (`disk_monitor.sh`)

A lightweight, automated Bash script designed to parse filesystem metrics, evaluate storage thresholds, and provide real-time, color-coded terminal alerts regarding system disk health. 

This is the **first project** in a series of five hands-on automation and systems engineering utilities developed following the completion of the Hack The Box (HTB) Bash scripting module.

---

## 🚀 Features

* **Clean Metrics Parsing:** Filters out irrelevant virtual filesystems (`tmpfs`, `none`) using `df` flags and cleanly strips trailing percentage symbols for precise numerical evaluation.
* **Threshold-Based Alerting:** Dynamically evaluates if any mounted partition exceeds an **80% disk utilization threshold**.
* **Visual Status Indicators:** Employs ANSI escape sequences to output high-visibility, color-coded alerts:
    * `\033[0;32mSystem health nominal\033[0m` (Green)
    * `\033[1;31mDisk usage is above 80%\033[0m` (Bold Red)

---

## 🛠️ How It Works

The script executes the following pipeline:
1. **Extracts** filesystem storage statistics while omitting non-physical file systems.
2. **Iterates** through each partition, using string manipulation to isolate the raw integer value of the disk usage percentage.
3. **Evaluates** the integer against the critical 80% metric.
4. **Outputs** structured data logs alongside status alerts to stdout.

---

## 📂 Getting Started

### Prerequisites
* A Linux environment (WSL2, local VM, or bare metal).
* Standard `coreutils` utilities (`df`, `tail`, `bash`).

### Installation & Execution
1. Clone your project repository or copy the script file.
2. Make the script executable:
   ```bash
   chmod +x disk_monitor.sh
3. Run the script natively:
    ```bash
    ./disk_health

# Secure User Provisioning Utility (`create_user.sh`)

An administrative identity management script built to automate the secure provisioning of local Linux users. It validates execution environments, prevents user namespace account duplication, and enforces immediate password aging policies to maximize baseline OS security.

---

## 🚀 Features

* **Privilege Guardrails:** Enforces root or administrative constraints by checking the effective User ID (`$EUID`), ensuring configuration attempts from standard contexts exit early before breaking.
* **Account Collision Interception:** Runs an active dynamic loop backed by `getent passwd` that prompts for input until a completely unique username is passed, gracefully avoiding filesystem overwrites.
* **Automated Password Hardening:** Leverages `openssl` to inject an unpredictable 12-character base64 random password directly to `chpasswd`.
* **Instant Account Aging:** Pairs creation with immediate password expiration (`chage -d 0`), forcing the newly minted user to change their password on their first SSH or console login session.

---

## 🛠️ How It Works

The script executes the following pipeline:
1. **Validates** root privileges and ensures a positional runtime argument (`$1`) is supplied.
2. **Queries** the centralized password databases via `getent passwd` to look up namespace conflicts.
3. **Creates** the new system account along with its clean home directory infrastructure via `useradd -m`.
4. **Generates** and pipes a cryptographically random credentials sequence to the target profile.
5. **Expires** the account status instantly to secure day-one resource handoffs.

---

## 📂 Getting Started

### Prerequisites
* A Linux environment (WSL2, local VM, or bare metal).
* Standard `coreutils` utilities and `openssl` package installed.

### Installation & Execution
1. Clone your project repository or copy the script file.
2. Make the script executable:
   ```bash
   chmod +x create_user.sh
3. Run the utility with administrative privileges:
    ```bash
    sudo ./create_user.sh <username>
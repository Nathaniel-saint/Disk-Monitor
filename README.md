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
3. Run the script
    ```
    bash sys_health.sh
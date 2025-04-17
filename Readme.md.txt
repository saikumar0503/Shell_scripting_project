# 🖥️ Server Health Monitoring Tool (Shell Script)

A lightweight and simple Bash script to monitor the health of a Linux server by tracking CPU usage, memory usage, disk space, and essential services. Alerts are triggered based on threshold values and logs are stored for analysis.

---

## 📌 Features

- ✅ CPU Load Monitoring
- ✅ Memory Usage Monitoring
- ✅ Disk Usage Monitoring
- ✅ Service Status Checks (e.g., `sshd`, `nginx`)
- ✅ Threshold-based Alert System
- ✅ Timestamped Logging
- ✅ Email Notifications (Optional)
- ✅ Scheduled Execution via Cron

---

## 📁 Files Included

- `server_monitor.sh` – Main monitoring script
- `logs/` – Directory where logs will be stored (create manually if needed)
- `README.md` – Project overview and setup instructions

---

## ⚙️ Prerequisites

- Bash Shell
- Linux OS (Ubuntu, CentOS, etc.)
- `mail` utility (for email alerts)
- `cron` (for scheduling)

---

## 🚀 How to Use

1. **Clone the repository**  
```bash
git clone https://github.com/your-username/server-health-monitor.git
cd server-health-monitor


# Server Health Monitoring – Cron Job + Email Report

This guide walks you through setting up a **Linux cron job** that checks the health of your server, generates a report, and **sends it to your email** every 2 minutes.

## What This Does

- Runs a health check script
- Captures system info like memory, disk, uptime, firewall, upgrades, etc.
- Stores the output in a `.txt` file
- Sends the file to your email address using `mailutils`
- Cleans up the file after sending
- Automatically runs every 2 minutes via `cron`

## Requirements

Before you begin, make sure you have:

- Ubuntu/Debian server
- Root or sudo access
- Access to port 25 (for outgoing mail)
- Your email address ready

## Step 1: Install Required Tools

### Install `mailutils` for sending emails:

```bash
sudo apt update
sudo apt install mailutils -y
```

📌 During installation, choose **"Internet Site"** when prompted.

Install additional tools (if missing):

```bash
sudo apt install net-tools ufw -y
```

## Step 2: Configure SMTP (msmtp)

### Install and configure `msmtp` to send emails via Gmail:

First, install `msmtp`:

```bash
sudo apt install msmtp msmtp-mta
```

### Configuration File:

Create the `msmtprc` configuration file at `/etc/msmtprc` with the following content:

```bash
# /etc/msmtprc

defaults
auth           on
tls            on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile        /var/log/msmtp.log

account        gmail
host           smtp.gmail.com
port           587
from           saikumarbalaga03@gmail.com
user           saikumarbalaga03@gmail.com
password       your_16_char_app_password

account default : gmail
```

**Replace `your_16_char_app_password` with the App Password you generated in Gmail.**

Set the correct permissions for the configuration file:

```bash
sudo chmod 600 /etc/msmtprc
```

### Test Email Delivery:

```bash
echo "This is a test email from your Ubuntu server using msmtp." | mail -s "SMTP Test" saikumarbalaga03@gmail.com
```

Check your inbox. If not received, check the log:

```bash
cat /var/log/msmtp.log
```

## Step 3: Set Up Cron Job (Every 2 Minutes)

Edit the crontab:

```bash
crontab -e
```

Add this line to run the script every 2 minutes:

```bash
*/2 * * * * /root/sai.sh >> /var/log/server_health.log 2>&1
```

This will also log the script's output and errors to `/var/log/server_health.log`.

## Step 4: Email Delivery Tips

- By default, mail is sent using local mail transfer agents (like `postfix` or `sendmail`).
- Make sure **port 25 is not blocked** by your cloud provider.
- Check `/var/log/mail.log` for delivery issues:
  ```bash
  tail -f /var/log/mail.log
  ```

## Step 5: Test the Script Manually

Run it once to check everything works:

```bash
/root/sai.sh
```

You should receive an email with a `.txt` attachment containing your server's health status.

## Notes

- The script automatically deletes the output file after emailing.
- Make sure to use **absolute paths** in cron jobs.
- You can change the service being monitored inside the script (e.g., `apache2`, `ssh`, etc.)

## Example Tools Used in Script

- `free -m`: for memory usage
- `uptime -p`: system uptime
- `df -h`: disk usage
- `who`: logged-in users
- `ufw status`: firewall status
- `apt list --upgradable`: pending updates
- `netstat -tuln`: open ports
- `systemctl status`: service status

## Security Tip

Avoid sending sensitive server data over email unencrypted. For production systems, consider using an encrypted relay like Gmail SMTP or Amazon SES with authentication.

## Contact

Maintained by **Sai Kumar**  
📧 Email: saikumarbalaga03@gmail.com

Enjoy monitoring your server like a pro! 🚀

https://roadmap.sh/projects/log-archive-tool
# 🗂️ Log Archive CLI Tool

A simple command-line utility for archiving system log files by compressing them into a timestamped archive.
This tool helps keep systems clean while preserving logs for future reference.

---

## 📌 Features

* Run directly from the command line
* Accepts a log directory as an argument
* Compresses logs into a `.tar.gz` archive
* Stores archives in a separate directory
* Adds timestamps to archive filenames
* Records archive date and time in a log file

---

## 🛠️ Requirements

* Unix-based operating system (Linux or macOS)
* `bash` shell
* `tar` utility
* Sufficient permissions to read the log directory

---

## 🚀 Installation

### 1️⃣ Clone or download the project

```bash
git clone <your-repository-url>
cd devopprj
```

### 2️⃣ Make the script executable

```bash
chmod +x log-archive
```

### 3️⃣ (Optional) Make it available system-wide

```bash
sudo mv log-archive /usr/local/bin/
sudo chmod +x /usr/local/bin/log-archive
```

---

## ▶️ Usage

```bash
log-archive <log-directory>
```

### Example

```bash
log-archive /var/log
```

---

## 📦 Output

Archives are stored in the following directory:

```text
~/log_archives/
├── logs_archive_YYYYMMDD_HHMMSS.tar.gz
└── archive.log
```

### Example Archive Name

```text
logs_archive_20240816_100648.tar.gz
```

---

## 📝 Archive Log

Each archive operation is recorded in:

```text
~/log_archives/archive.log
```

Example entry:

```text
Fri Aug 16 10:06:48 UTC 2024 - Archived /var/log to logs_archive_20240816_100648.tar.gz
```

---

## ⚠️ Notes (macOS Users)

When archiving system directories such as `/var/log`, macOS may display warnings related to extended file attributes:

```text
tar: Couldn't list extended attributes: Permission denied
```

These warnings do **not** affect the archive creation.
To suppress them, the script uses the `--no-xattrs` option.

---

## ⏱️ Automating with Cron (Optional)

You can schedule the tool to run automatically using `cron`.

Example: Archive `/var/log` daily at midnight

```bash
0 0 * * * log-archive /var/log
```

---

## 🔧 Project Structure

```text
devopprj/
├── log-archive
└── README.md
```

---

## 📈 Future Improvements

* Email notifications after archiving
* Upload archives to cloud storage (S3, Google Drive)
* Remote server backups via SCP
* Log rotation and cleanup
* Configuration file support
# 📊 Nginx Log Analyser (Shell Script)

A simple shell script that analyzes an Nginx access log file and displays the top statistics such as IP addresses, requested paths, response status codes, and user agents.

This project is based on the **roadmap.sh – https://roadmap.sh/projects/nginx-log-analyser
---

## 🎯 Features

The script analyzes an Nginx access log file and provides:

* Top 5 IP addresses with the most requests
* Top 5 most requested paths
* Top 5 response status codes
* Top 5 user agents

---

## 🛠️ Requirements

* Unix-based operating system (Linux or macOS)
* `bash` shell
* Standard Unix utilities:

  * `awk`
  * `sort`
  * `uniq`
  * `head`
  * `grep` (optional)
* Internet connection (to download the sample log file)

---

## 📥 Download Sample Log File

This project uses a sample Nginx access log file.

Download the log file using:

```bash
curl -o access.log https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/nginx_logs/nginx_logs
```

Verify that the file exists:

```bash
ls -l access.log
```

---

## 🚀 Installation

### 1️⃣ Clone the repository or create the script file

```text
nginx-log-analyser.sh
```

---

### 2️⃣ Make the script executable

```bash
chmod +x nginx-log-analyser.sh
```

---

## ▶️ Usage

```bash
./nginx-log-analyser.sh <log-file>
```

### Example

```bash
./nginx-log-analyser.sh access.log
```

---

## 📤 Example Output

```text
Top 5 IP addresses with the most requests:
216.46.173.126 - 2350 requests
180.179.174.219 - 1720 requests
204.77.168.241 - 1439 requests
65.39.197.164 - 1365 requests
80.91.33.133 - 1202 requests

Top 5 most requested paths:
/downloads/product_1 - 30285 requests
/downloads/product_2 - 21104 requests
/downloads/product_3 - 73 requests

Top 5 response status codes:
404 - 33876 requests
304 - 13330 requests
200 - 4028 requests
206 - 186 requests
403 - 38 requests

Top 5 user agents:
Debian - 11830 requests
Debian - 11365 requests
Debian - 6719 requests
Debian - 5740 requests
Debian - 3855 requests
```

---

## 🧠 How It Works

* `awk` extracts specific fields from the log file
* `sort` orders the data
* `uniq -c` counts occurrences
* `head -5` selects the top five results

Each section processes the log file independently to generate the statistics.

---

## 📂 Project Structure

```text
devopprj/
├── nginx-log-analyser.sh
├── access.log
└── README.md
```

---

## 🧪 Notes

* The script assumes a **standard Nginx access log format**
* Large log files may take longer to process
* The script is read-only and does not modify the log file

---

## 🌱 Future Improvements (Optional)

* Support custom Nginx log formats
* Export results to CSV or JSON
* Add filtering by date or status code
* Implement an interactive CLI interface

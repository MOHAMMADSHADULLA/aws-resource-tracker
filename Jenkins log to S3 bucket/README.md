# 📦 Jenkins Build Log Archiver — Automated CI/CD Log Upload to AWS S3

> A Bash automation script that **automatically collects today's Jenkins build logs** from all jobs and **uploads them to an AWS S3 bucket** — enabling centralized, durable, and cost-effective log storage for CI/CD pipelines.

---

## 🧠 The Problem It Solves

In a real DevOps environment, Jenkins generates build logs for every pipeline run. These logs:

- **Pile up on the server** consuming local disk space over time
- Are **lost if the Jenkins server crashes** or is restarted
- Are **hard to audit** when stored only locally across multiple jobs

This script solves all three problems by **automatically archiving today's build logs to AWS S3** — making them safe, accessible, and easy to manage long-term.

---

## 🏗️ How It Works — Plain English

Think of this script as a **daily log courier**. Every time it runs, it does the following:

```
1. Opens the Jenkins home directory
2. Loops through every job (e.g., build-app, deploy-staging, run-tests)
3. For each job, checks all its build folders
4. Finds builds whose log file was created TODAY
5. Uploads each matching log file to your S3 bucket
6. Names the file as: <job-name>-<build-number>.log for easy identification
7. Reports success or failure for every upload
```

No logs from yesterday. No duplicates. Just today's fresh builds — automatically.

---

## 🔁 Visual Flow

```
Jenkins Server
│
├── /var/lib/jenkins/jobs/
│   ├── build-app/
│   │   └── builds/
│   │       ├── 45/log  ← today? → Upload ✅
│   │       └── 44/log  ← not today? → Skip ⏭️
│   │
│   ├── deploy-staging/
│   │   └── builds/
│   │       └── 12/log  ← today? → Upload ✅
│   │
│   └── run-tests/
│       └── builds/
│           └── 30/log  ← today? → Upload ✅
│
└── Uploaded to S3 →  s3://your-bucket/
                          ├── build-app-45.log
                          ├── deploy-staging-12.log
                          └── run-tests-30.log
```

---

## ⚙️ Prerequisites

Before using this script, make sure the following are in place:

| Requirement | How to Check |
|---|---|
| **AWS CLI installed** | Run `aws --version` in terminal |
| **AWS CLI configured** | Run `aws configure` and enter Access Key, Secret Key, Region |
| **S3 bucket exists** | Create one via AWS Console or `aws s3 mb s3://your-bucket-name` |
| **Jenkins installed** | Script targets `/var/lib/jenkins` by default |
| **IAM permissions** | Your AWS user/role must have `s3:PutObject` permission on the bucket |

---

## 🛠️ Configuration

Before running, open the script and update these two variables at the top:

```bash
JENKINS_HOME="/var/lib/jenkins"        # ← Path to your Jenkins home directory
S3_BUCKET="s3://your-s3-bucket-name"  # ← Your actual S3 bucket name
```

**Example:**
```bash
JENKINS_HOME="/var/lib/jenkins"
S3_BUCKET="s3://my-company-jenkins-logs"
```

---

## 🚀 Setup & Usage

### Step 1 — Clone the repository

```bash
git clone https://github.com/MOHAMMADSHADULLA/Shell-Script-Projects.git
cd "Shell-Script-Projects/Jenkins log to S3 bucket"
```

### Step 2 — Make the script executable

```bash
chmod +x upload_jenkins_build_logs.sh
```

### Step 3 — Run the script

```bash
./upload_jenkins_build_logs.sh
```

### Sample Output

```
Uploaded: build-app/45 to s3://my-jenkins-logs/build-app-45.log
Uploaded: deploy-staging/12 to s3://my-jenkins-logs/deploy-staging-12.log
Failed to upload: run-tests/30
```

---

## ⏰ Automate with Cron (Recommended)

To run this script automatically every day at midnight, add a cron job:

```bash
# Open the crontab editor
crontab -e

# Add this line — runs at 11:59 PM every day
59 23 * * * /path/to/upload_jenkins_build_logs.sh >> /var/log/jenkins_s3_upload.log 2>&1
```

This makes the archiving **fully hands-free** — logs are uploaded every night without any manual effort.

---

## 🔍 S3 File Naming Convention

Each uploaded file follows a clear, searchable naming pattern:

```
<job-name>-<build-number>.log
```

| Example File Name | Job | Build # |
|---|---|---|
| `build-app-45.log` | build-app | 45 |
| `deploy-staging-12.log` | deploy-staging | 12 |
| `run-tests-30.log` | run-tests | 30 |

This makes it easy to **search, filter, and audit** specific builds directly inside S3 or via AWS CLI.

---

## 🛡️ Error Handling

| Scenario | What the Script Does |
|---|---|
| AWS CLI not installed | Prints an error message and exits immediately |
| Log file doesn't exist | Skips that build silently |
| Log file is from a previous day | Skips it — only today's logs are uploaded |
| S3 upload fails | Prints `"Failed to upload: <job>/<build>"` and continues with the rest |

---

## 💡 Skills Demonstrated

| Skill | Details |
|---|---|
| **CI/CD Knowledge** | Understands Jenkins job and build directory structure |
| **AWS S3 Integration** | Uses `aws s3 cp` with error suppression and exit code checks |
| **Bash Scripting** | Nested loops, date filtering, conditional checks, exit handling |
| **DevOps Best Practices** | Log archiving, disk space management, automation mindset |
| **Cron Scheduling** | Designed for unattended, scheduled daily execution |

---

## 📁 Project Structure

```
Shell-Script-Projects/
└── Jenkins log to S3 bucket/
    └── upload_jenkins_build_logs.sh   ← Main automation script
```

---

## 👤 Author

**Mohammad Shadulla**  
B.Tech — Artificial Intelligence & Data Science  
DevOps & Cloud Engineering Enthusiast | Immediate Joiner

🔗 [GitHub](https://github.com/MOHAMMADSHADULLA)

---

## 📄 License

This project is open-source under the [MIT License](LICENSE).

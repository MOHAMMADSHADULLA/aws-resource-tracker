# aws-resource-tracker.sh
# 🛠️ AWS Resource Tracker

> A lightweight Bash script to audit and report active AWS resources across your account — covering S3, EC2, Lambda, and IAM Users — in a single command.

![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS-FF9900?style=flat-square&logo=amazonaws&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Usage](#-usage)
- [Sample Output](#-sample-output)
- [AWS Services Covered](#-aws-services-covered)
- [Project Structure](#-project-structure)
- [Author](#-author)

---

## 📌 Overview

**AWS Resource Tracker** is a DevOps automation shell script that leverages the AWS CLI to quickly list and audit active cloud resources in your AWS account. It is designed for cloud engineers and DevOps practitioners who need a fast, no-frills inventory of their AWS environment without navigating the AWS Console.

This script is ideal for:
- **Cost auditing** — spot unused or forgotten resources
- **Security reviews** — quickly enumerate IAM users
- **Environment health checks** — verify deployed EC2 instances, Lambda functions, and S3 buckets

---

## ✨ Features

- 📦 Lists all **S3 Buckets** in the account
- 🖥️ Lists all **EC2 Instance IDs** across reservations
- ⚡ Lists all **Lambda Functions**
- 👤 Lists all **IAM Users**
- 🔍 Uses `jq`/`jp` for clean, structured JSON parsing of EC2 output
- ⚙️ Runs with `set -x` for full execution tracing and easy debugging

---

## ✅ Prerequisites

Before running this script, ensure the following are installed and configured on your system:

| Tool | Purpose | Install |
|------|---------|---------|
| `bash` | Script runtime | Pre-installed on Linux/macOS |
| `aws cli` | AWS API interaction | [Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) |
| `jp` / `jq` | JSON query parsing | `sudo apt install jq` or [jp releases](https://github.com/jmespath/jp/releases) |

**AWS Authentication** — configure credentials before running:

```bash
aws configure
```

You will be prompted to enter:
- AWS Access Key ID
- AWS Secret Access Key
- Default region (e.g., `us-east-1`)
- Output format (e.g., `json`)

> **Note:** The IAM user/role used must have at minimum read-only permissions for S3, EC2, Lambda, and IAM.

---

## 📥 Installation

**Clone the repository:**

```bash
git clone https://github.com/MOHAMMADSHADULLA/aws-resource-tracker.git
cd aws-resource-tracker
```

**Make the script executable:**

```bash
chmod +x aws-resource-tracker.sh
```

---

## ▶️ Usage

Run the script directly:

```bash
./aws-resource-tracker.sh
```

Or execute with bash explicitly:

```bash
bash aws-resource-tracker.sh
```

> The script runs with `set -x`, so each command is printed before execution — useful for debugging and understanding what the script is doing at each step.

---

## 📤 Sample Output

```
+ echo 'Print list of S3 Buckets'
Print list of S3 Buckets
+ aws s3 ls
2024-01-10 10:23:45 my-project-bucket
2024-03-15 08:00:00 logs-archive-bucket

+ echo 'print list of EC2 Instances'
print list of EC2 Instances
+ aws ec2 describe-instances
[
  "i-0a1b2c3d4e5f6g7h8",
  "i-0z9y8x7w6v5u4t3s2"
]

+ echo 'Print list of Lambda Functions'
Print list of Lambda Functions
+ aws lambda list-functions
{
    "Functions": [ ... ]
}

+ echo 'Print list of IAM users'
Print list of IAM users
+ aws iam list-users
{
    "Users": [ ... ]
}
```

---

## ☁️ AWS Services Covered

| Service | AWS CLI Command | Description |
|---------|----------------|-------------|
| **S3** | `aws s3 ls` | Lists all S3 buckets in the account |
| **EC2** | `aws ec2 describe-instances` | Retrieves all EC2 instance IDs |
| **Lambda** | `aws lambda list-functions` | Lists all Lambda functions |
| **IAM** | `aws iam list-users` | Lists all IAM users |

---

## 📁 Project Structure

```
aws-resource-tracker/
├── aws-resource-tracker.sh   # Main tracking script
└── README.md                 # Project documentation
```

---

## 🔒 Required IAM Permissions

The executing IAM user or role must have the following minimum permissions:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListAllMyBuckets",
        "ec2:DescribeInstances",
        "lambda:ListFunctions",
        "iam:ListUsers"
      ],
      "Resource": "*"
    }
  ]
}
```

---

## 🚀 Future Enhancements

- [ ] Add support for **RDS instances**
- [ ] Add support for **VPCs and Security Groups**
- [ ] Export output to a **timestamped log file**
- [ ] Integrate with **SNS** for email/Slack notifications
- [ ] Add **region-wise resource filtering**
- [ ] Schedule via **cron job** for periodic reports

---

## 👨‍💻 Author

**Mohammad Shadulla**  
B.Tech — Artificial Intelligence & Data Science  
CMR Institute of Technology, Hyderabad

[![GitHub](https://img.shields.io/badge/GitHub-MOHAMMADSHADULLA-181717?style=flat-square&logo=github)](https://github.com/MOHAMMADSHADULLA)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).  
Feel free to use, modify, and distribute this script with attribution.

---

> ⭐ If you found this project useful, consider giving it a star on GitHub!


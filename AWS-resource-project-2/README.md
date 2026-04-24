# 🛠️ AWS Resource Lister — Automated Cloud Inventory Script

> A production-style Bash automation script that lists AWS cloud resources across **14 services** using the AWS CLI — built to reduce manual effort in cloud infrastructure auditing and monitoring.

---

## 📌 Project Overview

Managing AWS infrastructure manually is time-consuming and error-prone. This script solves that by providing a **single command** to instantly list resources for any supported AWS service in any region — no console login required.

This project demonstrates hands-on skills in:
- ☁️ AWS Cloud Services (EC2, S3, Lambda, RDS, IAM, and more)
- 🐚 Bash Scripting & Shell Automation
- 🔧 AWS CLI usage and configuration
- ✅ Input validation and error handling

---

## ⚙️ Supported AWS Services

| # | Service | What It Lists |
|---|---|---|
| 1 | **EC2** | Running/stopped instances |
| 2 | **RDS** | Database instances |
| 3 | **S3** | Storage buckets |
| 4 | **CloudFront** | CDN distributions |
| 5 | **VPC** | Virtual Private Clouds |
| 6 | **IAM** | Users and access policies |
| 7 | **Route53** | DNS hosted zones |
| 8 | **CloudWatch** | Monitoring alarms |
| 9 | **CloudFormation** | Infrastructure stacks |
| 10 | **Lambda** | Serverless functions |
| 11 | **SNS** | Notification topics |
| 12 | **SQS** | Message queues |
| 13 | **DynamoDB** | NoSQL tables |
| 14 | **EBS** | Storage volumes |

---

## 🚀 How to Use

### Prerequisites

Before running the script, make sure you have:

- ✅ **AWS CLI** installed → [Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- ✅ **AWS CLI configured** with valid credentials → run `aws configure`
- ✅ **Bash** shell (Linux / macOS / WSL on Windows)

### Setup

```bash
# 1. Clone the repository
git clone https://github.com/MOHAMMADSHADULLA/Shell-Script-Projects.git

# 2. Navigate to the project folder
cd Shell-Script-Projects/AWS-resource-project-2

# 3. Give execute permission
chmod +x AWS-resource-project-2.sh
```

### Run the Script

```bash
./AWS-resource-project-2.sh <aws_region> <aws_service>
```

### Examples

```bash
# List all EC2 instances in US East (N. Virginia)
./AWS-resource-project-2.sh us-east-1 ec2

# List all S3 buckets
./AWS-resource-project-2.sh us-east-1 s3

# List all Lambda functions in Mumbai region
./AWS-resource-project-2.sh ap-south-1 lambda

# List all DynamoDB tables in Europe
./AWS-resource-project-2.sh eu-west-1 dynamodb
```

---

## 🔍 How It Works — Step by Step

```
User runs script with region + service
        ↓
Script validates: Are 2 arguments provided?
        ↓
Script checks: Is AWS CLI installed?
        ↓
Script checks: Is AWS CLI configured (~/.aws exists)?
        ↓
Script matches the service using a case statement
        ↓
Runs the appropriate AWS CLI command for that service
        ↓
Outputs the resource list to the terminal
```

---

## 🛡️ Built-in Error Handling

The script includes **3 levels of validation** before executing any AWS command:

| Check | What It Does |
|---|---|
| **Argument Validation** | Exits with usage instructions if region or service is missing |
| **AWS CLI Check** | Alerts the user if AWS CLI is not installed |
| **Config Check** | Alerts if AWS credentials/config are not set up (`~/.aws` missing) |

---

## 📁 Project Structure

```
Shell-Script-Projects/
└── AWS-resource-project-2/
    └── AWS-resource-project-2.sh   ← Main automation script
```

---

## 💡 Skills Demonstrated

| Skill | Details |
|---|---|
| **AWS CLI** | Used 14+ CLI commands across core AWS services |
| **Bash Scripting** | Arguments, conditionals, case statements, error handling |
| **Cloud Awareness** | Understands EC2, S3, Lambda, IAM, VPC, RDS, and more |
| **DevOps Mindset** | Automates repetitive cloud audit tasks |
| **Input Validation** | Prevents script failure with 3-layer pre-execution checks |

---

## 👤 Author

**Mohammad Shadulla**  
B.Tech — Artificial Intelligence & Data Science  
DevOps & Cloud Engineering Enthusiast | Immediate Joiner

🔗 [GitHub](https://github.com/MOHAMMADSHADULLA)

---

## 📄 License

This project is open-source under the [MIT License](LICENSE).

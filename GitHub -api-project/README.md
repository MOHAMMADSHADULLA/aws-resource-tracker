# GitHub Repository Collaborator Access Checker

A Bash script that uses the **GitHub REST API** to list all users who have **read (pull) access** to a given GitHub repository.

---

## 📋 Description

This script authenticates with the GitHub API using a personal access token and fetches the list of collaborators for a specified repository. It filters and displays only those users who have **pull (read) access**.

---

## 🛠️ Prerequisites

Make sure the following tools are installed on your system:

- `bash` (v4+)
- `curl`
- `jq`

---

## ⚙️ Setup

### 1. Clone the repository

```bash
git clone https://github.com/MOHAMMADSHADULLA/Shell-Script-Projects.git
cd Shell-Script-Projects/GitHub\ -api-project
```

### 2. Set environment variables

The script reads your GitHub credentials from environment variables:

```bash
export username="your_github_username"
export token="your_github_personal_access_token"
```

> **Note:** To generate a Personal Access Token (PAT), go to:
> GitHub → Settings → Developer settings → Personal access tokens → Generate new token
> Make sure to grant the `repo` scope.

### 3. Make the script executable

```bash
chmod +x list-user.sh
```

---

## 🚀 Usage

```bash
./list-user.sh <REPO_OWNER> <REPO_NAME>
```

### Arguments

| Argument | Description |
|---|---|
| `REPO_OWNER` | GitHub username or organization that owns the repository |
| `REPO_NAME` | Name of the repository |

### Example

```bash
./list-user.sh MOHAMMADSHADULLA Shell-Script-Projects
```

### Sample Output

```
Listing users with read access to MOHAMMADSHADULLA/Shell-Script-Projects...
Users with read access to MOHAMMADSHADULLA/Shell-Script-Projects:
user1
user2
```

If no collaborators are found:

```
No users with read access found for MOHAMMADSHADULLA/Shell-Script-Projects.
```

---

## 🔍 How It Works

1. Accepts `REPO_OWNER` and `REPO_NAME` as command-line arguments.
2. Makes an authenticated GET request to the GitHub API endpoint:
   ```
   GET /repos/{owner}/{repo}/collaborators
   ```
3. Parses the JSON response using `jq` and filters users where `permissions.pull == true`.
4. Prints the list of usernames with read access, or an appropriate message if none are found.

---

## 📁 Project Structure

```
Shell-Script-Projects/
└── GitHub -api-project/
    └── list-user.sh
```

---

## ⚠️ Notes

- Your GitHub token must have sufficient permissions (`repo` scope) to access collaborator information.
- This script works for both **public and private** repositories, provided the token has access.
- Collaborator data is only available to repository admins or organization owners.

---

## 👤 Author

**Mohammad Shadulla**
[GitHub Profile](https://github.com/MOHAMMADSHADULLA)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

# ArgoCD Application RepoURL Patch Script

This script automates updating the `repoURL` and `path` fields of multiple ArgoCD Applications using `kubectl patch`. Application names are read from a plain text file (`app.txt`), making it easy to manage updates across environments.

---

## 🔧 Features

* Patch multiple ArgoCD Applications in one go
* Reads application names from `app.txt`
* Provides both Bash (`.bash`) and Windows Batch (`.bat`) versions
* Easily configurable path prefix (e.g., `dev/`, `production/`)

---

## 📂 Project Structure

```
.
├── app.txt                   # List of ArgoCD application names
├── replace-repo-url.bash     # Bash script to patch the applications
├── replace-repo-url.bat      # Windows Batch script to patch the applications
└── README.md
```

---

## 📝 app.txt Format

Each line should contain one ArgoCD application name, for example:

```
argocd-app-name-1
argocd-app-name-2
argocd-app-name-3
argocd-app-name-4
```

---

## 🚀 Usage

### On Linux/macOS/WSL:

1. Make the script executable:

```bash
chmod +x replace-repo-url.bash
````

2. Run the script:

```bash
./replace-repo-url.bash
```

### On Windows:

1. Double-click `replace-repo-url.bat` or run via Command Prompt

```cmd
replace-repo-url.bat
```

---

## ⚙️ Configuration

You can modify the following variables inside each script:

### In `replace-repo-url.bash`

```bash
new_repo="git@gitlab.com/group-name/repo-name""
path_prefix="dev/"  # Adjust this if needed
```

### In `replace-repo-url.bat`

```bat
set new_repo=git@gitlab.com/group-name/repo-name
set path_prefix=dev/
```

---

## 🧪 Optional: Dry Run

To preview changes without applying them:

Add this flag to the `kubectl patch` command in either script:

```bash
--dry-run=client -o yaml
```

---

## 📋 Requirements

* `kubectl` CLI installed
* Access to the Kubernetes cluster
* ArgoCD Applications exist in the `argocd` namespace

---

## 📄 License

MIT License. Feel free to use and modify.

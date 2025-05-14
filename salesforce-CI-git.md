# Setting up Salesforce CLI in Git

## 1. Connect VS Code with GitHub Repository

- Create a local folder for the repository:
  - Press `WIN + R`, type `cmd`
  - Run:
    ```bash
    mkdir "new-repository"
    cd new-repository
    git clone https://github.com/org/Salesforcerepo.git
    ```
- Open VS Code
- Select **File > Open Folder...** and choose the cloned repository

## 2. Check Salesforce CLI

- In VS Code terminal, type:
  ```bash
  sf
  ```
- If not installed, download from:  
  👉 [https://developer.salesforce.com/tools/salesforcecli](https://developer.salesforce.com/tools/salesforcecli)

## 3. Check Git CLI

- In terminal, type:
  ```bash
  git status
  ```
- If not installed, download from:  
  👉 [https://git-scm.com/downloads/win](https://git-scm.com/downloads/win)

### 3b. Configure Git User (if needed)

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## 4. Initialize the Repository

- In VS Code, create a file named `README.md` with any content
- Save the file
- Commit and publish the branch

## 5. Create a New Branch for the Sandbox

- In GitHub: create a branch from `main` for the sandbox
- In VS Code: click on the branch name (bottom-left), create a new branch
- Publish the branch

## 6. Check for Salesforce Extensions in VS Code

- Ensure the **Salesforce Extension Pack** is installed

## 7. Create an SFDX Project

- Open Command Palette (`Ctrl + Shift + P`)
- Run: `SFDX: Create Project with Manifest`
- Sync the project

## 8. Connect to an Org

- Open Command Palette → `SFDX: Authorize an Org`
- Provide an alias
- Authorize via web login

## 9. Create and Edit `package.xml`

- Add metadata types to retrieve (e.g., CustomObject, Layout, ApexClass)

## 10. Retrieve Org Data from Sandbox

- Right-click inside `package.xml` → `Retrieve Source in Manifest from Org`
- Review and resolve errors if any

## 11. Retrieve Org Data from Production

- Switch to `main` branch
- Repeat the setup and retrieval process
- Ensure you're working in the correct folder/project

---

## Manual Deployment

- Create a new branch from `main` (e.g., named after a ticket or date)
- Connect to the sandbox you're deploying **from**
- Retrieve metadata into this branch
- Review changes in the **source control view**
- Open `package.xml`, right-click → `Deploy Source to Org`
- Check and resolve deployment errors

---

## Final Notes

- Set up scripts and workflows for frequent tasks via Salesforce CLI

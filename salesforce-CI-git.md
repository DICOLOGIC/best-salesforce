# Setting up Salesforce CLI in GIT

1. Connect VS Code with GitHub Repository
- create local folder for repository
- Open a terminal
- WINKEY+R
- "cmd"
- mkdir "new repository"
- enter the new folder cd new repository
- git clone https://github.com/org/Salesforcerepo.git
- open VS Code
- choose "Open Folder..." and open the repository 

2. Check SF CLI
- Check if SF is install by typing "sf" in the terminal in VS Code
- if not installed, download here https://developer.salesforce.com/tools/salesforcecli

3. Check GIT cli
- Check if GIT is installed by typing "git status" in the terminal in VS Code
- if not installed, download here https://git-scm.com/downloads/win

3b. Configure git user.name and user.email (if you see errors)
- Open the terminal
- Enter the following command
- git config --global user.name "Your Name"
- git config --global user.email "Your Email"

3. Create first file to initialize
- In VS Code create the file "readme.md" with any text as content
- Save the file
- Sync by commit
- Publish the branch

4. Create new branch for the sandbox
- In GitHub, create a branch from main for any sandbox you wish to start from
- In VS Code you can click on the bottom "main" and create a new branch
- Publish the branch under "changes"

5. Check if you have the VS Code Salesforce CLI extension
- You need to install Salesforce CLI

6. Create SFDX Project
- To Create the project open Command Palette or press Ctrl + Shift + P.  Then type >SFDX: Create Project with Manifest .
- Sync the changes

7. Connect org
- Open the command palette and Authorize an Ord
- Enter an alias to recognize the org
- Authorize via Web

8. Create the package.xml
- Add the elements you would like to retrieve to the package.xml

9. First retrieval of org data from sandbox
- Open the package.xml and right-click anywhere in the text, select "Retrieve Source in Manifest from Org"
- Check and resolve errors

10. Retrieval of org data from production
- Change into main and repeat the steps for creating the project (pay attention to the right main folder)
- Retrieve the elements via package.xml

## Manually deploy
- Create new branch from main (call it like a ticket or with a date)
- Connect to the sandbox you want to deploy from
- Retrieve the metadata from the sandbox into the new branch you created
- Check the changes in the source view
- Open package.xml, right-click anywhere and then select "Deploye Source to Org"
- Check errors and correct the package.xml where necessary

## Setup Workflows and CLI


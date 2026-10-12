# Mettelo GitHub live steps

Wednesday 14 October 2026 at 8 pm UK time.

**Order:** Johnson completes Part 1 and merges his pull request. The guest then shares her screen and completes Part 2 from the updated `main` branch.

Run terminal commands **one line at a time**. Text inside an HTML block belongs in a file, not in the terminal.

## Before the session — both presenters

### 1. Install VS Code

1. Open https://code.visualstudio.com/download.
2. Download the version for your laptop.
3. Windows: run the installer, keep the defaults and enable **Add to PATH** if offered.
4. Mac: open the downloaded archive and move **Visual Studio Code** into **Applications**.
5. Open VS Code.

### 2. Install Git

**Windows:**

1. Open https://git-scm.com/install/windows.
2. Download and run the installer for your laptop.
3. Keep Git available from the command line and keep **Git Credential Manager** enabled if offered.
4. Finish installation. Close and reopen VS Code.

**Mac:**

1. Open the **Terminal** app.
2. Run:

```bash
git --version
```

3. If asked to install Command Line Tools, click **Install** and finish.
4. If Git is missing and no installation prompt appears, run:

```bash
xcode-select --install
```

5. Finish installation and reopen VS Code.

**Both:** in VS Code click **Terminal → New Terminal**, then run:

```bash
git --version
```

You should see `git version` followed by a number.

### 3. Set your own name and email

Each presenter replaces the two values with their own details. Use an email verified on GitHub, or your exact GitHub noreply email from **GitHub Settings → Emails**.

```bash
git config --global user.name "YOUR FULL NAME"
git config --global user.email "YOUR GITHUB EMAIL"
git config --global user.name
git config --global user.email
```

The last two commands should display your details. These settings identify your commits; they do not log you in.

### 4. Sign in to GitHub in VS Code

1. Open your browser and sign in to https://github.com using your own account.
2. In VS Code, open the Command Palette:
   - Windows: **Ctrl + Shift + P**.
   - Mac: **Cmd + Shift + P**.
3. Type `GitHub: Sign in`. Select it if available and follow the browser authorisation prompts.
4. If that command is absent, continue to cloning. Complete the browser sign-in when VS Code or Git Credential Manager requests it.
5. Pause screen sharing while entering passwords or two factor codes.

Test a branch push in a separate practice repository before the event. Cloning a public repository alone does not test push authentication. If terminal authentication fails, use the short backup at the end of this guide.

### 5. Enable GitHub Copilot

1. In VS Code, click the **Copilot** icon and choose **Use AI Features** or **Sign in to use Copilot**.
2. Choose GitHub and complete the sign-in prompts.
3. If an extension is requested, click **Extensions** in the left sidebar, search **GitHub Copilot**, and install the official GitHub extension. Enable **GitHub Copilot Chat** if prompted.
4. Open **Chat**, choose **Ask** if available, and type:

```text
Explain git add, git commit and git push in simple terms.
Do not edit files or run commands.
```

Use the free allowance if eligible. Copilot is optional for this demo; the commands below work without it.

### 6. Prepare organisation access

Johnson, before the event:

1. Confirm you can create a repository inside the **Mettelo GitHub organisation**.
2. Confirm the guest has accepted her organisation invitation if she is joining as a member.
3. Give her **Write** access to the demo repository when you create it below.
4. Confirm who can review and merge pull requests. If organisation rules require approval or checks, arrange those before the session. Follow those rules when merging.

**Use the organisation shown in your GitHub account. This guide does not assume its exact URL spelling. Copy the real repository URL rather than typing an organisation name from memory.**

---

## Part 1 — Johnson shares his screen

### 1. Create the repository inside Mettelo

1. Open https://github.com/new.
2. Click **Owner** and choose the **Mettelo organisation**, not your personal account.
3. In **Repository name**, enter:

```text
mettelo-github-session-02
```

4. In **Description**, enter:

```text
Mettelo live practice with branches commits and pull requests.
```

5. Select **Public** if the organisation allows public workshop repositories. Otherwise use **Private**.
6. Select **Add a README file**.
7. Click **Create repository**.
8. Confirm the starting branch is `main`. If your organisation uses a different default branch, replace `main` throughout this guide with that name.

### 2. Give the guest access

1. In the repository click **Settings**.
2. Click **Collaborators and teams** or **Manage access**, depending on the interface.
3. Click **Add people**.
4. Search for the guest's exact GitHub username and select her account.
5. Choose **Write**, then complete the invitation or access confirmation.
6. Ask her to accept any pending invitation while signed into her own GitHub account.

If she already has Write access through a team, confirm it here. She must have Write access to push her branch.

### 3. Copy the repository link

1. Return to the repository's **Code** tab.
2. Click the green **Code** button.
3. Select **HTTPS**.
4. Click the copy icon next to the URL ending in `.git`.
5. Send that exact URL to the guest.

### 4. Clone using VS Code

1. Open VS Code.
2. Press **Ctrl + Shift + P** on Windows or **Cmd + Shift + P** on Mac.
3. Type `Git: Clone` and select **Git: Clone**.
4. Paste the HTTPS URL you just copied. Press **Enter**.
5. In the folder picker, choose **Documents**. Click **Select Repository Location** or the equivalent confirmation button.
6. Wait for cloning to finish.
7. When asked to open the cloned repository, click **Open**.
8. If Workspace Trust appears, trust this folder because it is your own demo repository.

You should see `README.md` in VS Code Explorer.

### 5. Copy the cloned folder's full path

**Windows:**

1. Open **File Explorer → Documents**.
2. Find the folder `mettelo-github-session-02`.
3. Right-click the folder and choose **Copy as path**. On versions where it is hidden, hold **Shift** while right-clicking.

**Mac:**

1. Open **Finder → Documents**.
2. Select the folder `mettelo-github-session-02`.
3. Press **Option + Cmd + C** to copy its full pathname.

If you chose a different clone location, find the folder there instead.

### 6. Move the terminal into that folder

1. Return to VS Code.
2. Click **Terminal → New Terminal**.
3. Type `cd ` followed by the copied full path inside double quotes. Use your actual path, not the example username:

**Windows example:**

```powershell
cd "C:\Users\Johnson\Documents\mettelo-github-session-02"
```

**Mac example:**

```bash
cd "/Users/johnson/Documents/mettelo-github-session-02"
```

Windows **Copy as path** normally includes quotes already. Keep one pair of quotes; do not add a second pair.

Run:

```bash
git status
git remote -v
```

You should see `On branch main` and `working tree clean`. The `origin` URL should point to the Mettelo organisation repository.

### 7. Update local main before branching

```bash
git switch main
git pull --ff-only origin main
```

You should see `Already up to date`, or Git downloads the latest changes.

### 8. Create your local branch

```bash
git switch -c feature/johnson-demo
git status
git branch --show-current
```

You should now see `feature/johnson-demo`.

### 9. Check the branch against GitHub main

```bash
git fetch origin
git rev-list --left-right --count origin/main...HEAD
```

At this point expect `0 0`:

- First number: commits on GitHub main that your branch does not contain.
- Second number: commits on your branch that GitHub main does not contain.

If the first number is above zero, bring main into your branch before editing:

```bash
git merge origin/main
git rev-list --left-right --count origin/main...HEAD
```

Continue when the first number is zero. `git status` alone does not compare your feature branch with main.

### 10. Create a file and add code

1. In VS Code click **Explorer** in the left sidebar.
2. Click the **New File** icon beside the project folder name.
3. Type `index.html` and press **Enter**.
4. Paste this into the file:

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Mettelo GitHub Workshop</title>
</head>
<body>
  <h1>Mettelo GitHub Session 02</h1>
  <p>Johnson created this page on his branch.</p>
</body>
</html>
```

5. Save with **Ctrl + S** on Windows or **Cmd + S** on Mac.
6. Click `README.md` in Explorer.
7. Add this line at the bottom and save:

```text
Open index.html in a browser to view our workshop page.
```

### 11. Show the page locally

1. Open the cloned folder in File Explorer or Finder.
2. Double-click `index.html`.
3. Your browser should display the heading and Johnson's sentence.
4. Return to VS Code.

### 12. Review and stage the files

Run:

```bash
git status
git diff -- README.md
git add README.md index.html
git diff --cached
```

Check that only your intended README and HTML edits are staged. The new HTML file appears in the staged diff. If the diff opens a scrolling viewer, press **q** to return to the terminal.

### 13. Commit locally

```bash
git commit -m "Add workshop page and README instructions"
git status
```

You should see a new commit and `working tree clean`.

### 14. Push your branch to GitHub

```bash
git push -u origin feature/johnson-demo
git status
git branch -vv
```

Complete browser authentication if prompted. The first push creates the matching GitHub branch. `-u` links your local branch to it.

You should see `origin/feature/johnson-demo` in the branch details.

### 15. Create the pull request

1. Return to the GitHub repository and refresh.
2. Click **Pull requests → New pull request**.
3. Set **base** to `main`.
4. Set **compare** to `feature/johnson-demo`.
5. Review the displayed changes.
6. Click **Create pull request**.
7. Use this title:

```text
Add workshop page and README instructions
```

8. Use this description:

```text
Added index.html and instructions for opening it locally.
Checked the page in a browser.
```

9. Click **Create pull request** to submit it.

### 16. Review and merge

1. Click **Files changed** and review both files.
2. If a reviewer is required, request the guest or another authorised reviewer from **Reviewers**.
3. The reviewer opens **Files changed → Review changes → Approve → Submit review**, if permitted by the organisation's rules.
4. Wait for any required approvals and checks.
5. An authorised person clicks the available merge button, such as **Merge pull request** or **Squash and merge**, then confirms.
6. Confirm the pull request says **Merged**.
7. Return to **Code**, select `main`, and confirm `index.html` is present.

Creating a pull request alone does not put your changes into main. Wait for the merge before the guest starts.

### 17. Update your local main after the merge

Return to the terminal:

```bash
git switch main
git pull --ff-only origin main
git status
```

Your local main now includes the merged page.

### 18. Hand over

Say: **“My changes are now merged into main. Please share your screen and repeat the process from your computer.”**

Stop sharing your screen.

---

## Part 2 — The guest shares her screen

### 1. Clone the same organisation repository

1. Open VS Code.
2. Press **Ctrl + Shift + P** on Windows or **Cmd + Shift + P** on Mac.
3. Type `Git: Clone` and select it.
4. Paste the exact HTTPS URL Johnson sent. Press **Enter**.
5. Choose **Documents** and confirm the repository location.
6. Wait for cloning to finish, then click **Open**.
7. Trust the folder if prompted.

She should see `README.md` and `index.html`, because Johnson's pull request has already been merged.

### 2. Copy her own local folder path

**Windows:** open **File Explorer → Documents**, right-click `mettelo-github-session-02`, and choose **Copy as path**. Hold **Shift** while right-clicking if necessary.

**Mac:** open **Finder → Documents**, select `mettelo-github-session-02`, and press **Option + Cmd + C**.

### 3. Enter her cloned directory

In VS Code click **Terminal → New Terminal**. Use her copied path, replacing the example below:

**Windows example:**

```powershell
cd "C:\Users\Guest\Documents\mettelo-github-session-02"
```

**Mac example:**

```bash
cd "/Users/guest/Documents/mettelo-github-session-02"
```

Then run:

```bash
git status
git remote -v
git config user.name
git config user.email
```

Confirm she is on `main`, the remote points to the organisation repository, and the identity is hers.

### 4. Update main

```bash
git switch main
git pull --ff-only origin main
```

If she cloned during rehearsal instead of now, this pull brings Johnson's merged files into her existing main. Use that existing folder rather than cloning over it.

### 5. Create her own local branch

```bash
git switch -c feature/guest-demo
git status
git branch --show-current
```

Expected branch: `feature/guest-demo`.

### 6. Check her branch against GitHub main

```bash
git fetch origin
git rev-list --left-right --count origin/main...HEAD
```

Expect `0 0`. If the first number is above zero, run:

```bash
git merge origin/main
git rev-list --left-right --count origin/main...HEAD
```

Continue when the first number is zero.

### 7. Update the page

1. Click `index.html` in VS Code Explorer.
2. Keep Johnson's existing content.
3. Add the following line immediately above `</body>`:

```html
  <p>The guest presenter added this line on her own branch.</p>
```

4. Save the file.
5. Click **New File**, enter `guest-notes.md`, and press **Enter**.
6. Paste this into the new file and save:

```markdown
# Guest contribution

I cloned the organisation repository, created my branch,
updated the page and submitted my contribution for review.
```

### 8. Check her page

1. Open the cloned folder in File Explorer or Finder.
2. Double-click `index.html`.
3. Confirm both Johnson's sentence and the guest's sentence appear.
4. Return to VS Code.

### 9. Review and stage

```bash
git status
git diff -- index.html
git add index.html guest-notes.md
git diff --cached
```

Check both staged files. Press **q** if a diff viewer is open.

### 10. Commit

```bash
git commit -m "Add guest contribution and practice notes"
git status
```

Expected: a new commit and a clean working tree.

### 11. Push her branch

```bash
git push -u origin feature/guest-demo
git status
git branch -vv
```

Expected upstream: `origin/feature/guest-demo`.

### 12. Create her pull request

1. Open the same organisation repository on GitHub and refresh.
2. Click **Pull requests → New pull request**.
3. Set **base** to `main`.
4. Set **compare** to `feature/guest-demo`.
5. Check the displayed changes and click **Create pull request**.
6. Title:

```text
Add guest contribution and practice notes
```

7. Description:

```text
Added my contribution to index.html and created guest-notes.md.
Checked that both presenters' text appears in the browser.
```

8. Click **Create pull request**.
9. Request Johnson as reviewer under **Reviewers**, if his account is eligible.

### 13. Johnson reviews and the authorised person merges

1. Johnson opens her pull request in his browser.
2. Click **Files changed** and review the edits.
3. Click **Review changes → Approve → Submit review**, where permitted.
4. After the required checks and approvals, the authorised person clicks the available merge button and confirms.
5. Confirm the pull request says **Merged**.
6. Open **Code → main** and confirm the updated page and `guest-notes.md` are present.

### 14. Both presenters update their local main

Each presenter runs this in their own cloned repository:

```bash
git switch main
git pull --ff-only origin main
git status
```

Open `index.html` locally and confirm it contains both contributions.

**Finished:** both contributions are on GitHub main and on both computers.

---

## Only use this section if something stops working

### Terminal says Git is not recognised

Finish Git installation, close and reopen VS Code, then run:

```bash
git --version
```

### Terminal says not a Git repository

Repeat the **copy folder path** and **cd** steps above. Then run:

```bash
git status
```

### Branch already exists

If you are resuming the correct existing branch, switch to it without `-c`:

```bash
git switch feature/johnson-demo
```

The guest uses `feature/guest-demo`. For a fresh repeat demonstration, use a new branch name consistently in the create, push and pull request steps.

### Authentication fails when pushing

1. Confirm the correct GitHub account has **Write** access and accepted its invitation.
2. Complete any required organisation SSO authorisation.
3. Do not enter your GitHub account password as a Git password.
4. Install GitHub CLI from https://cli.github.com before the event as a backup. Restart the terminal and run:

```bash
gh auth login --hostname github.com --git-protocol https --web
```

5. Follow the browser/device code prompts privately using the authorised account. Allow Git authentication if asked.
6. Run:

```bash
gh auth setup-git
gh auth status
```

7. Retry the correct presenter push:

```bash
git push -u origin feature/johnson-demo
```

The guest uses `feature/guest-demo`. A two factor prompt uses your account's existing sign-in method; an extra authenticator app is not automatically required.

### Push is rejected because the remote branch changed

On your own feature branch, save and commit your intended edits first. Then run:

```bash
git status
git pull --rebase
```

If successful:

```bash
git push
```

If it reports conflicts and you need to stop:

```bash
git rebase --abort
```

Keep your local commit and let the other presenter continue while you resolve it. Do not force push.

### Merge button is unavailable

Read the reason on the pull request. Complete the required review/checks, or ask the authorised repository maintainer to merge. Do not start the guest's contribution until Johnson's changes are actually on main.

## Official references

- [VS Code GitHub workflow](https://code.visualstudio.com/docs/sourcecontrol/github)
- [GitHub pull request steps](https://docs.github.com/en/pull-requests/how-tos/create-pull-requests/creating-a-pull-request)
- [Git branch comparison command](https://git-scm.com/docs/git-rev-list)
- [GitHub authentication](https://docs.github.com/en/get-started/git-basics/caching-your-github-credentials-in-git)
- [Copilot setup](https://code.visualstudio.com/docs/setup/copilot)

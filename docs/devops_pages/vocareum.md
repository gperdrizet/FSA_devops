---
layout: page
title: Tracking Vocareum environments on GitHub
permalink: /devops_pages/vocareum.html
nav_exclude: true
---

### 1.1. Initialize an empty GitHub repository

First, we need a repository to be the home for your Vocareum code on GitHub. From your GihHub profile page:

1. Go to repositories and click the green 'New' button
2. Set yourself as the repo owner
3. Give the new repo a descriptive name
4. Set the visibility to private
5. Don't add a template, README, .gitignore or license
6. Click 'create repository'

Save the HTTPS git URL somewhere safe (select HTTPS in the 'Quick setup — if you’ve done this kind of thing before' box, and copy the URL). You also will probably want to bookmark this page for easy access. If you loose the URL, don't worry. You can always find it again through your GitHub profile.

### 1.2. Generate a GitHub personal access token

Next, create access credentials to authenticate on GitHub from within Vocareum. This allows you to move code back and forth between the two. From your GihHub profile page:

1. Click your profile avatar at the top right and choose 'settings'
2. Go to 'Developer settings' at the bottom of the left sidebar
3. Select 'Personal access tokens' and then 'Fine-grained tokens' from the left sidebar
4. Click the green 'Generate new token' button
5. Give the new access token a name and description you will remember/understand later
6. Under 'Repository access' choose 'Only select repositories'
7. Find the empty target repository you created in step 1.1. by name
8. Under permissions, click '+ Add permissions'
9. Search for and select 'Contents'
10. Change the Contents Access drop-down setting from 'Read-only' to 'Read and write'
11. Click the green 'Generate token' button and then again to confirm
12. Copy and save the token string somewhere safe

You will need to enter this token once per Vocareum session to authenticate to GitHub. I recommend saving the token in a text file somewhere on your local machine (probably in the same place as the target repo URL from step 1.1.). If you forget or leak it, it's not a big deal. You can easily expire and generate a new token. Fine-grained personal access tokens are easy to change/update and only grant specific access to the repo(s) we choose. Much better than using your GitHub password.

### 1.3. First commit and push

Now we need to commit and push the contents of your Vocareum environment to the empty repository we created in step 1.1. From the Jupyter lab interface of your Vocareum workbench:

1. Open a terminal (File -> New -> Terminal)
2. Download the [`git-me-started`](https://github.com/gperdrizet/FSA_devops/blob/main/scripts/git-me-started) shell script from this repository:

```text
wget https://raw.githubusercontent.com/gperdrizet/FSA_devops/refs/heads/main/scripts/git-me-started
```

3. Change the script's permissions to allow user execution:

```text
sudo chmod u+x ./git-me-started
```

4. Run the script, passing your blank GitHub repository's URL as an argument:

```text
./git-me-started YOUR_REPO_URL
```

5. Enter your Github username and personal access token when prompted for a password.

Done! If you visit your GitHub repository page, you should see the exact same directory structure and contents as you do in your Vocareum environment. The script has set up a local git repository with large file tracking enabled, connected it to your remote repository on GitHub and cached your credentials in local memory for this session. Phew! You can now use git and GitHub normally from within this Vocareum session.

When you are done working, before you log out of Vocareum, commit and push your work to GitHub:

```text
git add .
git commit -m "Did lots of cool stuff!"
git push origin main
```

### 1.4. Authenticating subsequent Vocareum sessions

The next time you fire up a Vocareum session, you only need to authenticate and sync with your remote repository on Github using the [`git-me`](https://github.com/gperdrizet/FSA_devops/blob/main/scripts/git-me) script from this repository:

```text
wget https://raw.githubusercontent.com/gperdrizet/FSA_devops/refs/heads/main/scripts/git-me
sudo chmod u+x ./git-me
./git-me YOUR_REPO_URL
```

Enter your GitHub username and personal access token when prompted.

This script installs and initializes git and git-lfs, connects and authenticates to your GitHub repository, and runs `git pull` to update the code in the Vocareum environment. Now you can use git and GitHub normally for the duration of this session.

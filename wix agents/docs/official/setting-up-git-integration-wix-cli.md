> Portal Navigation:
> 
> - Append `.md` to any URL under `https://dev.wix.com/docs/` to get its markdown version.
> - Pages are either content pages (article or reference text) or menu pages (a list of links to child pages).
> - To get a menu page, truncate any URL to a parent path and append `.md` (e.g. `https://dev.wix.com/docs/sdk.md`, `https://dev.wix.com/docs/sdk/core-modules.md`).
> - Top-level index of all portals: https://dev.wix.com/docs/llms.txt
> - Full concatenated docs: https://dev.wix.com/docs/llms-full.txt

## Resource: Setting Up Git Integration & Wix CLI for Sites

## Article: Setting Up Git Integration & Wix CLI

## Article Link: https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/setting-up-git-integration-wix-cli-for-sites.md

## Article Content:

# Set Up Git Integration & Wix CLI for Sites

[Git Integration & Wix CLI for Sites](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/about-git-integration-wix-cli-for-sites.md) allows you to write, test, preview, and publish code for your Wix site from your preferred IDE. This article explains how to set up Git Integration & Wix CLI for Sites by connecting your site to GitHub, cloning your site's GitHub repository to your computer, and installing the Wix CLI for Sites.

> **Note:** You can also clone the repo to a cloud IDE workspace, then install and use the Wix CLI for Sites there.

### Before you begin
Make sure you have the following tools installed before you start:

*   [Git](https://git-scm.com/download)
*   [Node](https://nodejs.org/en/download/), version 20.11 or later.
*   [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) or [yarn](https://yarnpkg.com/getting-started/install)
*   An SSH key [added to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).


## Step 1 | Connect your site to GitHub

To write your site's code locally from your computer, first create a GitHub repo to store your site's code and connect it to your site.

<blockquote class="important">

**Important:**

* You can't connect your site to GitHub if you have [Velo Packages](https://dev.wix.com/docs/develop-websites/articles/coding-with-velo/packages/working-with-velo-packages.md) set up on your site. This feature isn't supported when using Git Integration & Wix CLI for Sites. However, you can connect your site to GitHub if you have [npm packages](https://dev.wix.com/docs/develop-websites/articles/coding-with-velo/packages/about-npm-packages.md) installed on your site.
* Once you connect your site to GitHub be careful not to delete your site's repo or revoke the Velo app's access to this repo. These actions may cause your site's GitHub connection to stop working even if you restore the repo or reinstall the app.

</blockquote>

If you haven't already done so, click ![Code icon](https://github.com/wix-incubator/wix-code-docs/assets/50321691/2c41d3df-930f-4e0f-966f-038742adceed) and then **Start Coding** (Wix Studio), or enable [Velo Dev Mode](https://support.wix.com/en/article/about-velo-by-wix#to-enable-velo-on-your-site) (Wix Editor).

1.  Go to the GitHub Integration section of your editor:
    + **Wix Studio:** In the Code sidebar, click **GitHub** then **Connect to GitHub**.
    
     ![Connect to GitHub](https://wixmp-833713b177cebf373f611808.wixmp.com/images/2975acc2f04e09b584d7445e64fb1107.png)

    + **Wix Editor:** Click the **GitHub Integration**  ![](https://user-images.githubusercontent.com/89579857/184818043-6a791df6-9f83-4183-ba2f-63d8c32a6cf7.png)  icon in the Code sidebar and then **Connect to GitHub**.
    
3.  Click **Continue**.
    
     ![](https://user-images.githubusercontent.com/89579857/188311147-436ecd17-c717-440c-93ae-feb7685eddeb.png) 
4.  Click **Sign In**.
    
    Follow the prompts to sign in to your GitHub account and authorize Velo to create a new repo for you.
5.  Choose an owner and enter a name for the new repo to connect to your site. Optionally, you can add a custom description as well. Click **Create**.
    
     ![](https://user-images.githubusercontent.com/89579857/188311195-229312f8-3fd5-4c6d-902d-b746f0c9915d.png) 
6.  Click **Install** to start installing the Velo GitHub app on your new repo.
    
    This app allows your site to communicate with GitHub. You may need to authenticate your identity in GitHub before continuing.
7.  Make sure that both **Only select repositories** and your new repo are selected. Click **Approve and Install**.
    
     ![](https://user-images.githubusercontent.com/89579857/184847450-8f0b382d-4dfd-4918-a23c-983e910a8fc2.png) 
8.  Copy the displayed terminal commands. You need them for the next section of the setup.
    
     <img src="https://user-images.githubusercontent.com/89579857/196914757-a8eefdc5-0548-4b19-a000-b6a1d02db6f5.png" style="max-width:30vw" />
9.  Click **Close**.
    
    Your repo name and default branch are displayed in the **GitHub Integration** panel.
    
     ![](https://user-images.githubusercontent.com/89579857/188308239-bb8c9c44-4844-470a-b1d5-dbd0d48be4ce.png) 

Once you connect your site to GitHub, your editor enters [read-only mode](https://support.wix.com/en/article/velo-working-with-editor-x-and-github-integration#about-read-only-mode).

You can always choose to [disconnect your site from GitHub](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/disconnect-your-site-from-git-hub.md).

## Step 2 | Set up your local environment

Once your site's repo is set up, you can clone it to your computer and install the Wix CLI for Sites. The commands used in this procedure accomplish the following:

*   Clone your site's repo to your computer.
*   Install the repo's dependencies.
*   Install the [Wix CLI for Sites](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/wix-cli-for-sites-commands.md) globally on your computer.

To set up your local environment, do the following:

1.  Open the terminal on your computer.
    
2.  Navigate to the directory where you want to store your repo's files.
    
3.  Run the commands you copied down in the previous section. Depending on your computer's setup, you may need administrator privileges to run the commands.
    
    To see the commands again, open your site's editor and click **Local Dev Setup**.
    
     ![](https://user-images.githubusercontent.com/89579857/188308276-c55c6e03-3bc4-4ca0-9512-14bc1d8040b4.png) 
    
    The default commands use npm as the package manager for installations. You can also use yarn to manage packages. To do this, make the following changes:
    
    *   Change `npm install` to `yarn install`.
    *   Change `npm install -g @wix/cli` to `yarn global add @wix/cli`.
    
    After the installation, the [Local Editor](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/about-the-local-editor.md) opens in your default web browser.
    
4.  Open the repo in your favorite local IDE to start writing code.
    

## Step 3 | Set up the Wix CLI for Sites

The CLI is a package that you install on your computer.

1.  Open your computer's terminal.
2.  Run `npm install -g @wix/cli` or `yarn global add @wix/cli`.
    
Once you've installed the CLI globally, you can use it with any Wix site repos on your computer.

## Next Steps

You're ready to start writing your site's code, and [testing it with the Local Editor](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/test-your-code-in-the-local-editor.md)
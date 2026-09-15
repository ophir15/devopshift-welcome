> Portal Navigation:
> 
> - Append `.md` to any URL under `https://dev.wix.com/docs/` to get its markdown version.
> - Pages are either content pages (article or reference text) or menu pages (a list of links to child pages).
> - To get a menu page, truncate any URL to a parent path and append `.md` (e.g. `https://dev.wix.com/docs/sdk.md`, `https://dev.wix.com/docs/sdk/core-modules.md`).
> - Top-level index of all portals: https://dev.wix.com/docs/llms.txt
> - Full concatenated docs: https://dev.wix.com/docs/llms-full.txt

## Resource: Set Up GitHub Actions to Work with the Wix CLI for Sites

## Article: Set Up GitHub Actions to Work with the Wix CLI

## Article Link: https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/set-up-git-hub-actions-to-work-with-the-wix-cli-for-sites.md

## Article Content:

# Set Up GitHub Actions to Work with the Wix CLI for Sites

To enable a GitHub Actions workflow to perform actions on your Wix site, the workflow must set up and authenticate the Wix CLI for Sites using an API key.

## Prerequisites

Before creating a GitHub Action workflow to interact with your site, make sure that you [integrate your site with GitHub](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/changes-to-the-editor-when-your-site-is-integrated.md).

> **Note:** You can also [Set up GitHub integration with the Wix CLI for Sites](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/setting-up-git-integration-wix-cli-for-sites.md) locally.

## Set up GitHub Actions to work with your site

To authorize a GitHub Actions workflow to interact with your site, follow these steps:

### Step 1 | Generate an API key

An API key allows an authorized external client to access your Wix account and site data. With an API key, you can authorize GitHub Actions to [execute Wix CLI for Sites commands for your site](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/wix-cli-for-sites-commands.md).

You can generate an API key in the [API Keys Manager](https://manage.wix.com/account/api-keys). Select the **Wix CLI for Sites - Git Integration** site permission to allow GitHub Actions to use the Wix CLI for Sites for your sites.

### Step 2 | Store the API key as a GitHub secret

Visit your site's GitHub repo and [create a repository secret](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-a-repository) to store the API key. This makes your API key available to use securely in your repo's GitHub Actions workflows.

### Step 3 | Set up the Wix CLI for Sites in your GitHub Actions workflow

Configure your GitHub Actions workflow to set up and authenticate the Wix CLI for Sites:

1. In your GitHub Actions workflow, [set up the Wix CLI for Sites](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/setting-up-git-integration-wix-cli-for-sites.md) by including the following command:

   ```yaml
   npm install
   ```

2. Next, authenticate it by including the following command:

   ```yaml
   npm run wix login -- --api-key ${{ secrets.WIX_CLI_API_KEY }}
   ```

### Step 4 | Include Wix CLI for Sites commands

Your workflow can now run authenticated Wix CLI for Sites commands to interact with your site. For example:

- Include `npm run wix preview` in your workflow to [build a preview version of the site](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/wix-cli-for-sites-commands.md) based on the current branch. You can set up a workflow to create a preview version whenever a new PR is created.
- Include `npm run wix publish` in your workflow to [publish the site](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/wix-cli-for-sites-commands.md) based on the repo's default branch. You can set up a workflow whenever a PR is merged to the default branch.

## See also

- [About Automated Workflows and the Wix CLI for Sites](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/about-automated-workflows-and-the-wix-cli-for-sites.md)
- [Working with the Wix CLI for Sites](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/wix-cli-for-sites-commands.md)
- [Generate an API Key](https://dev.wix.com/docs/go-headless/authentication/admin/generate-an-api-key.md)
- [Using Secrets in GitHub Actions](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)
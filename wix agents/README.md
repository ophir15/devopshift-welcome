# Wix Agents

Local kit for connecting a **Cursor agent** to a **Wix website**.

This folder is a git repository. It contains Wix Skills, MCP config, the Wix CLI, and the official docs an agent needs. It is **not** your live Wix site. Your site code only appears here after you connect Git Integration on Wix and clone (or point Cursor at) that GitHub repo.

## What is already downloaded

| Path | What it is |
| --- | --- |
| `vendor/wix-skills/` | Official [Wix Skills](https://github.com/wix/skills) snapshot |
| `vendor/wix-mcp/` | Official [Wix MCP](https://github.com/wix/wix-mcp) snapshot |
| `.cursor/skills/` | The same skills, in the layout Cursor agents look for |
| `.cursor/mcp.json` | Wix MCP server config (`https://mcp.wix.com/mcp`) |
| `.cursor/environment.json` | Cloud Agent environment: npm install + Wix MCP allowlist |
| `docs/official/` | Wix Git, MCP, plugin, and skills documentation |
| `node_modules/` (after `npm install`) | `@wix/cli`, `@wix/mcp-remote`, `@wix/agent-skills` |

## What only you can do on Wix

I cannot log into your Wix account. Complete **[WHAT-YOU-NEED-TO-DO.md](WHAT-YOU-NEED-TO-DO.md)**, then fill **[templates/SITE_INFO.md](templates/SITE_INFO.md)** and send that file back.

Short version:

1. Turn on code / Velo on the site.
2. Connect the site to GitHub (Wix Git Integration).
3. Create a Wix API key and copy your account ID.
4. Connect that GitHub repo to Cursor Cloud Agents.
5. Paste the site URL, site ID, GitHub repo URL, and (privately) the API key into Cursor secrets — never into git.

## Local install

```bash
cd "wix agents"
npm install
cp .env.example .env
# edit .env with values from Wix
bash scripts/check-setup.sh
```

In Cursor Desktop, open this folder and run `/add-plugin wix`, or keep the MCP config already in `.cursor/mcp.json`.

## After Wix Git Integration exists

Clone the **site repo Wix created** next to this kit (gitignored as `site-repo/`):

```bash
git clone git@github.com:YOUR_USER/YOUR_WIX_SITE.git site-repo
```

Point Cursor Cloud Agents at **that** repository, not only this kit. This kit teaches the agent how Wix works; the site repo is the actual website code.

## Useful links

- [Wix MCP](https://mcp.wix.com)
- [Wix plugin for Cursor](https://dev.wix.com/docs/api-reference/articles/ai-tools/about-the-wix-plugin)
- [Git Integration & Wix CLI](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli/setting-up-git-integration-wix-cli)
- [API Keys Manager](https://manage.wix.com/account/api-keys)
- [Cursor Cloud Agents](https://cursor.com/agents)

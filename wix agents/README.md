# Wix Agents

Local kit for connecting a **Cursor agent** to a **Wix website**.

This folder is tracked in git and contains Wix Skills, MCP config, the Wix CLI, and the official docs an agent needs. It is **not** your live Wix site. Site code lives in **[ophir15/Vered](https://github.com/ophir15/Vered)** after Wix Git Integration.

Wix local setup (CLI, clone, `wix dev`) is in **[LOCAL_SETUP.md](LOCAL_SETUP.md)**.

## What is already downloaded

| Path | What it is |
| --- | --- |
| `vendor/wix-skills/` | Official [Wix Skills](https://github.com/wix/skills) snapshot |
| `vendor/wix-mcp/` | Official [Wix MCP](https://github.com/wix/wix-mcp) snapshot |
| `.cursor/skills/` | The same skills, in the layout Cursor agents look for |
| `.cursor/mcp.json` | Wix MCP server config (`https://mcp.wix.com/mcp`) |
| `.cursor/environment.json` | Cloud Agent environment: npm install + Wix MCP allowlist |
| `LOCAL_SETUP.md` | Wix Local Dev Setup: CLI, clone `ophir15/Vered`, `wix dev` |
| `docs/wix-local-setup.png` | Screenshot of those Wix commands |
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

The site repo Wix created is **Vered**. Commands from the Wix Local Dev Setup screen:

```bash
npm install -g @wix/cli
git clone git@github.com:ophir15/Vered.git
cd Vered
npm install
wix dev
```

From this folder you can run `bash scripts/setup-local-wix.sh` (see [LOCAL_SETUP.md](LOCAL_SETUP.md)). The clone is gitignored as `Vered/` so it stays a separate GitHub repo.

Point Cursor Cloud Agents at **https://github.com/ophir15/Vered**, not only this kit. This kit teaches the agent how Wix works; `Vered` is the website code.

## Useful links

- [Wix MCP](https://mcp.wix.com)
- [Wix plugin for Cursor](https://dev.wix.com/docs/api-reference/articles/ai-tools/about-the-wix-plugin)
- [Git Integration & Wix CLI](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli/setting-up-git-integration-wix-cli)
- [API Keys Manager](https://manage.wix.com/account/api-keys)
- [Cursor Cloud Agents](https://cursor.com/agents)

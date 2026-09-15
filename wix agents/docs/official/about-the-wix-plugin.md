> Portal Navigation:
> 
> - Append `.md` to any URL under `https://dev.wix.com/docs/` to get its markdown version.
> - Pages are either content pages (article or reference text) or menu pages (a list of links to child pages).
> - To get a menu page, truncate any URL to a parent path and append `.md` (e.g. `https://dev.wix.com/docs/sdk.md`, `https://dev.wix.com/docs/sdk/core-modules.md`).
> - Top-level index of all portals: https://dev.wix.com/docs/llms.txt
> - Full concatenated docs: https://dev.wix.com/docs/llms-full.txt

## Resource: About the Wix Plugin

## Article: About the Wix Plugin

## Article Link: https://dev.wix.com/docs/api-reference/articles/ai-tools/about-the-wix-plugin.md

## Article Content:

# About the Wix Plugin

The Wix plugin adds [Wix Skills](https://dev.wix.com/docs/api-reference/articles/ai-tools/about-wix-skills.md) and the [Wix MCP](https://dev.wix.com/docs/api-reference/articles/ai-tools/wix-mcp/about-the-wix-mcp.md) to your AI client, giving it the context it needs to help you build and manage with Wix. Once installed, your AI client understands Wix-specific workflows and development patterns, so you can get more accurate, relevant assistance without having to explain the platform yourself.

## How it works

The plugin works by loading Wix Skills and the Wix MCP into your AI client. Skills are self-contained instruction sets that guide your AI client through Wix development tasks. The MCP lets your AI client search Wix documentation, call Wix APIs, and create and manage sites, apps, and headless projects.

For a full list of available skills, see the [Wix Skills repository](https://github.com/wix/skills).

## Install the Wix plugin

The plugin is available for Claude Code, Cursor, and VS Code.

### Claude Code

In Claude Code run:

  ```
  /plugin marketplace add wix/skills
  /plugin install wix@wix
  ```


### Cursor

Use one of the following methods to install the plugin:

- Install it from the [Cursor marketplace](https://cursor.com/marketplace/wix).
- Run the following command in the AI chat:

  ```
  /add-plugin wix
  ```

### Codex

In a terminal, register the marketplace:
  ```
  codex plugin marketplace add wix/skills
  ```
Then in Codex CLI, run `/plugins`, select **Wix**, and choose **Install Plugin**.


### VS Code

1. Open the Command Palette with Command+Shift+P on Mac or Ctrl+Shift+P on Windows.
2. Select **Chat: Install Plugin From Source**.
3. Enter `https://github.com/wix/skills`.

### Gemini CLI

Install using [Gemini CLI](https://geminicli.com/).
  ```
  gemini extensions install https://github.com/wix/skills
  ```
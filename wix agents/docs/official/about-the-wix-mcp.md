> Portal Navigation:
> 
> - Append `.md` to any URL under `https://dev.wix.com/docs/` to get its markdown version.
> - Pages are either content pages (article or reference text) or menu pages (a list of links to child pages).
> - To get a menu page, truncate any URL to a parent path and append `.md` (e.g. `https://dev.wix.com/docs/sdk.md`, `https://dev.wix.com/docs/sdk/core-modules.md`).
> - Top-level index of all portals: https://dev.wix.com/docs/llms.txt
> - Full concatenated docs: https://dev.wix.com/docs/llms-full.txt

## Resource: About the Wix MCP

## Article: About the Wix MCP

## Article Link: https://dev.wix.com/docs/sdk/articles/use-the-wix-mcp/about-the-wix-mcp.md

## Article Content:

# About the Wix MCP

Wix now provides a [Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) server that allows you to work with Wix tools and services in your chosen AI client. By configuring the Wix MCP server, you enable your client to search the Wix documentation, write code for the Wix platform, and make API calls on Wix sites. This saves you the time and effort of finding and applying the information in the documentation yourself.

## Configure the Wix MCP

This section shows you the basic configuration you need to add to your AI tool to use the Wix MCP server. Watch our video to see a demo of how to set up the MCP:

`youtube:https://www.youtube.com/watch?v=n6PxVIiaJw4`

### Before you begin

- Make sure you have [Node.js](https://nodejs.org/en) version 19.9.0 or higher installed.

### Required configuration

Wix provides multiple ways to configure the Wix MCP server. In most cases, you need to manually add one of the following JSON objects to your MCP server configuration file:

**For tools that support remote MCP:**

```json
{
  "mcpServers": {
    "wix-mcp-remote": {
      "type": "http",
      "url": "https://mcp.wix.com/mcp"
    }
  }
}
```

The supported values for the `type` field are `"sse"` and `"http"`. The type you select depends on your agent. Agents that support remote MCP include Claude, [Cursor](#cursor), Copilot, and Windsurf.

**For tools that don't support remote MCP:**

```json
{
  "mcpServers": {
    "wix-mcp-remote": {
      "command": "npx",
      "args": [
        "-y",
        "@wix/mcp-remote@latest",
        "https://mcp.wix.com/mcp"
      ]
    }
  }
}
```

You can also authenticate to the MCP using an [API key](https://dev.wix.com/docs/rest/articles/get-started/api-keys.md) and your Wix account ID. This is useful for tools like [n8n](https://n8n.io/) or [A2A](https://developers.googleblog.com/en/a2a-a-new-era-of-agent-interoperability/).

To authenticate with an API key, use one of the following configurations:

**For tools that support remote MCP:**

```json
{
  "mcpServers": {
    "wix-mcp": {
      "type": "http",
      "url": "https://mcp.wix.com/mcp",
      "headers": {
        "Authorization": "<YOUR API KEY>",
        "wix-account-id": "<YOUR ACCOUNT ID>"
      }
    }
  }
}
```

The supported values for the `type` field are `"sse"` and `"http"`. The type you select depends on your agent. Use this configuration to set up the MCP in n8n, or in Cursor if you want to authenticate with an API key.

**For tools that don't support remote MCP:**

```json
{
  "mcpServers": {
    "wix-mcp": {
      "command": "npx",
      "args": [
        "@wix/mcp-remote@latest",
        "https://mcp.wix.com/mcp",
        "--header",
        "Authorization:${WIX_API_KEY}",
        "--header",
        "wix-account-id:<YOUR ACCOUNT ID>"
      ],
      "env": {
        "WIX_API_KEY": "<YOUR API KEY>"
      }
    }
  }
}
```

Depending on your client, you may be able to configure the MCP server through the client settings, or even ask the client itself to add the configuration.

See the instructions for adding MCP servers to common AI tools:

- [Instructions for Claude Desktop](https://modelcontextprotocol.io/quickstart/user#2-add-the-filesystem-mcp-server)
- [Instructions for Claude Web](https://support.anthropic.com/en/articles/11175166-about-custom-integrations-using-remote-mcp)
- [Instructions for Windsurf](https://docs.windsurf.com/windsurf/cascade/mcp)
- [Instructions for VS Code](https://code.visualstudio.com/docs/copilot/chat/mcp-servers#_add-an-mcp-server-to-your-workspace)
- [Instructions for n8n](https://docs.n8n.io/integrations/builtin/cluster-nodes/sub-nodes/n8n-nodes-langchain.toolmcp/)

#### Cursor

If you're working with Cursor and not using an API key to authenticate, you no longer need to configure the MCP manually. Click below to install the Wix MCP.

<a href="fallback::https://cursor.com/en/install-mcp?name=wix-mcp-remote&config=eyJ0eXBlIjoiaHR0cCIsInVybCI6Imh0dHBzOi8vbWNwLndpeC5jb20vbWNwIn0%3D">
<img src="https://wixmp-833713b177cebf373f611808.wixmp.com/images/f8aee29e2ec932022e429cb18148ddf1.png" alt="Install MCP Server" style="max-width: 36"/>
</a>

You can also add the Wix MCP from the [Cursor MCP library](https://docs.cursor.com/en/tools/mcp#wix).

## Available tools

The Wix MCP server provides the following tools in the table below. All of these tools are enabled by default.

|                                |                                                                                      |
| ------------------------------ | ------------------------------------------------------------------------------------ |
| Tool                           | Description                                                                          |
| WixREADME                      | Entry point that routes to the right tool or recipe for a task. Called first for most Wix management tasks. |
| SearchWixWDSDocumentation      | Search the [Wix Design System](https://www.wix-pages.com/wix-design-system/) documentation. |
| SearchWixRESTDocumentation     | Search the [Wix REST](https://dev.wix.com/docs/rest.md) documentation.                  |
| SearchWixSDKDocumentation      | Search the [Wix SDK](https://dev.wix.com/docs/sdk.md) documentation.                    |
| SearchBuildAppsDocumentation   | Search the [Wix Build Apps](https://dev.wix.com/docs/build-apps.md) documentation.      |
| SearchWixHeadlessDocumentation | Search the [Wix Headless](https://dev.wix.com/docs/go-headless/get-started/about-wix-headless.md) documentation.       |
| WixBusinessFlowsDocumentation  | Include complete step-by-step instructions for multi-step sample flows.              |
| BrowseWixRESTDocsMenu          | Navigate the Wix REST documentation by category, drilling down through the menu instead of searching by keyword. |
| ReadFullDocsArticle            | Fetch the full content of an article by article URL.                                 |
| ReadFullDocsMethodSchema       | Get the full request and response schema of an API method.                           |
| SearchWixAPISpec               | Inspect a REST method's exact request/response schema.                   |
| ListWixSites                   | Query the sites for a Wix account.                                                   |
| GetSiteContext                 | Fetch a site's ID, properties, and installed apps by site name.                      |
| CallWixSiteAPI                 | Perform a single REST API call for a specified account and selected site.                    |
| ExecuteWixAPI                  | Run a script that chains, loops, or paginates across one or more Wix REST API calls for a selected site. The default way to call site-scoped business-data APIs, such as Bookings, Stores, and CMS. |
| ManageWixSite                  | Perform an account-level action, such as creating, updating, or publishing a site. It authenticates at the account level only, so it can't read or write per-site business data. Use `CallWixSiteAPI` or `ExecuteWixAPI` with a `siteId` for that. |
| UploadImageToWixSite           | Upload one or more images to a site's Media Manager.                                  |
| SupportAndFeedback             | Prompt the user for feedback and send it to Wix.                                     |

## Troubleshooting

> **Share your feedback**<br/>
> Want to share feedback about your MCP experience? Tell your AI client to submit feedback to Wix. The client will prompt you for your message and send it directly to us. We review all feedback as part of our ongoing effort to improve.

If you're getting errors when running the MCP server, try the following:

1. Check the IDE logs.

1. Check if the error is related to your package manager. Make sure you have the latest node version as the default on the path.

1. Check that you entered the npx arguments correctly in the configuration. Make sure you included `-y` and the correct npm registry.

1. Include the full path to Node.

1. Restart the IDE.

1. Locate the MCP server in your IDE settings and log out, then log back in to reconnect to the server.

1. Run the MCP server directly on the command line:

    ```bash
    npx -y @wix/mcp-remote@latest https://mcp.wix.com/mcp
    ```

1. The connection to the server may be lost after a long period of inactivity, or if you switch the Wix account you're authenticating with. In that case, it may help to delete `~/.mcp-auth` (on Mac) or `C:\Users\<username>\.mcp-auth` (on Windows).

1. If the server still isn't working, check the [MCP debugging guide](https://modelcontextprotocol.io/docs/tools/debugging#debugging-in-claude-desktop) for more help.

## See also

- [Wix MCP Sample Prompts](https://dev.wix.com/docs/sdk/articles/use-the-wix-mcp/mcp-sample-prompts.md)
- [Wix MCP Sample Prompts for App Developers](https://dev.wix.com/docs/build-apps/develop-your-app/build-with-ai/wix-mcp/wix-mcp-sample-prompts-for-app-developers.md)
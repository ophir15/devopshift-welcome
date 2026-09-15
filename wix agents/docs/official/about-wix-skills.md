> Portal Navigation:
> 
> - Append `.md` to any URL under `https://dev.wix.com/docs/` to get its markdown version.
> - Pages are either content pages (article or reference text) or menu pages (a list of links to child pages).
> - To get a menu page, truncate any URL to a parent path and append `.md` (e.g. `https://dev.wix.com/docs/sdk.md`, `https://dev.wix.com/docs/sdk/core-modules.md`).
> - Top-level index of all portals: https://dev.wix.com/docs/llms.txt
> - Full concatenated docs: https://dev.wix.com/docs/llms-full.txt

## Resource: About Wix Skills

## Article: About Wix Skills

## Article Link: https://dev.wix.com/docs/api-reference/articles/ai-tools/about-wix-skills.md

## Article Content:

# About Wix Skills

Wix Skills are self-contained instructions that help AI tools work with Wix development workflows. They follow the open [Agent Skills specification](https://agentskills.io/specification) and consist of a `SKILL.md` file containing metadata, instructions, and background information.

Each skill includes:
- **Name and description:** Help agents identify what a skill does and when to use it.
- **Instructions:** Step-by-step guidance for performing the task.
- **Optional resources:** Scripts, documentation, and assets that agents can use.

## Available skills

The [Wix Skills repository](https://github.com/wix/skills) includes skills for different development workflows, such as building Wix app extensions with the CLI and managing Wix business solutions using the REST API.

## Install Wix Skills

To install Wix Skills, run:

```bash
npx skills add wix/skills
```

> **Note:** Add `-g` to install globally and make Wix Skills available across all your projects.


## See also

- [Wix plugin](https://dev.wix.com/docs/api-reference/articles/ai-tools/about-the-wix-plugin.md)
- [Wix Skills repository](https://github.com/wix/skills)
- [CLI sample prompts](https://dev.wix.com/docs/wix-cli/guides/development/about-wix-skills.md#sample-prompts)
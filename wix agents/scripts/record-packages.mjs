import { writeFileSync } from "node:fs";
import { createRequire } from "node:module";

const require = createRequire(import.meta.url);

const packages = ["@wix/cli", "@wix/mcp-remote", "@wix/agent-skills"];
const lines = [
  "# Installed npm packages",
  "",
  `Recorded at: ${new Date().toISOString()}`,
  "",
];

for (const name of packages) {
  try {
    const pkg = require(`${name}/package.json`);
    lines.push(`- ${name}@${pkg.version}`);
  } catch {
    lines.push(`- ${name}: not resolved after install`);
  }
}

writeFileSync(new URL("../docs/NPM_PACKAGES.md", import.meta.url), `${lines.join("\n")}\n`);

# What I need you to do on the Wix website

I cannot sign into Wix, click in the Editor, or create API keys for you. Do these steps on **your** Wix account, then send me the filled `templates/SITE_INFO.md`.

Do **not** paste API keys into this git repo, a pull request, or a public chat. Put secrets in Cursor Cloud Agent secrets or a local `.env` file that stays untracked.

---

## 1. Confirm the site type (2 minutes)

Open the site in Wix and note which editor you use:

- **Wix Studio**, or
- **Wix Editor**

Also write down:

- The public site URL (example: `https://www.yourdomain.com`)
- The site name as it appears in your Wix dashboard

If this is a classic Editor site with almost no custom code, I can still help with CMS, forms, stores, and backend APIs after MCP is connected. Visual layout (moving boxes, themes, drag-and-drop) stays in the Wix Editor.

---

## 2. Turn on coding (required)

**Wix Studio**

1. Open the site.
2. Open the **Code** sidebar.
3. Click **Start Coding** if it is not already on.

**Wix Editor**

1. Open the site.
2. Turn on **Dev Mode / Velo**.

If Git Integration is greyed out because **Velo Packages** are installed, remove those packages first. npm packages are fine; Velo Packages are not supported with Git Integration.

Official guide: [Set Up Git Integration & Wix CLI](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli/setting-up-git-integration-wix-cli)

---

## 3. Connect the site to GitHub (required for Cloud Agents)

This is the most important Wix-side step. Cloud Agents work on a GitHub repo, not inside the visual Editor.

1. In the Code sidebar, open **GitHub Integration**.
2. Click **Connect to GitHub**.
3. Sign in to GitHub and authorize Wix / Velo.
4. Create a **new private repo** (suggested name: `your-site-wix`).
5. Install the Velo GitHub app on **that repo only**.
6. Copy the clone commands Wix shows (also available later under **Local Dev Setup**).
7. Save the GitHub URL. Example: `https://github.com/your-user/your-site-wix`

After this, **site code in the Editor becomes read-only**. You still change layout in the Editor. Page/backend/CSS code moves to GitHub.

Send me:

- The GitHub repo URL
- The default branch name (`main` or `master`)

---

## 4. Create a Wix API key (required for agents to call Wix APIs)

1. Open [API Keys Manager](https://manage.wix.com/account/api-keys) while logged into the same Wix account that owns the site.
2. Generate an API key.
3. Enable at least:
   - **Wix CLI - Git Integration** (or **Wix CLI for Sites - Git Integration**)
   - Site permissions you want the agent to use (CMS, Stores, Bookings, Blog, etc.)
4. Copy the key once. Store it as `WIX_API_KEY`.
5. On the same page, copy your **Account ID**. Store it as `WIX_ACCOUNT_ID`.

In Cursor: [Cloud Agent secrets](https://cursor.com/dashboard/cloud-agents) → add:

- `WIX_API_KEY`
- `WIX_ACCOUNT_ID`

On your computer, copy `.env.example` to `.env` and fill the same values. Never commit `.env`.

---

## 5. Copy the site ID (required)

1. In Wix, open **Site settings** or the site dashboard.
2. Copy the **Site ID** (a UUID).

You can also find it in the browser URL of some dashboard pages, or later in `wix.config.json` inside the GitHub repo Wix created.

Put it in `templates/SITE_INFO.md` as `WIX_SITE_ID`.

---

## 6. Connect GitHub to Cursor (required)

1. Open [Cursor Integrations](https://cursor.com/dashboard) and connect GitHub.
2. Grant access to the **Wix site repo** from step 3 (and this kit repo if you want both).
3. Start a Cloud Agent at [cursor.com/agents](https://cursor.com/agents).
4. Select the **Wix site GitHub repo**, not only this `wix agents` folder.

Paid Cursor plan is required for Cloud Agents.

---

## 7. Tell me what to change (required)

In `templates/SITE_INFO.md`, describe the first job in one paragraph. Examples:

- Add a contact form that saves to the CMS and emails you
- Fix the mobile menu / page code on Home
- Create a CMS collection for testimonials and bind it
- Add a members-only page backend check
- List products / bookings and explain the data model

Also say whether I am allowed to:

- [ ] Preview only
- [ ] Merge to the GitHub default branch
- [ ] Publish the live Wix site

Default if you do not say: **preview only, no publish**.

---

## 8. Optional but useful

- Invite me (your GitHub user) as a collaborator on the Wix site repo if the agent runs under a different GitHub account.
- Install the **Wix** Cursor plugin locally: in Cursor chat run `/add-plugin wix`.
- Add a GitHub Actions secret `WIX_CLI_API_KEY` on the site repo if you want preview/publish from CI.

---

## What you can skip

You do **not** need to:

- Paste your Wix password
- Give Editor collaborator access unless you want a human designer in the visual editor
- Export the whole site as HTML (Git Integration exports the **code**, not the drag-and-drop layout as HTML)

---

## After you finish

Reply with:

1. Completed `templates/SITE_INFO.md` (no secrets)
2. Confirmation that `WIX_API_KEY` and `WIX_ACCOUNT_ID` are in Cursor secrets
3. The first task you want done on the site

Then I can work on the connected GitHub repo and use the Wix MCP against the live site.

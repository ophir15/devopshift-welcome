> Portal Navigation:
> 
> - Append `.md` to any URL under `https://dev.wix.com/docs/` to get its markdown version.
> - Pages are either content pages (article or reference text) or menu pages (a list of links to child pages).
> - To get a menu page, truncate any URL to a parent path and append `.md` (e.g. `https://dev.wix.com/docs/sdk.md`, `https://dev.wix.com/docs/sdk/core-modules.md`).
> - Top-level index of all portals: https://dev.wix.com/docs/llms.txt
> - Full concatenated docs: https://dev.wix.com/docs/llms-full.txt

## Resource: MCP Sample Prompts

## Article: MCP Sample Prompts

## Article Link: https://dev.wix.com/docs/sdk/articles/use-the-wix-mcp/mcp-sample-prompts.md

## Article Content:

# Wix MCP Sample Prompts

Ready to build with AI? This article showcases some sample prompts and flows an AI client can run using the [Wix MCP](https://dev.wix.com/docs/sdk/articles/use-the-wix-mcp/about-the-wix-mcp.md)—giving you a strong starting point to explore what’s possible and accelerate your development.

## Perform site actions

Let’s say you want to take actions like updating store products, creating a new bookings service, or approving a member on a site. Instead of searching the documentation and implementing the APIs yourself, the Wix MCP can train your AI client to take these actions for you.

### Apply a Discount to your store’s products

**Prompt:** Apply a 15% discount to all products on the site Party Costume Store for 1 week starting from today.

**Expected AI response**: The AI client creates a coupon giving customers a discount for 15% off all products.

### Create a new data collection on your site

**Prompt:** Create a data collection called Contact Labels on my site with 3 columns: name (string), email (string), label (string). Encrypt the name and email fields as PII.

**Expected AI response**:
The AI client creates a data collection with the requested fields on the site. The name and email fields are marked as PII.

### Add a staff member to your business

**Prompt:** On site Joann’s Salon, add a new staff member with Wix Bookings.

**Expected AI response**:
The AI client adds a new staff member.

### Discover and book business services

**Prompt:** What are the services on site Tax Consultation Business?

**Expected AI response**:
The AI client queries the available services on the site and lists them for you. You can extend the prompt by requesting to book one of the services, and the client creates a new booking for you at the requested time.

### Send emails to store customers

**Prompt:** Send an inbox email message to Joe White in the site Just Bags. The message should say "This is a test message" and also attach an image.

**Expected AI response**:
The AI client searches for the contact and creates a new contact if it doesn’t find one. It then sends the inbox email message with the attached image.

### Create and publish posts in your blog

**Prompt:** Could you create 5 new blog posts for me? Use the site DIY Activities and make the posts about various topics–fishing, video-making, and yoga. Then publish these posts for me.

**Expected AI response**:
The AI client creates 5 new blog posts about the given topics and publishes them on the site.

## Build Headless sites

The Wix MCP makes it easy to develop your [Wix Headless](https://dev.wix.com/docs/go-headless.md) site directly in your AI client. The MCP helps your client set up a headless project and update the project code to take actions on your site.

### Create a headless site in your client

**Prompt:** Create a new Wix Headless site.

**Expected AI response**:
The AI client creates a new Wix Headless site in your [sites list](https://manage.wix.com/studio/sites?referralInfo=sidebar\&viewId=all-items-view).

### Create a login page and authenticate with Wix

**Prompt:** I want to create a log in page, and authenticate it using Wix Headless authentication. Add a new page in this project called `login.tsx` and write the code I need to authenticate with Wix.

**Expected AI response**:
The AI client creates a `login.tsx` file in your local repository and adds the code needed to authenticate with Wix.

### Write code that allows customers to register for events

**Prompt:** Write code for my current headless client that lets site visitors register for events. Add this code to a local file called `registration.tsx`.

**Expected AI response**:
The AI client creates an `registration.tsx` file in your local repository and adds code that uses the Events APIs to let visitors register for an event on the site.

### Display collection data on the frontend

**Prompt:** Retrieve data from my Wix CMS collection named "Real estate properties" and filter items where the title includes the word "beach". Display these items on a page called `items.tsx.`

**Expected AI response**:
The AI client finds and retrieves all properties with the word “beach” in the title from your headless site collection **Real estate properties**, and writes code to display them in `items.tsx`.

## Get code for your app

If you’re confused about how to create code using a specific API, or don’t want to code parts of your app yourself, you can ask the AI client to generate code for you. The Wix MCP trains the client to generate correct examples and flows for working with Wix APIs.

### Get JS code examples for the Wix Members APIs

**Prompt:** Give me example code in Node.js to use the Block Member method of Wix Members.

**Expected AI response**:
The AI client generates some JS code showing how to block a member using the Members API. You can copy this code or use further prompts to build more extensive code.

### Generate Python code to create a booking

**Prompt:** Show me python code that uses Create Booking from Wix Bookings.

**Expected AI response**:
The AI client returns the steps required to create a booking and gives a minimal code example that you can copy and expand on.

### Update dashboard page code to display a collection

**Prompt:** Show my `todos` collection in my app’s dashboard page.

**Expected AI response**:
The AI client edits the app code in your local files to display the collection as a table on the dashboard page.

### Write code to create a form in a dashboard page

**Prompt:** Create a form in my dashboard page with first name, last name and email.

**Expected AI response**:
The AI client adds Wix design system elements to the dashboard page code in your local editor to build a form with the requested fields. You can continue prompting it to add elements, required fields, and field validation to further develop your dashboard page form.

## Manage sites

The Wix MCP lets you perform site-level actions through the AI client, such as creating and publishing sites.

### Create a new Wix site from the client

**Prompt:** Can you create a new Wix site for me?

**Expected AI response**:
The client prompts you for some extra information, like the type of site and a site name, and then creates the site for you.

### Install apps on your Wix site

**Prompt:** Install Wix Blog for me on the site The Travel Writer.

**Expected AI response**:
The client installs Wix Blog on the requested site.

### Publish a Wix site from the client

**Prompt:** Publish the site The Travel Writer.

**Expected AI response**:
Publishes the site The Travel Writer.

## Tips for working with the MCP

Here's some tips to try if your AI client isn't returning the results you want:

### Be specific

When you write prompts for an AI client using the Wix MCP, the more specific the request is, the more likely it is that the result will be helpful and correct. Try the following to improve your client’s response:

  - Especially when starting a new chat, use the word “Wix” to cue the client to use the Wix MCP. For example: “On the Wix site…”, “...using the Wix APIs”.

  - Tell the client clearly which Wix business solution you’re referring to. For example, Wix Restaurants, Stores, and Events all have Orders APIs. To indicate which Orders API you want to use, include the name of the business solution you want to work with. For example, “List the orders on a site using the Events APIs”.

  - Give the client specific instructions on what you want it to do. This improves the response and prevents the client from changing files unexpectedly.
  
    For example, if you want example code you can copy, use a prompt like "Write sample code that uses the Wix Members API to block a member". If you want the client to create code for you, use a prompt like "Write code that blocks a member on a Wix site and add it to a file members.tsx".

### Switch your model

Sometimes even if the prompt is good, the request fails or doesn’t return the result you expect. The issue may be the LLM you’re working with. Common tools like Cursor and Windsurf use GPT-4.1 by default. Try changing to a different model such as Sonnet 3.7 or Gemini 2.5.

### Disable auto-run mode

Depending on the prompt you give it, your AI client may make changes to your local code files or live site. To prevent the client from making unwanted changes, consider disabling auto-run mode in the client settings. This forces the client to request your permission to run MCP tools, which gives you a chance to review any actions before it continues.

### Use templates

In particular if you're building an app or a headless site, we recommend starting your project from one of our [app](https://dev.wix.com/apps-templates) or [headless](https://dev.wix.com/docs/go-headless/self-managed-headless/templates/next-js-templates.md) templates. Then, you can return to your IDE and use the MCP to develop your project from the template. This gives the AI client more context about what you're trying to create, and may achieve better results.

## See also

- [About the Wix MCP](https://dev.wix.com/docs/sdk/articles/use-the-wix-mcp/about-the-wix-mcp.md)
- [Wix MCP Sample Prompts for App Developers](https://dev.wix.com/docs/build-apps/develop-your-app/wix-mcp/wix-mcp-sample-prompts-for-app-developers.md)
- [Wix MCP Sample Prompts for Headless](https://dev.wix.com/docs/go-headless/get-started/about-headless/wix-mcp-sample-prompts-for-headless.md)
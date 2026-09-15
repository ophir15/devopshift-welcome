> Portal Navigation:
> 
> - Append `.md` to any URL under `https://dev.wix.com/docs/` to get its markdown version.
> - Pages are either content pages (article or reference text) or menu pages (a list of links to child pages).
> - To get a menu page, truncate any URL to a parent path and append `.md` (e.g. `https://dev.wix.com/docs/sdk.md`, `https://dev.wix.com/docs/sdk/core-modules.md`).
> - Top-level index of all portals: https://dev.wix.com/docs/llms.txt
> - Full concatenated docs: https://dev.wix.com/docs/llms-full.txt

## Resource: GitHub Repository File Structure

## Article: Understanding Your Site's GitHub Repository

## Article Link: https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/git-hub-repository-file-structure.md

## Article Content:

# GitHub Repository File Structure

The repo's file structure matches the [public](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/velo-workspace/workspaces/wix-editor-working-with-the-code-sidebar.md#public), [backend](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/velo-workspace/workspaces/wix-editor-working-with-the-code-sidebar.md#backend), and [page code](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/velo-workspace/workspaces/wix-editor-working-with-the-code-sidebar.md#page-code) sections in the [Code sidebar](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/velo-workspace/workspaces/wix-editor-working-with-the-code-sidebar.md) (Wix Editor).

The file structure includes these important elements:

*   The [wix.config.json](#wixconfigjson) file found in the repo's root folder.
*   The **src** folder, that contains the following:
    
    *   The [Backend folder](#backend-folder)
    *   The [Pages folder](#pages-folder)
    *   The [Public folder](#public-folder)
    *   The [velo.dependencies.json](#velodependenciesjson) file (only exists once your first npm package is installed)
    

Add your code in either the **Pages**, **Backend**, or **Public** folders. Files or folders added to the root of the **src** folder are ignored.

>**Notes:** 
> The following Velo features can't be added to a site when using Git Integration & Wix CLI for Sites:
> *   [Custom Extensions (Beta)](https://dev.wix.com/docs/develop-websites/articles/coding-with-velo/integrations/service-plugins-formerly-spis/about-service-plugins.md)
> *   [Velo Packages](https://dev.wix.com/docs/develop-websites/articles/coding-with-velo/packages/working-with-velo-packages.md)

## Pages folder

This folder contains code files for each of the pages on your site as well as the [masterpage.js](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/velo-workspace/workspaces/wix-editor-working-with-the-code-sidebar.md#global-site) file. The code you add to these files runs when visitors open pages on your site. These files correspond to the ones found in the [**Main Pages**](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/velo-workspace/workspaces/wix-editor-working-with-the-code-sidebar.md#main-pages) section of the **Page Code**  ![](https://user-images.githubusercontent.com/89579857/184645988-6d4ee6d3-34ab-45bc-b914-5779a7de0cad.png)  tab in the Code sidebar.

When you add a page to your site in a Wix editor in your browser, a code file for that page gets added to your repo. The name of the file has 2 components: the name of the page that you define in the editor, and an internal ID string. The sections are separated by a period.

 ![](https://user-images.githubusercontent.com/89579857/188305074-6e2ee718-13b8-435d-9c75-bcb126f35718.png) 

When you [add a dynamic page](https://support.wix.com/en/article/content-manager-about-dynamic-pages#adding-dynamic-pages) to your site 2 code files are added to the site's repo corresponding to the dynamic list and dynamic item pages.

When you open a page's code file, you see the same sample code that appears in these code files in Wix editors in your browser.

 ![](https://user-images.githubusercontent.com/89579857/184646571-1e14f166-2b86-4f21-bf57-83468251bca8.png) 

When you delete a page in a Wix editor in your browser, the page's corresponding code file is deleted from your repo.

>**Notes:** 
> *   You can't create new code files for pages from your IDE. To add a file, create a new page for your site in a Wix editor in your browser, and [sync](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/about-the-local-editor.md) your site with your local IDE.
> *   Do not rename code files for pages. Wix uses these file names to associate the files with the appropriate pages on your site. If you rename a file, your code is ignored and a new code file is created for the page.

## Backend folder

This folder contains the backend code files for your site. These files correspond to the ones found in the [**Backend**](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/velo-workspace/workspaces/wix-editor-working-with-the-code-sidebar.md#backend) section of the **Public & Backend** tab in the Code sidebar. Add the following files to this folder to include them in your site:

*   [**Web Modules:**](https://dev.wix.com/docs/develop-websites/articles/coding-with-velo/backend-code/web-modules/call-backend-code-from-the-frontend.md) These are files that allow you to expose functions in your site's backend that you can run in your frontend code. These files require a `.web.js` file extension. 

    > **Note:** For web modules with a `.jsw` extension, permissions are managed using the [permissions.json](#permissionsjson) file. Note that `.jsw` web modules are deprecated, although still supported for backward compatibility for both Wix Editor and Wix Studio.
    
*   **data.js:** A file for [adding data hooks](https://dev.wix.com/docs/develop-websites/articles/databases/wix-data/hooks/using-data-hooks.md) to your site's collections.
    
*   **routers.js:** A file for implementing [routing and sitemap](https://dev.wix.com/docs/develop-websites/articles/coding-with-velo/routers/about-routers.md) functionality for your site.
    
*   **events.js:** A file for implementing your site's [backend event handlers](https://dev.wix.com/docs/develop-websites/articles/coding-with-velo/backend-code/events/about-backend-events.md).
    
*   **http-functions.js:** A file for implementing [HTTP endpoints](https://www.wix.com/velo/reference/wix-http-functions/introduction) that are exposed on your site.
    
*   **jobs.config:** A file for [scheduling recurring jobs](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/recurring-jobs/about-scheduling-recurring-jobs.md). Jobs consist of other backend code that's run at regular intervals.
    
*   **General backend files:** JavaScript code files. You can import code from these files into any other backend file on your site. These files require a `.js` file extension.
    

Use the following syntax to import code from backend files:

```javascript
import { myFunctionName } from 'backend/myFileName';
```

Trying to import from the relative path in your site's repo doesn't work.

### permissions.json

<details>
<summary> When using `.jsw` (deprecated) web modules, you can't change permissions in the editor when using Git Integration & Wix CLI for Sites. Instead, use the permissions.json file to set function permissions. 
</summary>
&nbsp;

The backend folder also contains the **permissions.json** file. This file defines [permissions](https://dev.wix.com/docs/develop-websites/articles/coding-with-velo/backend-code/web-modules/about-web-modules.md#permissions) for the functions in your web module files. The file contains a key, `"web-methods"`, whose value is an object that contains keys named after the web module files in your backend folder. Name these keys with the following syntax: `"backend/{path to file}/myFile.jsw"`. The value for each file name key is an object that contains keys named after the functions in that file. Each function key has a value with the following format:

```json
"myFunction": {
  "siteOwner" : {
    "invoke" : // Boolean
  },
  "siteMember" : {
    "invoke" : // Boolean
  },
  "anonymous" : {
    "invoke" : // Boolean
  }  
}
```

These values reflect the different levels of web module function permissions. You should set them using the following options:

*   **Owner-only access**:
    
    *   `siteOwner.invoke`: `true`
    *   `siteMember.invoke`: `false`
    *   `anonymous.invoke` : `false`
    
*   **Site member access**:
    
    *   `siteOwner.invoke`: `true`
    *   `siteMember.invoke`: `true`
    *   `anonymous.invoke` : `false`
    
*   **Anyone can access**:
    
    *   `anonymous.invoke`: `true`
    *   `siteMember.invoke` : `true`
    *   `anonymous.invoke`: `true`
    

The `"web-methods"` object must also contain a `"*"` key. The value for this key defines the default permissions that are applied to any function whose permissions you don't set manually.

Here is an example `permissions.json` file for a site with a backend file called `helperFunctions.jsw`. The file's functions are called `calculate`, `fetchData`, and `syncWithServer`. In this case anyone can call `calculate`, site members can call `syncWithServer`, and only site owners can call `fetchData`.

```json
{
  "web-methods": {
    "*": {
      "*": {
        "siteOwner": {
          "invoke": true
        },
        "siteMember": {
          "invoke": true
        },
        "anonymous": {
          "invoke": true
        }
      }
    },
    "backend/helperFunctions.jsw": {
      "calculate": {
        "siteOwner": {
          "invoke": true
        },
        "siteMember": {
          "invoke": true
        },
        "anonymous": {
          "invoke": true
        }
      },
      "fetchData": {
        "siteOwner": {
          "invoke": true
        },
        "siteMember": {
          "invoke": false
        },
        "anonymous": {
          "invoke": false
        }
      },
      "syncWithServer": {
        "siteOwner": {
          "invoke": true
        },
        "siteMember": {
          "invoke": true
        },
        "anonymous": {
          "invoke": false
        }
      }
    }
  }
}
```
</details>

## Public folder

This folder contains the public code files for your site. These files correspond to the ones found in the [**Public**](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/velo-workspace/workspaces/wix-editor-working-with-the-code-sidebar.md#public) section of the **Public & Backend**  tab in the Code sidebar. You can import code from these files into any other file on your site.

Use the following syntax to import code from public files:

```javascript
import { myFunctionName } from 'public/myFileName';
```

Trying to import from the relative path in your site's repo doesn't work.

## velo.dependencies.json

This file is created automatically when you install your first npm package. Wix uses this file to track the [npm packages](https://dev.wix.com/docs/develop-websites/articles/coding-with-velo/packages/about-npm-packages.md) installed on your site. The file is updated automatically when you [install a package](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/wix-cli-for-sites-commands.md) with the Wix CLI for Sites. Don't change this file manually.

## wix.config.json

Wix uses this file to associate your repo's code with a particular site and [UI version](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli-for-sites/about-the-local-editor.md). This file is updated automatically when your repo is synced with the Wix editors. Don't change this file manually.

## See also

* [Publish a Site with Git Integration & Wix CLI for Sites](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli/publishing-a-site-with-git-integration-wix-cli.md)
* [Test Your Code in the Local Editor](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli/test-your-code-in-the-local-editor.md)
* [Fix a Broken Git Integration](https://dev.wix.com/docs/develop-websites/articles/workspace-tools/developer-tools/git-integration-wix-cli/fixing-a-broken-git-hub-integration.md)
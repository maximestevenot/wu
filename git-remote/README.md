# Git Remote Server Helpers

## Gitlab Specific

**Environement Variables:**
| Variable          | Description              |
|-------------------|--------------------------|
| GITLAB_SERVER_URL | URL of the gitlab server |
| GITLAB_API_TOKEN | Token with min "read api" privileges |

### Issue and epics

Those functions help you to open easily a given issue or epic in your browser.  
Additionally, you can print summary and description in the shell directly 

ISSUES_PROJECT_PATH


```shell
> epic 42 #Open epic id 42 in the browser
> issue -p 4242 #Print issue 4242 basic info
> issue -p -d 4242 #Print issue 4242 basic info + description
```

| Variable          | Description              |
|-------------------|--------------------------|
| ISSUES_PROJECT_ID | ID of the project containing issues |
| EPICS_GROUP_ID | ID of the group containing epics |


**Dependencies**:

- `mdless`: less markdown files
- `jq`: manipulates json files
- `open`: built-in macos tool to open file or folder in default app. (Can be replaced by `xdg-open` on debian based distribution)
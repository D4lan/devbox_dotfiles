local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node

local function split_lines(str)
    local t = {}
    for line in str:gmatch("([^\r\n]*)\r?\n?") do
        table.insert(t, line)
    end
    return t
end

local aider_options = [[#############
## Specify the model to use for the main chat
#model: deepseek/deepseek-reasoner

## Use architect edit format for the main chat
#architect: true

## Specify the model to use for editor tasks (default depends on --model)
#editor-model: anthropic.claude-3-5-sonnet-latest

## Always say yes to every confirmation
#yes-always: true

## Enable/disable automatic testing after changes (default: False)
#auto-test: true

## Specify command to run tests
#test-cmd: go test ./...

## specify a file to edit (can be used multiple times)
#file: xxx
## Specify multiple values like this:
#file:
#  - xxx
#  - yyy
#  - zzz

## specify a read-only file (can be used multiple times)
#read: xxx
## Specify multiple values like this:
#read:
#  - xxx
#  - yyy
#  - zzz


##################################
## Specify the model to use for commit messages and chat history summarization (default depends on --model)
#weak-model: xxx

## Specify the edit format for the editor model (default: depends on editor model)
#editor-edit-format: xxx

## Soft limit on tokens for chat history, after which summarization begins. If unspecified, defaults to the model's max_chat_history_tokens.
#max-chat-history-tokens: xxx

#################
# Cache settings:

## Enable caching of prompts (default: False)
#cache-prompts: false

## Number of times to ping at 5min intervals to keep prompt cache warm (default: 0)
#cache-keepalive-pings: false

################
# History Files:

## Specify the chat input history file (default: .aider.input.history)
#input-history-file: .aider.input.history

## Specify the chat history file (default: .aider.chat.history.md)
#chat-history-file: .aider.chat.history.md

## Restore the previous chat history messages (default: False)
#restore-chat-history: false

## Log the conversation with the LLM to this file (for example, .aider.llm.history)
#llm-history-file: xxx

##################
# Output settings:

## Show diffs when committing changes (default: False)
#show-diffs: false

###############
# Git settings:

## Enable/disable looking for a git repo (default: True)
#git: true

## Specify the aider ignore file (default: .aiderignore in git root)
#aiderignore: .aiderignore

## Only consider files in the current subtree of the git repository
#subtree-only: false

## Enable/disable auto commit of LLM changes (default: True)
#auto-commits: true

## Enable/disable commits when repo is found dirty (default: True)
#dirty-commits: true

## Attribute aider code changes in the git author name (default: True)
#attribute-author: true

## Attribute aider commits in the git committer name (default: True)
#attribute-committer: true

## Prefix commit messages with 'aider: ' if aider authored the changes (default: False)
#attribute-commit-message-author: false

## Prefix all commit messages with 'aider: ' (default: False)
#attribute-commit-message-committer: false

## Commit all pending changes with a suitable commit message, then exit
#commit: false

## Specify a custom prompt for generating commit messages
#commit-prompt: xxx

## Perform a dry run without modifying files (default: False)
#dry-run: false

## Skip the sanity check for the git repository (default: False)
#skip-sanity-check-repo: false

## Enable/disable watching files for ai coding comments (default: False)
#watch-files: false

########################
# Fixing and committing:

## Lint and fix provided files, or dirty files if none provided
#lint: false

## Specify lint commands to run for different languages, eg: "python: flake8 --select=..." (can be used multiple times)
#lint-cmd: xxx
## Specify multiple values like this:
#lint-cmd:
#  - xxx
#  - yyy
#  - zzz

## Enable/disable automatic linting after changes (default: True)
#auto-lint: true

############
# Analytics:

## Enable/disable analytics for current session (default: random)
#analytics: xxx

## Specify a file to log analytics events
#analytics-log: xxx

## Permanently disable analytics
#analytics-disable: false

#################
# Other settings:

## Enable verbose output
#verbose: false

## Load and execute /commands from a file on launch
#load: xxx

## Specify the encoding for input and output (default: utf-8)
#encoding: utf-8

## Line endings to use when writing files (default: platform)
#line-endings: platform

## Specify the config file (default: search for .aider.conf.yml in git root, cwd or home directory)
#config: xxx

## Specify the .env file to load (default: .env in git root)
#env-file: .env

## Enable/disable suggesting shell commands (default: True)
#suggest-shell-commands: true

## Specify which editor to use for the /editor command
#editor: xxx]]

luasnip.add_snippets("yaml", {
    s("aider-config", {
        i(0), -- Moves cursor to the beginning after snippet expansion
        t(split_lines(aider_options)),
    }),
})

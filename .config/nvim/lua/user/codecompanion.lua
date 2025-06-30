local ai_status_ok, ai = pcall(require, "codecompanion")
if not ai_status_ok then
    return
end

ai.setup({
    strategies = {
        chat = {
            adapter = "openai",
        },
        inline = {
            adapter = "openai",
        },
    },
    adapters = {
        litellm = function()
            return require("user.codecompanion-adapter")
        end,
        work_litellm = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                    url = "http://localhost:4000",
                    api_key = "masterkey",
                },
                schema = {
                    model = {
                        -- default = "dev_claude-3-5-sonnet-20241022",
                        default = "dev_gpt-4o",
                        choices = {
                            "dev_gpt-4o",
                            "dev_claude-3-5-sonnet-20241022",
                        },
                    },
                    
                }
            })
        end,
        -- openai = function()
        --     return require("codecompanion.adapters").extend("openai", {
        --         env = {
        --             api_key = "OPENAI_API_KEY",
        --         },
        --         schema = {
        --             model = {
        --                 default = "gpt-4o",
        --                 choices = {
        --                     "gpt-4o",
        --                     "o1-mini",
        --                     "o1",
        --                     "gpt-4o-mini",
        --                     "gpt-4-turbo-preview",
        --                     "gpt-4",
        --                     "gpt-3.5-turbo",
        --                 },
        --             }
        --         }
        --     })
        -- end,
    },
    display = {
        chat = {
            show_settings = true, -- Enable display of schema settings in the chat buffer
        },
    },
    opts = {
        log_level = "DEBUG", -- or "TRACE"
    }

})

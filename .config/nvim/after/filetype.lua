vim.filetype.add({
    filename = {
        ['dot_zshrc'] = 'zsh',
        ['dot_tmux.conf'] = 'tmux',
        ['dot_vimrc'] = 'vim',
        ['flow'] = 'json',
        ['folder'] = 'json',
        ['dot_gitconfig.tmpl'] = 'gitconfig',
        ['run_once_after_update-preferences-darwin.sh.tmpl'] = { 'sh' }
    },
    extension = {
        tfvars = "terraform"
    },
    pattern = {
        ['*.sh.tmpl'] = 'sh',
        ['*.ps1.tmpl'] = 'ps1',
        ['*.tfvars'] = 'terraform',
        -- ['dot_*'] = function(bufname)
        --                 Name = string.gsub(bufname, "dot_", "")
        --                 vim.b.filename = Name
        --             end
    }
})

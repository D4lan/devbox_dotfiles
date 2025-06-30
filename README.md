# New Computer Install

## MacOS
1. Run the following:
`< /dev/zero ssh-keygen -q -N "" && cat ~/.ssh/id_ed25519.pub | pbcopy`
2. The needed info is now in you clipboard
3. Go to Github and login, paste as ssh key
4. Run `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply d4lan`

## Windows
- Run `oh-my-posh font install` and check VictorMono
- Once you have installed a Nerd Font, you will need to configure the Windows Terminal to use it. This can be easily done by modifying the Windows Terminal settings (default shortcut: CTRL + SHIFT + ,). In your settings.json file, add the font.face attribute under the defaults attribute in profiles

```
{
    "profiles":
    {
        "defaults":
        {
            "font":
            {
                "face": "MesloLGM NF"
            }
        }
    }
}
```

# Additional steps
Link Google account to wiki's
- ```ln -s /Users/dylanw/Library/CloudStorage/GoogleDrive-dylanperezwalker@gmail.com/My\ Drive/RemitlyWiki/ ~/remitlywiki```
- ```ln -s /Users/dylanw/Library/CloudStorage/GoogleDrive-dylanperezwalker@gmail.com/My\ Drive/PersonalWiki/ ~/personalwiki```


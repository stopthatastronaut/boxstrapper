# brew stuff goes here

Function Install-Thing {
    param($name)
}

brew install macdown  # ?? 
brew install kid3     
brew install moom     # mmoms - need to figure out the licence apply
brew install krita    # video?
brew install finch   # docker thing
brew install act  # github actions


brew tap azure/functions
brew install azure-functions-core-tools@4
# if upgrading on a machine that has 2.x or 3.x installed:
# brew link --overwrite azure-functions-core-tools@4

# show all files by default
defaults write http://com.apple.Finder AppleShowAllFiles true

brew install starship

if(-not (Test-Path $profile)) {
    New-item -force $PROFILE
}


'eval "$(starship init zsh)"' >> ~/.zshrc
'eval "$(starship init powershell)"' >> $profile

brew install dashlane/tap/dashlane-cli




# brew stuff goes here

Function Install-Thing {
    param($name)
}

brew install macdown
brew install kid3
brew install moom
brew install krita
brew install finch

# show all files by default
defaults write http://com.apple.Finder AppleShowAllFiles true

brew install starship

if(-not (Test-Path $profile)) {
    New-item -force $PROFILE
}


'eval "$(starship init zsh)"' >> ~/.zshrc
'eval "$(starship init powershell)"' >> $profile

brew install dashlane/tap/dashlane-cli




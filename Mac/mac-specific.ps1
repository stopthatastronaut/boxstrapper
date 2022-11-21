# brew stuff goes here

Function Install-Thing {
    param($name)
}

brew install macdown

# show all files by default
defaults write http://com.apple.Finder AppleShowAllFiles true

brew install starship

'eval "$(starship init zsh)"' >> ~/.zshrc


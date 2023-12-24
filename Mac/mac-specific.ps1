# brew stuff goes here

Function Install-Thing {
    param($name)
}

brew install macdown
brew install kid3
brew install moom

# show all files by default
defaults write http://com.apple.Finder AppleShowAllFiles true

brew install starship

'eval "$(starship init zsh)"' >> ~/.zshrc


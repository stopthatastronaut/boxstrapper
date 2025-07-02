# brew stuff goes here

Function Install-Thing {
    param($name)
}

$catalog = gc brewcatalog.txt

$catalog | % {
    brew install $_
}

brew install macdown
brew install kid3
brew install moom
brew install krita
brew install finch
brew install starship
brew install python3

brew tap azure/functions
brew install azure-functions-core-tools@4
# if upgrading on a machine that has 2.x or 3.x installed:
# brew link --overwrite azure-functions-core-tools@4

# show all files by default
defaults write http://com.apple.Finder AppleShowAllFiles true


if(-not (Test-Path $profile)) {
    New-item -force $PROFILE
}


'eval "$(starship init zsh)"' >> ~/.zshrc
'eval "$(starship init powershell)"' >> $profile

brew install dashlane/tap/dashlane-cli


# echo out all defaults

defaults read > ./mac-available-defaults.json


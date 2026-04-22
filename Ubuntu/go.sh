# set up an ubuntu box or a WSL ubuntu CLI instance


# homebrew for the lolz

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# powershell
###################################
# Prerequisites

# Update the list of packages
sudo apt update

# Install pre-requisite packages.
sudo apt install -y wget apt-transport-https software-properties-common

# Get the version of Ubuntu
source /etc/os-release

# Download the Microsoft repository keys
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb

# Register the Microsoft repository keys
sudo dpkg -i packages-microsoft-prod.deb

# Delete the Microsoft repository keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt update

###################################
# Install PowerShell
sudo apt install -y powershell

# Start PowerShell
pwsh

# finch

# starship

# minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

# act
brew install act    

# terravision
sudo apt install -y libgraphviz-dev
pipx install terravision

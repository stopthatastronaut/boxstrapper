# pre-reqs and upgrade for Ubuntu Studio 24.0.4 LTS for 26.04
# via https://www.ubuntufree.com/upgrade-to-ubuntu-studio-26-04-lts/

#backup plasma configs
tar -czf ~/kde-config-backup-$(date +%Y%m%d).tar.gz ~/.config/plasma* ~/.local/share/plasma*

# metapackage
sudo apt install ubuntu-studio-desktop

# upgrade everything
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove

# upgrade package
sudo apt install update-manager-core

# make sure onedrive has synced
onedrive --sync

# execute the upgrade
#sudo do-release-upgrade -d
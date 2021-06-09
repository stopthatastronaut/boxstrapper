# load some functions for Windows
. ./../Windows/windows-specific.ps1



@(
    "vlc"
) | % { cinst $_ -y }
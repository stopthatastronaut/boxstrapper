# choco
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

@(
    "git",
    "poshgit",
    "googlechrome",
    "visualstudiocode",
    "NotepadPlusPlus",
    "pscx",
    "carbon",
    "putty",
    "awstools.powershell",
    "sysinternals",
    "haroopad"
) | % { cinst $_ -y }

#psreadline

Install-Package psreadline -force -skippublishercheck # why is ths not properly signed?
Install-Module AzureRM -Force

if(-not (Test-Path $home\source\repos))
{
    New-Item $home\source\repos -force
}

New-Alias $repos $home\source\repos

Start-Job { Update-Help } # in the background

# Octopus deploy cmd line tools

iwr https://octopus.com/downloads/latest/CommandLineTools -out-file $env:tmp\Octopus.tools.zip
Expand-Archive $env:tmp\Octopus.tools.zip c:\Octopus\Tools -force
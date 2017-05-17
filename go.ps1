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
    "awstools.powershell",
    "sysinternals",
    "WindowsAzurePowerShell"
) | % { cinst $_ -y }

#psreadline

Install-Package psreadline -force -skippublishercheck # why is ths not properly signed?

if(-not (Test-Path $home\source\repos))
{
    New-Item $home\source\repos -force
}
<#
    Sets up quite a lot of what Jason needs on a new laptop. There's probably a lot more, so this will grow over time.
#>

# chocolatey
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
    "haroopad",
    "evernote"
) | % { cinst $_ -y }

# psreadline
Install-Package psreadline -force -skippublishercheck # why is ths not properly signed?

# azureRM
Install-Module AzureRM -Force

# repo path. Why here? habit, pretty much
if(-not (Test-Path $home\source\repos))
{
    New-Item $home\source\repos -force
}

# ps help (as a job because YAWN)
Start-Job { Update-Help } # in the background

# Octopus deploy cmd line tools
iwr https://octopus.com/downloads/latest/CommandLineTools -out-file $env:tmp\Octopus.tools.zip
Expand-Archive $env:tmp\Octopus.tools.zip c:\Octopus\Tools -force
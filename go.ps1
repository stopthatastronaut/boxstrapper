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
    "evernote",
    "dashlane",
    "zoom",
    "slack",
    "dotnetcore"
) | % { cinst $_ -y }

# psreadline
Install-Package psreadline -force -skippublishercheck # why is this not properly signed?

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
if(-not (Test-Path c:\Octopus\Tools))
{
    New-Item c:\Octopus\Tools -type directory -force
}

iwr https://octopus.com/downloads/latest/CommandLineTools -outfile $env:tmp\Octopus.tools.zip
Expand-Archive $env:tmp\Octopus.tools.zip c:\Octopus\Tools -force


# vs code extensions
@(
    "aws-scripting-guy.cform",
    "Ionide.Ionide-fsharp",
    "ms-vscode.csharp",
    "ms-vscode.PowerShell",
    "PeterJausovec.vscode-docker",
    "ms-kubernetes-tools.vscode-kubernetes-tools",
    "ms-python.python",
    "redhat.vscode-yaml"
) | % { code --install-extension $_ }


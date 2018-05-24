<#
    Sets up quite a lot of what Jason needs on a new laptop. There's probably a lot more, so this will grow over time.
#>

Set-ExecutionPolicy unrestricted

# chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# reload so we seee choco
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")


@(
    "git",
    "poshgit",
    "googlechrome",
    "visualstudiocode",
    "VisualStudio2017Professional",
    "NotepadPlusPlus",
    "pscx",
    "carbon",
    "docker-for-windows",
    "putty",
    "awstools.powershell",
    "nodejs",
    "sysinternals",
    "haroopad",
    "evernote",
    "dashlane",
    "zoom",
    "slack",
    "dotnetcore",
    "awscli",
    "vagrant",
    "nuget.commandline"
) | % { cinst $_ -y }

# psreadline
Install-Package psreadline -verbose -force -skippublishercheck # why is this not properly signed?

# azureRM
Install-Module AzureRM -Force -verbose


Install-Module ACMESharp -Force -verbose 

# repo path. Why here? habit, pretty much
$repopath = "$home\source\repos"
if(-not (Test-Path $repopath ))
{
    New-Item $repopath -force -type Directory
    $o = new-object -com shell.application  
    $o.Namespace($repopath).Self.InvokeVerb("pintohome")
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

# code --list-extensions will give you a list
# vs code extensions
@(
    "aws-scripting-guy.cform",
    "eamodio.gitlens",
    "Ionide.Ionide-fsharp",
    "ms-vscode.csharp",
    "ms-vscode.PowerShell",
    "PeterJausovec.vscode-docker",
    "ms-kubernetes-tools.vscode-kubernetes-tools",
    "ms-python.python",
    "redhat.vscode-yaml",
    "sdras.night-owl",
    "ms-azuretools.vscode-azurefunctions"
) | % { code --install-extension $_ }

# dotnet new
dotnet new -i Amazon.Lambda.Templates::* 

# azure functions tools
npm i -g azure-functions-core-tools

# apply the pumpkin spice icon to Visual Studio Code

<#
$objShell = New-Object -comObject Shell.Application
$objDesktop = $objShell.NameSpace(0X0)
$shortcutFilename = "Visual Studio Code.lnk"
$objFolderItem = $objDesktop.ParseName($shortcutFilename)
$objShortcut = $objFolderItem.GetLink 
$iconpath = Resolve-Path ".\512px_visual_studio_code_1_17_icon_svg_4ba_icon.ico"
$objShortcut.SetIconLocation($iconpath,0)
$objShortcut.Save()
#>

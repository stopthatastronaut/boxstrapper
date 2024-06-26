<#
    Sets up quite a lot of what Jason needs on a new laptop. There's probably a lot more, so this will grow over time.
#>

$on_mac = (TERM_PROGRAM -eq "Apple_Terminal")

# Go get the SSH keys!

if ($on_mac) {
    # load some functions for Mac
    . ./../Mac/mac-specific.ps1
}
else {
    # load some functions for Windows
    . ./../Windows/windows-specific.ps1
}

@(
    "git",
    "poshgit",
    "googlechrome",
    "vscode",
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
    "nuget.commandline",
    "rubymine"
) | ForEach-Object { cinst $_ -y }

Set-ExecutionPolicy unrestricted


# F# Compiler SDK

Invoke-WebRequest -Uri "https://download.microsoft.com/download/F/3/D/F3D6045E-4040-4058-ADAD-2698F1793CBC/Microsoft.FSharp.SDK.Core.msi" -OutFile "$home\Downloads\Microsoft.FSharp.SDK.Core.msi"
msiexec /i "$home\Downloads\Microsoft.FSharp.SDK.Core.msi" /quiet


# reload so we seee choco
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine")

# psreadline
Install-Package psreadline -verbose -force -skippublishercheck # why is this not properly signed?

# AWS Lambda Tools
Install-Module AWSLambdaPSCore -Force

# azureRM
Install-Module Az -Force -verbose -AllowClobber

# letsencrypt
Install-Module ACMESharp -Force -verbose

# repo path. Why here? habit, pretty much
$repopath = "$home\source\repos"
if (-not (Test-Path $repopath )) {
    New-Item $repopath -force -type Directory
    $o = new-object -com shell.application
    $o.Namespace($repopath).Self.InvokeVerb("pintohome")
}

# ps help (as a job because YAWN)
Start-Job { Update-Help } # in the background

# Octopus deploy cmd line tools
if (-not (Test-Path c:\Octopus\Tools)) {
    New-Item c:\Octopus\Tools -type directory -force
}

Invoke-WebRequest -uri https://octopus.com/downloads/latest/CommandLineTools -outfile $env:tmp\Octopus.tools.zip
Expand-Archive $env:tmp\Octopus.tools.zip c:\Octopus\Tools -force


# code --list-extensions will give you a list
# vs code extensions
@(
    "aws-scripting-guy.cform",
    "eamodio.gitlens",
    "Ionide.Ionide-fsharp",
    "Ionide-FAKE",
    "Ionide-Paket",
    "ms-vscode.csharp",
    "ms-vscode.PowerShell",
    "ms-azuretools.vscode-bicep",
    "ms-azure-devops.azure-pipelines",
    "ms-azuretools.vscode-azureappservice",
    "ms-azuretools.vscode-azurefunctions",
    "ms-azuretools.vscode-azureresourcegroups",
    "ms-azuretools.vscode-azurestorage",
    "ms-azuretools.vscode-azurevirtualmachines",
    "ms-azuretools.vscode-cosmosdb",
    "ms-azuretools.vscode-docker",
    "PeterJausovec.vscode-docker",
    "ms-kubernetes-tools.vscode-kubernetes-tools",
    "ms-python.python",
    "redhat.vscode-yaml",
    "sdras.night-owl",
    "ms-azuretools.vscode-azurefunctions",
    "Azurite.azurite",
    "vsciot-vscode.vscode-arduino",
    "ms-vscode.azurecli",
    "KingWampy.raspberrypi-sync",
    "Pylance",
    "hashicorp.terraform",
    "Bicep",
    "mtxr.sqltools",   # sqlite and other db engines
    "hashicorp.terraform",
    "chrisdias.vscode-opennewinstance"
) | ForEach-Object { code --install-extension $_ }

# set the theme
$spath = "$home\AppData\Roaming\Code\User\settings.json"
$theme = 'Night Owl'
if (Test-Path $spath) {
    # does this exist by default? No idea. Handle all exigencies anyway.
    $codesettings = gc $spath -Verbose | ConvertFrom-Json
    if ($codesettings.'workbench.colorTheme') {
        $codesettings.'workbench.colorTheme' = $theme
    }
    else {
        $codesettings | Add-Member -MemberType NoteProperty -Name 'workbench.colorTheme' -Value $theme -Verbose
    }
    $codesettings | ConvertTo-json | Out-File $spath -verbose
}
else {
    @{ 'workbench.colorTheme' = $theme } | ConvertTo-json | Out-File $spath -verbose
}

# dotnet new
dotnet new -i "Amazon.Lambda.Templates::*"
dotnet new -i "Microsoft.AspNetCore.Blazor.Templates::3.0.0-*"
dotnet new -i "WebAPI.FSharp.Template::*"
dotnet new -i "RaspberryPi.Template::*"

# azure functions tools
npm i -g azure-functions-core-tools

./../set-vscode-icon.ps1

choco install nerd-fonts-FiraCode -y
choco install nerd-fonts-RobotoMono -y
choco install nerd-fonts-UbuntuMono -y
choco install starship -y 

Install-Module windowsconsolefonts -force 

Import-Module WindowsConsoleFonts

Set-ConsoleFont "RobotoMono Nerd Font Propo Th"


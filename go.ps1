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
    "nuget.commandline",
    "rubymine"
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

# F# Compiler SDK

Invoke-WebRequest -Uri "https://download.microsoft.com/download/F/3/D/F3D6045E-4040-4058-ADAD-2698F1793CBC/Microsoft.FSharp.SDK.Core.msi" -OutFile "$home\Downloads\Microsoft.FSharp.SDK.Core.msi"
msiexec /i "$home\Downloads\Microsoft.FSharp.SDK.Core.msi" /quiet

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
    "PeterJausovec.vscode-docker",
    "ms-kubernetes-tools.vscode-kubernetes-tools",
    "ms-python.python",
    "redhat.vscode-yaml",
    "sdras.night-owl",
    "ms-azuretools.vscode-azurefunctions"
) | % { code --install-extension $_ }

# set the theme
$spath = "$home\AppData\Roaming\Code\User\settings.json"
$theme = 'Night Owl'
if(Test-Path $spath) # does this exist by default? No idea. Handle all exigencies anyway.
{
    $codesettings = gc $spath -Verbose | ConvertFrom-Json
    if($codesettings.'workbench.colorTheme')
    {
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
dotnet new -i Amazon.Lambda.Templates::*

# azure functions tools
npm i -g azure-functions-core-tools

# apply the pumpkin spice icon to Visual Studio Code

# it's in "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio Code"

$objShell = New-Object -comObject Shell.Application
$objDesktop = $objShell.NameSpace("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio Code")
$shortcutFilename = "Visual Studio Code.lnk"
$objFolderItem = $objDesktop.ParseName($shortcutFilename)
$objShortcut = $objFolderItem.GetLink
$iconpath = Resolve-Path ".\512px_visual_studio_code_1_17_icon_svg_4ba_icon.ico" | select -expand Path
$objShortcut.SetIconLocation($iconpath,0)
$objShortcut.Save()

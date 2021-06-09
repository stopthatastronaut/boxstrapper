# chocolatey

Function Install-PackageManager {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

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


# F# Compiler SDK

Invoke-WebRequest -Uri "https://download.microsoft.com/download/F/3/D/F3D6045E-4040-4058-ADAD-2698F1793CBC/Microsoft.FSharp.SDK.Core.msi" -OutFile "$home\Downloads\Microsoft.FSharp.SDK.Core.msi"
msiexec /i "$home\Downloads\Microsoft.FSharp.SDK.Core.msi" /quiet

Function Install-Thing {
    param($name)
}

# chocolatey

# common to all PC types

Function Install-PackageManager {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

@(
    "googlechrome",
    "dashlane",
    "zoom",
    "firefox",
    "powershell-core"
) | ForEach-Object { cinst $_ -y }


Function Install-Thing {
    param($name)
}

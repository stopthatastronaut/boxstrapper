# apply the pumpkin spice icon to Visual Studio Code

# it's in "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio Code"

$objShell = New-Object -comObject Shell.Application
$objDesktop = $objShell.NameSpace("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio Code")
$shortcutFilename = "Visual Studio Code.lnk"
$objFolderItem = $objDesktop.ParseName($shortcutFilename)
$objShortcut = $objFolderItem.GetLink
$iconpath = Resolve-Path ".\Common\512px_visual_studio_code_1_17_icon_svg_4ba_icon.ico" | select -expand Path
$objShortcut.SetIconLocation($iconpath,0)
$objShortcut.Save()

Write-Host "VS Code icon set to $iconpath"

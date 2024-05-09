# stopthatastronaut/boxstrapper

Setup scripts for developer laptop and/or basic utility instances

Want to run me? First you need Powershell (for Mac & Windows)

Windows boxes will have Powershell 5.x installed by default. Should work on those. Macs, not so much. You need to `brew install powershell` there. There's a prerequisites shell script.


```
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/stopthatastronaut/boxstrapper/master/go.ps1'))
```

YMMV. This is pretty much just for me.

If you miss the old Pumpkin Spice Visual Studio Code icon, [it's here](Windows/set-vscode-icon.ps1)
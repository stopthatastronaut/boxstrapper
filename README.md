# stopthatastronaut/boxstrapper

Multifarious setup scripts for laptops/desktops/servers/stuff. Not all of these are in any way feature complete, but you might want to pick & mix as you go.

Want to run me? First you need Powershell. Then you'll need a package manager for your chosen OS.

- Mac - [Homebrew]
- Windows - [Chocolatey]
- Raspberry Pi - `apt` is built in unless you choose a weird install image

Windows boxes will have Powershell 5.x installed by default, though PowerShell Core (7+) is preferred. Should work on those. Macs, not so much. You need to `brew install powershell` there. There's a prerequisites shell script in the ./Mac folder.


```
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/stopthatastronaut/boxstrapper/master/go.ps1'))
```

YMMV. This is pretty much just for me.

If you miss the old Pumpkin Spice Visual Studio Code icon on Windows, [it's here](Windows/set-vscode-icon.ps1). I certainly found it useful when having VSCode _and_ Visual Studio installed together.
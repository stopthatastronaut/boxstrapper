# stopthatastronaut/boxstrapper

Setup scripts for developer laptop and/or basic utility instances

Want to run me? First you need Powershell (for Mac & Windows)

Windows boxes will have Powershell 5.x installed by default. Should work on those. Macs, not so much. You need to `brew install powershell` there. There's a prerequisites shell script.


```
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/stopthatastronaut/boxstrapper/master/go.ps1'))
```

YMMV. This is pretty much just for me. It is a mess at present, and has not kept up with my evolving laptop needs. I currently mostly use Mac for work - this started as a windows repo - and my personal machine is Ubuntu Studio with a small Windows partition for playing games occasionally. This is NOT a great repo. But it's useful now and again I guess.

If you miss the old Pumpkin Spice Visual Studio Code icon, [it's here](Windows/set-vscode-icon.ps1)
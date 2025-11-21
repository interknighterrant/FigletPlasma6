# Requirements
- KDE 6.0 + (tested on Arch with KDE 6.5.3)
- package *fidget* (see package manager, should be called fidget in there)

# Installation
- Download the current release zip archive
- Install via terminal:
```bash cd ~/Downloads && mkdir -p ~/.local/share/plasma/plasmoids/com.github.interknighterrant.plasmoid-6-figlet && unzip FigletPlasma6.zip -d ~/.local/share/plasma/plasmoids/com.github.interknighterrant.plasmoid-6-figlet && systemctl --user restart plasma-plasmashell.service```
- Install via gui:
  - Open Downloads folder in a file manager
  - Extract downloaded file: FigletPlasma6.zip
  - Edit > Cut the extracted folder *contents* and file *metadata.json*
  - Show hidden folders in your home folder, enter the *.local* folder
  - Enter the folder *share*
  - Create the folder *plasma*, if it does not exist, enter into the folder
  - Create the folder *plasmoids*, if it does not exist, enter into the folder
  - Create the folder *FigletPlasma6*, enter into the folder
  - Edit > Paste the extracted folder *contents* and file *metadata.json*
  - Log out and Log back in, add the widget to your panel

# About
This widget uses the command line utilty figlet to create ASCII art versions of text you enter.  The **Line Prefix Characters** option was added to easily use the ASCII art as comments for coding.

# Examples
## Result of: Line Prefix Characters: *none*  -  Text: Example  -  Font: Big  -  Limit Width: *unchecked*
 ______                           _      
|  ____|                         | |     
| |__  __  ____ _ _ __ ___  _ __ | | ___ 
|  __| \ \/ / _` | '_ ` _ \| '_ \| |/ _ \
| |____ >  < (_| | | | | | | |_) | |  __/
|______/_/\_\__,_|_| |_| |_| .__/|_|\___|
                           | |           
                           |_|           

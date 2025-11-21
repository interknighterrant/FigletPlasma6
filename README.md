# Requirements
- KDE 6.0 + (tested on Arch with KDE 6.5.3)
- package *figlet* (see package manager, should be called figlet in there)

# Installation
- Download the current release zip archive
- **OPTION 1:** Install via terminal:
```
cd ~/Downloads && \
mkdir -p ~/.local/share/plasma/plasmoids/com.github.interknighterrant.plasmoid-6-figlet && \
unzip FigletPlasma6.zip -d ~/.local/share/plasma/plasmoids/com.github.interknighterrant.plasmoid-6-figlet && \
systemctl --user restart plasma-plasmashell.service
```
  - Add the widget to your panel wherever you want
- **OPTION 2:** Install via gui:
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
## Result of: Line Prefix Characters: *none*  -  Text: ```Example```  -  Font: *Big*  -  Limit Width: *unchecked*
```
 ______                           _      
|  ____|                         | |     
| |__  __  ____ _ _ __ ___  _ __ | | ___ 
|  __| \ \/ / _` | '_ ` _ \| '_ \| |/ _ \
| |____ >  < (_| | | | | | | |_) | |  __/
|______/_/\_\__,_|_| |_| |_| .__/|_|\___|
                           | |           
                           |_|           
```

## Result of: Line Prefix Characters: ```//```  -  Text: ```Example of a long string with limit width```  -  Font: *smslant*  -  Limit Width: *checked*
```
//   ____                     __           ___         __              
//  / __/_ _____ ___ _  ___  / /__   ___  / _/ ___ _  / /__  ___  ___ _
// / _/ \ \ / _ `/  ' \/ _ \/ / -_) / _ \/ _/ / _ `/ / / _ \/ _ \/ _ `/
///___//_\_\\_,_/_/_/_/ .__/_/\__/  \___/_/   \_,_/ /_/\___/_//_/\_, / 
//                   /_/                                        /___/  
//       __      _                    _ __  __     ___       _ __ 
//  ___ / /_____(_)__  ___ _  _    __(_) /_/ /    / (_)_ _  (_) /_
// (_-</ __/ __/ / _ \/ _ `/ | |/|/ / / __/ _ \  / / /  ' \/ / __/
///___/\__/_/ /_/_//_/\_, /  |__,__/_/\__/_//_/ /_/_/_/_/_/_/\__/ 
//                   /___/                                        
//         _    ____  __ 
// _    __(_)__/ / /_/ / 
//| |/|/ / / _  / __/ _ \
//|__,__/_/\_,_/\__/_//_/
//                       
```

# Tips
- To add new fonts to the options, add FLF files to ```/usr/share/figlet/fonts``` folder.
- The font dropdown is sorted by modify date, most recent first.  To make your favorites at the top of the list run this command (as root or with sudo): ```touch /usr/share/figlet/fonts/FONTNAME.flf```
# Improved cd
## Description
this repo contains an improved version of the bash command `cd`.
## Install Instructions
1. copy the code of the file `improved_cd.sh`
2. launch terminal and open `~/.bashrc`
```
sudo nano ~/.bashrc
```
3. paste the code at the end of the File and save it -> `Ctrl+x -> Return`
4. update the bash sources
```
source ~/.bashrc
```
## Usage
```
cx - change and show directory contents.

  cx [PATH] ... [OPTION]
      
The function will show all the content of each directory it encounters in the specified PATH

  -ol    - only show the contents of the last directory of the given PATH.
  -hf    - show hidden Files in directories.
  -help  - show this help page
```

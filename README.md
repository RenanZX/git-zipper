# git-zipper
A zip generator for files in local or remote repository
(It only works in linux or WSL)

## Installation

1. Download the repository and place the ```.sh``` file at ```.local/bin``` folder (if you don't have this folder create it)
2. Insert the following lines at your .zshrc or .bashrc:
```
source "$HOME/.local/bin/zipper.sh"
```
3. Reset your bash or simply type ```source .zshrc``` or ```source .bashrc``` if you're not using oh-my-zsh.
4. It's recommended to add ```tozip``` folder in your ```.gitignore``` file of your local repository
5. You're ready to go

## Usage

Go to your local git repository and type ```git-zipper file_name.extension``` which ```filename``` is the file that you want to zip and the ```extension``` is the extension of your file.

All files will be placed at your repository folder named ```tozip``` and it'll preserve the same structure of your repository.

Example: If you have a README.md in ``path/src/README.md``, typing ```git-zipper README.md``` it will zip the file with the same structure ```path/src/README.md``` at folder ```tozip```.

### Commands

- ```git-zipper file_name.extension``` #It's going to zip a individual file in your repository
- ```git-zipper file_name1.extension file_name2.extension ...``` #It's going to zip more than one file in your local repository
- ```git-zipper commit <hash>``` #it's going to zip a committed files by hash

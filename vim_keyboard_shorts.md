### Basic Movement
- h: left one char 
- j: down one line 
- k: up one line 
- l: right one char
 **Train to not use the arrow keys**

- w: to move to the start of a word
- b: to move back one word 

### Locations
Windows: ~/AppData/Local/nvim/
Linux/unix: ~/ 

### Yanking or Copying
- yy: yank or make a copy of the line 
- -y$: yank everything from current cursor to end of line

### Manipulate the line
- p: place the line 1 line below current cursor position
- dd: delete the line
- shift + < or >: move indedent (combine with visual mode)

### Undo
- u: undo the last command
- ctrl + r : redo
**Ther are some quirks with undo, yanking and removing lines**

- shift + v: Highlight a line

### Inserting Quickly
- A goes to end of line and enters insert
- O Creates new line under current and enters insert

### Running Script
- :! clear; python3 % // will run currently accessed script

### Create Macros
- Press q<key> type macro (for example the python script from above> then press q

### Search Find and Replace 
1. `` :s/foo/bar/g `` Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
2. `` :%s/foo/bar/g`` Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.

### Edit VIMRC Quickly
:e $MYVIMRC


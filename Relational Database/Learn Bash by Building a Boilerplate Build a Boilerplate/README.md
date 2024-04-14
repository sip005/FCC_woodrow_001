# Steps

## 001  

The first thing you need to do is start the terminal. Do that by clicking the `"hamburger"` menu at the top left of the screen, going to the `"terminal"` section, and clicking "new terminal". Once you open a new one, type echo hello terminal into the terminal and press enter.  

```sh
echo hello terminal
```  

## 002  

What you see in the terminal below is a folder (or directory) on this machine. Type `pwd` into the terminal and press enter to see the path of the folder. `pwd` stands for "print working directory".  

```bash
pwd
```  

## 003  

The output tells you where the folder you are in is located. You are in the project folder, which is in the workspace folder. Type `ls` into the terminal to see what's in this folder. `ls` stands for "list".  

```bash
ls
```

## 004  

The output is showing everything in this folder. There's one folder in here. You can use `cd <folder_name>` to go into a folder. cd stands for "change directory". Change to the freeCodeCamp directory.  

```sh
cd freeCodeCamp
```  

## 005  

You are in the freecodecamp folder now. You may have noticed that the prompt changed to include it. Print the working directory of the freeCodeCamp folder to see the full path of where you are.  

```sh
pwd
```  

## 006  

ou can see the path of the `freeCodeCamp` folder. It's in the project folder you were just in. List the contents of the `freeCodeCamp` folder to see what's here.  

```sh
ls
```  

## 007  

There's several folders and files here. The folders are blue or green and the files include their extension. Next, change to that `test` directory.  

```sh
cd test
```  

## 008  

You can see you are in the `test` folder now. It shows test in the prompt. Print the full path of this directory. `Remember that "folder" and "directory" are the same thing.` 

```sh
pwd
```

## 009  

That's the path to the test folder, it's in the freeCodeCamp folder. List the contents of this folder.  

```sh
ls
```  

## 010  

These are all files. There's no more folders to go into here. You can use `cd ..` to go back a folder level. The two dots will take you back one level. Go back to the freeCodeCamp folder.  

```sh
cd ..
```  


## 011  

`test` got removed from the prompt since you left that folder and you're back in the freeCodeCamp folder. List the contents of what's here to remind yourself.  

```sh
ls
```  

## 012  

There's the test folder you were just in. You can see what's in a file with `more <filename>.` Use it to view what's in the package.json file.  

```sh
more package.json
```  

## 013  

It looks like a JSON object. You can empty the terminal with clear. The terminal looks a little cluttered, why don't you clear it.  

```sh
clear
```  

## 014  

Now you have a fresh screen 😄 List what's in here again.  

```sh
ls
```  

## 015  

You checked out the test folder and the package.json file. What next? Why don't you go into that node_modules directory.  

```sh
cd node_modules
```  

## 016  


Now the prompt includes node_modules since that's where you are. List what's in the folder.  

```sh
ls
```  

## 017 

That's a lot of folders. You can add a flag to a command to use it different ways like this: `ls <flag>`. List the contents of the node_modules folder in `"long list format"`. Do that by adding the `-l` flag to the "list" command.  

```sh
ls -l
```  

## 018  

It is showing more details about each item in here and it's a little easier to read. One of the folders is named has, why don't you change into it.  

```sh
cd has
```  

## 019  

You are now in the has folder. List its contents.  

```sh
ls
```

## 020  

There's a few files and folders here. Can you tell the difference? Take a look at more of that README.md file.  

```sh
more README.sh
``` 

## 021 

Nothing noteworthy in there. You can't see what's in the here anymore, list the contents again.

```sh
ls
```  

## 022  

That one file doesn't appear to have an extension. Strange. Take a look at more of the that "license" file that doesn't show an extension.  

```sh
more LICENSE-MIT
```  

## 023  

Pretend you read all that. It looks a little messy in here again so why don't you clear the terminal.  

```sh
clear
```  

## 024  

Better. Remind yourself what's in here with the list command.  

```sh
ls
```  

## 025  


Go into that src directory to see what you can find in there.  

```sh
cd  src
```  

## 026 

View the full path of this folder.  

```sh
pwd
```  

## 027  

Getting deeper still. You can see that each new folder has a / in front of it. Take a look at what's in this folder.

```sh
ls
```  

## 028  

Only one file here. Show me what's in it with more.

```sh  
more index.js
```  

## 029  

It's some JavaScript 😄 I think you've fooled around enough. Why don't you navigate out of here. Change back to the has directory.  

```sh
cd ..
```  

## 030  

You're getting pretty good. Change back to the node_modules directory.  

```sh
cd ..
```  

## 031  

You can go back two folders with `cd ../..` Each set of dots represents another folder level. Go back to the project directory from the node_modules directory.

```sh
cd ../..
```  

## 032  

You are back in the project folder where you started. List what's in here again.  

```sh
ls
```  

## 033  

That's right. Why don't you get a fresh start by clearing the terminal.  

```sh
clear  
```  

## 034  

You will be making a website boilerplate. You can make a new folder with `mkdir <folder_name>`. mkdir stands for "make directory". Make a website directory in this project folder. Remember that "directory" and "folder" mean the same thing.  

```sh
mkdir website
```   

## 035  

List what's here to make sure it got created.

```sh
ls
```  

## 036  

It worked. The website files will be in the new directory. Change to the website directory so you can start creating them.  

```sh
cd website
```  

## 037  

List the contents of the website folder.  

```sh
ls
```  

## 038  

It's brand new, there's nothing in it yet. The echo command lets you print anything to the terminal. You used it in the first lesson. Just type what you want to print after it. Use it to print hello website to the terminal.  

```sh
echo hello website
```  

## 039  

Websites usually have an index.html file. You can use `touch <filename>` to create a new file. Create index.html in the website folder.  

```sh
touch index.html
```  

## 040  

They usually have a CSS file as well. Create styles.css in the website folder using the same method.  

```sh
touch styles.css
```  

## 041  

List the contents of the website folder to make sure they got created.  

```sh
ls
```  

## 042  

There they are. Next is a JavaScript file. Create index.js in the website folder with the method you have been using.  

```sh
touch index.js
```  

## 043  

You might turn this into a git repository. Create .gitignore in the website folder with the same method.  

```sh
touch .gitignore
```  

## 044  

List the contents of the website folder to see your new files.  

```sh
ls
```  

## 045  

There's three files, but where's the .gitignore file? I think it's hidden. Most commands have a `--help` flag to show what the command can do. Display the `"help"` menu for the ls command. Here's an example: `command <flag>`.  

```sh
ls --help
```  

## 046  


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

```sh
ls -a
```  

## 047

```sh
cd .
```

## 048  

You didn't go anywhere. The . takes you to the folder you are in, and .. takes you back, or up, a folder. Websites need some images. Create background.jpg in the website folder.  

```sh
touch background.jpg
```  

## 049  

Next, add a header image. Create header.png in the website folder.  

```sh
touch header.png
```  

## 050  

Finally, create footer.jpeg in the website folder.  

```sh
touch footer.jpeg
```  

## 051  

Use the list command to check out the images you just added.  

```sh
ls
```  

## 052

Looks like images show up in pink. There's also three fonts to use for the website. The first one is "roboto". Create roboto.font in the website folder.  

```sh
touch roboto.font
```  

## 053  

The next one is "lato". Create lato.font in the website folder.  

```sh
touch lato.font
```  

## 054  

Lastly, create menlo.font in the website folder.  

```sh
touch menlo.font
```

## 055  

List the contents of this folder to see your new font files.  

```sh
ls
```

## 056  

Your three font files are there. There's three icons for the website as well. Create CodeAlly.svg in the website folder.  

```sh
touch CodeAlly.svg
```  

## 057  

Next, create CodeRoad.svg in the website folder.

```sh
touch CodeRoad.svg
```

## 058  

Finally, create freeCodeCamp.svg in the website folder.  

```sh
touch freeCodeCamp.svg
```  

## 059  

Check out the new icons you just added by listing the contents of the folder they are in.  

```sh
ls
```  

## 060  

The icons are pink as well. I think the images should go in a separate folder to clean it up a little. Make an images directory in the website folder to put them in.  

```sh
mkdir images
```  

## 061  

List the contents of the website folder to make sure your new folder is there.  

```sh
ls
```  

## 062  

There's your new images folder. It's blue. You can copy a file with cp <file> <destination>. cp stands for "copy". Copy background.jpg to your images folder.  

```sh
cp background.jpg ./images/
```

## 063  

Better make sure it worked. Change to the images directory.  

```sh
cd images
```

## 064  

List the contents to see if background.jpg is here.  

```sh
ls
```  

## 065  

There it is. Looks like the copy worked. Change back to the website directory so you can copy the other ones.  

```sh
cd ..
```  

## 066  

Remind yourself of the files here by listing the contents.  

```sh
ls
```

## 067  

You copied the background image to the images folder so you don't need the one here anymore. You can remove a file with rm <filename>. Remove background.jpg from the website folder.  

```sh
rm background.jpg
```  

## 068  

List the contents to make sure it's gone.

```sh
ls
```  

## 069  

Okay, it's gone. Next, copy header.png to the images folder.  

```sh
cp header.png ./images/
```

## 070

Last, copy the "footer" image to the images folder.  

```sh
cp footer.jpeg ./images/
```

## 071  

All the images should be copied over. Change to the images directory so you can make sure.  

```sh
cd images
```  

## 072  

Check if the images are here by listing the contents.  

```sh
ls
```

## 073  

They all made it here. Go back to the website folder so you can delete the original files.  

```sh
cd ..
```

## 074  

List the contents to remind yourself of the filenames to delete.  

```sh
ls
```  

## 075  

There's two that you don't need anymore. Remove the "header" image file from the website folder since you copied to the images folder.  

```sh
rm header.png
```

## 076  

It should be gone. Remove the "footer" image from the website folder as well.  

```sh
rm footer.jpeg
```  

## 077  

List the contents of the website folder to check if they are gone.  

```sh
ls
```  

## 078  

Looks like they're all deleted. There was a mistake with the extensions for the font files. You can rename them with mv like this: mv <filename> <new_filename>. mv stands for "move", it can rename or move something. Rename roboto.font to roboto.woff.  

```sh
mv roboto.font roboto.woff
```  

## 079  

Use "list" to check if it worked.

```sh
ls
```  

## 080  

Do you see the "roboto" font? The rename worked. Next, rename the "lato" font file to lato.ttf.  

```sh
mv lato.font lato.ttf
```  

## 081  

Lastly, rename the "menlo" font to menlo.otf. 

```sh
mv menlo.font menlo.otf
```

## 082  

Use the "list" command to make sure those last two got renamed.  

```sh
ls
```  

## 083  

Take a look at the files to make sure they got renamed. Those font files could be organized into a folder as well. Make a fonts directory in the website folder to put them in.  

```sh
mkdir fonts
```  

## 084  

```sh

```
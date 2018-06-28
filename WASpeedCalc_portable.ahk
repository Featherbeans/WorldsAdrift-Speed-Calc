/*
------------------------------------------------
WORLDS ADRIFT (tm) Estimated Speed Calc.
[version 1.0]

AutoHotkey Version: 1.1.29.01
Language:           English
Platform:           Win7, above & beyond
Author:             Featherbeans

Script Function:
        Gui that calculates the estimated speed of a ship according to the formula:
        Speed = Sqrt((Power*2)/Weight) * 50
        
A kind of Offline http://worldsadrift.science/

I just prefer this to a browser tab, tbh :D

------------------------------------------------


Important Notes:
----------------

I used - without permission - the logo and title pictures from Bossa's Worlds Adrift Website.

This little Autohotkey script has no profit intent. It may be used freely and freely shared. 


This is the product of the joy felt playing Worlds Adrift (https://wwww.worldsadrift.com).


Worlds Adrift is a registered trademark of Bossa Studios Ltd. (https://www.bossastudios.com/)





*/
#NoEnv
#SingleInstance force
SetWorkingDir %A_ScriptDir%
FileInstall, G:\WA speed calc\App background.png, %A_ScriptDir%\App background.png,1
FileInstall, G:\WA speed calc\WA logo.png, %A_ScriptDir%\WA logo.png, 1
FileInstall, G:\WA speed calc\WA logo.ico, %A_ScriptDir%\WA logo.ico, 1


Menu, Tray, Icon, %A_ScriptDir%\WA logo.ico
Menu, Tray, Icon,,, 1
Menu, Tray, NoStandard 
Menu, Tray, Add , E&xit, GuiClose ;


Gui, Color, 000000
Gui, Add, Picture, x10 y1 w333 h281 , %A_ScriptDir%\App background.png
Gui, Add, Picture, x172 y122 w130 h150 , %A_ScriptDir%\WA logo.png

Gui, Font, s9 cFFFFFF Bold, Arial
Gui, Add, Text, x16 y130 w100 h17 , Ship Weight :
Gui, Font, s9 cFFFFFF, Catamaran
Gui, Add, Edit, x16 y151 w95 h25 +Limit7 gESTSpeed vWeight 
Gui, Add, UpDown, gESTSpeed Range0-15000, 0
Gui, Font, s9 cFFFFFF Bold, Arial
Gui, Add, Text, x16 y180 w140 h17 , Total Engine Power :
Gui, Font, s9 cFFFFFF, Catamaran
Gui, Add, Edit, x16 y200 w95 h25 +Limit7 gESTSpeed vPower
Gui, Add, UpDown, gESTSpeed Range0-15000, 0
Gui, Font, s9 cFFFFFF Bold, Arial
Gui, Add, Text, x16 y232 w100 h17 , Estimated Speed
Gui, Font, s9 cFFFFFF, Roboto
Gui, Add, Edit, x16 y251 w93 h23 cWhite +Right +ReadOnly vCalc 
Gui, Font, s8 cFFFFFF, Catamaran
Gui, Add, Text, x114 y255 w33 h21 , Knots

Gui, Font, s7 cFFFFFF, Catamaran
Gui, Add, Text, x70 y98 w200 h14 , S p e e d   =   S q r t  (  ( Power * 2 )   /  Weight )  *  50

Gui, Show, x1560 y10 h282 w335, Worlds Adrift Speed Calc. Version 1.0

return
 
ESTSpeed:
Gui, Submit, noHide, 
GuiControl,,Calc, % Round((Sqrt((Power*2)/Weight) * 50),2)
return
 
GuiClose:
ExitApp




/*

To do (Soon tm) 

Toggle Always on top;
Toggle Darkmode On/Off;
Homogenize Fonts (I used 3... Arial , Catamaran and Roboto).


[version 0.923 - 24-6-2018] Release notes
-----------------------------------------------------------

.The version number is completely random :P;

.The Autohotkey math operator used to define
a result with a maximum of x decimal digits (i used 2)
is misleadingly called 'Round'... (see line 84);

.Fileinstall (lines 43, 44, 45) is used 
to include the specified files inside a compiled version of the script;

.+Limit7 (lines 61, 66) allows the user to input a maximum of 7 digits;  

.In general, the code is a mess, :).




[version  1.0 - 26-6-2018] Release Notes
-----------------------------------------------------------

.Added up/down arrows for weight and power vars; increments of 1.






HOW TO MAKE A PORTABLE .EXE YOURSELF
---------------------------------------

Anyone can compile their version of the script with autohotkey.
I recommend running Ahk2Exe.ahk from AutoHotkey\Compiler folder, once installed.

https://autohotkey.com/

https://github.com/fincs/Ahk2Exe






See you In game

Feather Out
*/

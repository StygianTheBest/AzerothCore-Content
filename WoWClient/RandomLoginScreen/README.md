    #############################################################################################################
    
     ____    __                                         ______  __              ____                    __      
    /\  _`\ /\ \__                  __                 /\__  _\/\ \            /\  _`\                 /\ \__   
    \ \,\L\_\ \ ,_\  __  __     __ /\_\     __      ___\/_/\ \/\ \ \___      __\ \ \L\ \     __    ____\ \ ,_\  
     \/_\__ \\ \ \/ /\ \/\ \  /'_ `\/\ \  /'__`\  /' _ `\ \ \ \ \ \  _ `\  /'__`\ \  _ <'  /'__`\ /',__\\ \ \/  
       /\ \L\ \ \ \_\ \ \_\ \/\ \L\ \ \ \/\ \L\.\_/\ \/\ \ \ \ \ \ \ \ \ \/\  __/\ \ \L\ \/\  __//\__, `\\ \ \_ 
       \ `\____\ \__\\/`____ \ \____ \ \_\ \__/.\_\ \_\ \_\ \ \_\ \ \_\ \_\ \____\\ \____/\ \____\/\____/ \ \__\
        \/_____/\/__/ `/___/> \/___L\ \/_/\/__/\/_/\/_/\/_/  \/_/  \/_/\/_/\/____/ \/___/  \/____/\/___/   \/__/
                        /\___/ /\____/                                                                         
                        \/__/  \_/__/               http://stygianthebest.github.io                              
    
    #############################################################################################################
    
    ### Description ###
    ---
    This is my collectiom of five animated login screens with custom music. A random screen will be chosen each time 
    you launch WoW.
    
    
    ### Features ###
    ------------------------------------------------------------------------------------------------------------------
    - Five animated login screens with music that are chosen at random.
    	- Dead King's Crypt
    	- The Tauren Chieftains
    	- Battle at the Dark Portal
    	- Arcadia
    	- Algalon the Observer
    - You can adjust how often a specific screen appears by editing the random value range. I currenly have Dead King's 
    Crypt loading 60% of the time because it's my favorite. If you want one screen to show every time, just set the 
    rand = X where X is a number in the range of the screen you want in x_vars_init.
    
    
    ### Files ###
    ------------------------------------------------------------------------------------------------------------------
    - WoWCustomExe.zip 
    	- A custom WoW 3.3.5a client binary required for use of files not stored in .MPQ archives
    - Interface files 
    	- These are the files that are normally in an .MPQ archive.
    
    
    ### Installation ###
    ------------------------------------------------------------------------------------------------------------------
    - Copy the Interface folder into your WoW/Data/ folder
    - Unzip and use the modified Wow.exe to launch the game.
    - You will need to adjust the IP Address to your private server in the LoginUI.lua file.
    - The visual FX objects are mapped based on screen resolution, so they may need to be tweaked. This can be done by 
    editing X,Y,Z,O coordinates for each object in x_vars_init.lua. I have included a sample file for 1024x768 resolution 
    as well.
    
    ~~~~
    			Scale	X	Y	Z	Orientation		Model
        ex: CreateModelFrame(0.05, 	3.17,	1.00,	0.00,	0.00, 	"Spells\\Archimonde_fire.m2")
    ~~~~
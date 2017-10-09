rem #############################################
rem #       AzerothCore Database Tools          #
rem # ----------------------------------------- #
rem #         StygianTheBest 7/21/17            #
rem # ----------------------------------------- #
rem # Make sure the Database server is running! #
rem #############################################

@echo off
SET NAME=AzerothCore Tools
TITLE %NAME%
REM 1(Blue), 2(Green), 3(Cyan), 4(Red), 5(Purple), 6(Yellow), 7(LGray), 8(Gray)
COLOR 2f
set mod=%1

REM --- Settings ---

REM AzerothCore Version
set wowbuild=12340

REM Default MySQL settings
set host=127.0.0.1
set port=3306
set user=azerothcore
set pass=azerothcore

set characters=characters
set world=world
set login=auth

REM --- Settings ---
cls
echo [- Initializing AzerothCore Database Tools -]

REM Check for restoration archives
IF EXIST %CD%\Tools\restore.zip. (
	RD /S /Q "Tools\restore_custom\auth"
	RD /S /Q "Tools\restore_custom\cfg"
	RD /S /Q "Tools\restore_custom\characters"
	RD /S /Q "Tools\restore_custom\world"
	RD /S /Q "Tools\restore_default\auth"
	RD /S /Q "Tools\restore_default\cfg"
	RD /S /Q "Tools\restore_default\characters"
	RD /S /Q "Tools\restore_default\world"	
	goto init
) ELSE (
	goto init
)

:init
IF EXIST %CD%\Tools\Backup\NUL (
	goto mysql
) ELSE (
	mkdir Backup
	goto mysql
)

:setup
cls
echo.
set /P host=Host [%host%]: 
set /P port=Port [%port%]: 
set /P user=User [%user%]: 
set /P pass=Pass [%pass%]: 
echo.
pause

:mysql
echo Checking database...
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld">NUL
if "%ERRORLEVEL%"=="0" goto menu
if "%ERRORLEVEL%"=="1" goto start_mysql

:start_mysql
start mysql_start.bat
ping -n 10 127.0.0.1>nul
goto mysql

:menu
cls
echo.
echo #############################################
echo #       AzerothCore Database Tools          #
echo # ----------------------------------------- #
echo #         StygianTheBest 7/21/17            #
echo # ----------------------------------------- #
echo # Make sure the Database server is running! #
echo #############################################
echo.
echo [--------- MySQL -----------]
echo.
echo Host: %host%
echo Port: %port%
echo User: %user%
echo Pass: %pass%
echo.
echo #############################################
echo.
echo [--------- Server ----------]
echo.

echo 0 - Change MySQL settings

IF EXIST %CD%\Tools\restore_custom.zip. (
echo 1 - Restore CUSTOM Server
)
IF EXIST %CD%\Tools\restore_default.zip. (
echo 2 - Restore DEFAULT Server
)

echo.
echo [---- Account/Character ----]
echo.
echo 3 - Export Accounts/Characters
echo 4 - Import Accounts/Characters
echo.
echo [---------- World ----------]
echo.
echo 5 - Export World
echo 6 - Import World
echo.
echo ############################################
echo.
set /P menu=Choose An Operation: 
if "%menu%"=="0" (goto setup)
if "%menu%"=="1" (goto restore_custom)
if "%menu%"=="2" (goto restore_default)
if "%menu%"=="3" (goto export_accounts)
if "%menu%"=="4" (goto import_accounts)
if "%menu%"=="5" (goto export_world)
if "%menu%"=="6" (goto import_world)
if "%menu%"=="" (goto menu)

:restore_custom
cls

REM Check for restoration archive
IF NOT EXIST %CD%\Tools\restore_custom.zip. (
    echo [- *** No Custom Restoration Archive Found *** -]
	echo.
	pause
	goto menu
)

echo.
echo                 [-----------------]
echo                 [- !!!WARNING!!! -]
echo                 [-----------------]
echo.
echo This process will RESTORE the CUSTOM server which
echo will overwrite existing Accounts, Characters, World
echo database files, core config files and contents of the
echo Tools\SQL folder. 
echo.
echo If you have any custom files in the SQL folder, you 
echo should SAVE them before proceeding. Press CTRL-C to 
echo cancel this operation at any time.
echo.
set /P menu=Are you sure want to RESTORE the CUSTOM server? (Y/N):
if /i "%menu%"=="n" (goto menu)
if /i "%menu%"=="y" (goto restore_custom)

:restore_custom
cls
RD /S /Q "Tools\restore_custom"
Tools\7Z x -y Tools\restore_custom.zip -oTools
echo.
echo [- Restoring Custom World -]
Tools\mysql -u %user% --password=%pass% -D world -e "DROP DATABASE world"
Tools\mysql -u %user% --password=%pass% -e "CREATE DATABASE world" 
for %%i in (Tools\restore_custom\world\*sql) do if %%i neq Tools\restore_custom\world\*sql Tools\mysql --default-character-set=utf8 -f -u %user% --password=%pass% -h %host% --port=%port% --database=%world% < %%i

echo [- Restoring Custom Accounts -]
Tools\mysql -u %user% --password=%pass% -D world -e "DROP DATABASE auth"
Tools\mysql -u %user% --password=%pass% -e "CREATE DATABASE auth" 
for %%i in (Tools\restore_custom\auth\*sql) do if %%i neq Tools\restore_custom\auth\*sql Tools\mysql --default-character-set=utf8 -f -u %user% --password=%pass% -h %host% --port=%port% --database=%login% < %%i

echo [- Restoring Custom Characters -]
Tools\mysql -u %user% --password=%pass% -D world -e "DROP DATABASE characters"
Tools\mysql -u %user% --password=%pass% -e "CREATE DATABASE characters" 
for %%i in (Tools\restore_custom\characters\*sql) do if %%i neq Tools\restore_custom\characters\*sql Tools\mysql --default-character-set=utf8 -f -u %user% --password=%pass% -h %host% --port=%port% --database=%characters% < %%i

REM echo [- Restoring Custom Configuration -]
REM del Core\authserver.conf
REM del Core\worldserver.conf
REM del Core\authserver.conf.dist
REM del Core\worldserver.conf.dist
REM copy /y Tools\restore_custom\cfg\authserver.conf Core\authserver.conf
REM copy /y Tools\restore_custom\cfg\worldserver.conf Core\worldserver.conf
REM copy /y Tools\restore_custom\cfg\authserver.conf.dist Core\authserver.conf.dist
REM copy /y Tools\restore_custom\cfg\worldserver.conf.dist Core\worldserver.conf.dist

REM echo.
REM echo [- Custom Server Restore Complete -]
echo.
pause
goto menu

:restore_default
cls

REM Check for restoration archive
IF NOT EXIST %CD%\Tools\restore_default.zip. (
    echo [- *** No Default Restoration Archive Found *** -]
	echo.
	pause
	goto menu
)

echo.
echo                 [-----------------]
echo                 [- !!!WARNING!!! -]
echo                 [-----------------]
echo.
echo This process will RESTORE the DEFAULT server which
echo will overwrite existing Accounts, Characters, World
echo database files, core config files and contents of the
echo Tools\SQL folder. 
echo.
echo If you have any custom files in the SQL folder, you 
echo should SAVE them before proceeding. Press CTRL-C to 
echo cancel this operation at any time.
echo.
set /P menu=Are you sure want to RESTORE the DEFAULT server? (Y/N):
if /i "%menu%"=="n" (goto menu)
if /i "%menu%"=="y" (goto restore_default)

:restore_default
cls
RD /S /Q "Tools\restore_default"
Tools\7Z x -y Tools\restore_default.zip -oTools
echo.
echo [- Restoring Default World -]
Tools\mysql -u %user% --password=%pass% -D world -e "DROP DATABASE world"
Tools\mysql -u %user% --password=%pass% -e "CREATE DATABASE world" 
for %%i in (Tools\restore_default\world\*sql) do if %%i neq Tools\restore_default\world\*sql Tools\mysql --default-character-set=utf8 -f -u %user% --password=%pass% -h %host% --port=%port% --database=%world% < %%i

echo [- Restoring Default Accounts -]
Tools\mysql -u %user% --password=%pass% -D world -e "DROP DATABASE auth"
Tools\mysql -u %user% --password=%pass% -e "CREATE DATABASE auth" 
for %%i in (Tools\restore_default\auth\*sql) do if %%i neq Tools\restore_default\auth\*sql Tools\mysql --default-character-set=utf8 -f -u %user% --password=%pass% -h %host% --port=%port% --database=%login% < %%i

echo [- Restoring Default Characters -]
Tools\mysql -u %user% --password=%pass% -D world -e "DROP DATABASE characters"
Tools\mysql -u %user% --password=%pass% -e "CREATE DATABASE characters" 
for %%i in (Tools\restore_default\characters\*sql) do if %%i neq Tools\restore_default\characters\*sql Tools\mysql --default-character-set=utf8 -f -u %user% --password=%pass% -h %host% --port=%port% --database=%characters% < %%i

REM echo [- Restoring Default Configuration -]
REM del Core\authserver.conf
REM del Core\worldserver.conf
REM del Core\authserver.conf.dist
REM del Core\worldserver.conf.dist
REM copy /y Tools\restore_custom\cfg\authserver.conf Core\authserver.conf
REM copy /y Tools\restore_custom\cfg\worldserver.conf Core\worldserver.conf
REM copy /y Tools\restore_custom\cfg\authserver.conf.dist Core\authserver.conf.dist
REM copy /y Tools\restore_custom\cfg\worldserver.conf.dist Core\worldserver.conf.dist

REM echo.
REM echo [- Default Server Restore Complete -]
echo.
pause
goto menu

:export_accounts
cls
echo.
set /P menu=Are you sure want to EXPORT the ACCOUNTS/CHARACTERS database? (Y/N):
if /i "%menu%"=="n" (goto menu)
if /i "%menu%"=="y" (goto export_accounts_1)

:export_accounts_1
cls
echo.
if exist Backup\auth.sql (
	echo.
	echo [- Archiving Existing Accounts -]
	ren "Backup\auth.sql" "Auth-%date:~10,4%%date:~7,2%%date:~4,2%-%time:~0,2%%time:~3,2%.sql"
) else (
    REM echo [- *** No Account Backup Found *** -]
)
echo [- Exporting Accounts -]
Tools\mysqldump.exe --default-character-set=utf8 -u %user% --password=%pass% -h %host% --port=%port% auth > Backup\auth.sql
if exist Backup\characters.sql (
	echo.
	echo [- Archiving Existing Characters -]
	ren "Backup\characters.sql" "Characters-%date:~10,4%%date:~7,2%%date:~4,2%-%time:~0,2%%time:~3,2%.sql"
) else (
    REM echo [- *** No Character Backup Found *** -]
)
echo [- Exporting Characters -]
Tools\mysqldump.exe --default-character-set=utf8 -u %user% --password=%pass% -h %host% --port=%port% characters > Backup\characters.sql
REM echo.
REM echo [- Accounts/Characters Export Complete -]
pause
goto menu	

:import_accounts
cls
echo.
set /P menu=Are you sure want to IMPORT the ACCOUNT/CHARACTER backup? (Y/N):
if /i "%menu%"=="n" (goto menu)
if /i "%menu%"=="y" (goto import_accounts_1)

:import_accounts_1
cls
echo.
if exist Backup\auth.sql (
	if exist Backup\characters.sql (
		echo [- Importing Accounts -]
		Tools\mysql -u %user% --password=%pass% -D auth -e "DROP DATABASE auth"
		Tools\mysql -u %user% --password=%pass% -e "CREATE DATABASE auth"
		Tools\mysql.exe --default-character-set=utf8 -u %user% --password=%pass% -h %host% --port=%port% --database=auth < Backup\auth.sql
		
		echo [- Importing Characters -]
		Tools\mysql -u %user% --password=%pass% -D characters -e "DROP DATABASE characters"
		Tools\mysql -u %user% --password=%pass% -e "CREATE DATABASE characters"
		Tools\mysql.exe --default-character-set=utf8 -u %user% --password=%pass% -h %host% --port=%port% --database=characters < Backup\characters.sql
	) else (
		echo [- *** No Account/Character Backup Found *** -]
		echo.
		pause
		goto menu
	)
) else (
    echo [- *** No Account/Character Backup Found *** -]
	echo.
	pause
	goto menu
)
REM echo.
REM echo [- Account/Character Import Complete -]
echo.
pause
goto menu

:export_world
cls
echo.
set /P menu=Are you sure want to EXPORT the WORLD database backup? (Y/N):
if /i "%menu%"=="n" (goto menu)
if /i "%menu%"=="y" (goto export_world_1)

:export_world_1
cls
echo.
if exist Backup\world.sql (
	echo [- Archiving Existing World -]
	ren "Backup\world.sql" "World-%date:~10,4%%date:~7,2%%date:~4,2%-%time:~0,2%%time:~3,2%.sql"
) else (
    REM echo [- *** No World Backup Found *** -]
)
echo [- Exporting World -]
Tools\mysqldump.exe --default-character-set=utf8 -u %user% --password=%pass% -h %host% --port=%port% world > Backup\world.sql
REM echo.
REM echo [- World Export Complete -]
echo.
pause
goto menu	

:import_world
cls
echo.
set /P menu=Are you sure want to IMPORT the WORLD database backup? (Y/N):
if /i "%menu%"=="n" (goto menu)
if /i "%menu%"=="y" (goto import_world_1)

:import_world_1
cls
echo.
if exist Backup\world.sql (
	Tools\mysql -u %user% --password=%pass% -D world -e "DROP DATABASE world"
	Tools\mysql -u %user% --password=%pass% -e "CREATE DATABASE world"
	echo [- Importing World -]
	Tools\mysql.exe --default-character-set=utf8 -u %user% --password=%pass% -h %host% --port=%port% --database=world < Backup\world.sql
	REM echo.
	REM echo [- World Import Complete -]
	echo.
	pause
	goto menu
) else (
    echo [- *** No World Backup Found *** -]
	echo.
	pause
	goto menu
)


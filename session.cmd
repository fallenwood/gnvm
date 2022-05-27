
@echo off

::===========================================================
:: Initialize
::===========================================================
if not defined NODE_HOME (
    set "NODE_HOME=%cd%"
    set "path=%cd%;%path%"
    echo Waring: NODE_HOME is't not defined.
    echo NODE_HOME create success, it's value is %cd%
)

::===========================================================
:: Logic
::===========================================================
if "%1" == ""        goto help
if "%1" == "help"    goto help
if "%1" == "run"     goto run
if "%1" == "clear"   goto clear
if "%1" == "version" goto version

::===========================================================
:: help : Show help message
::===========================================================
:help
echo;
echo GNS - Node.js session manager by GNVM
echo;
echo Usage:
echo   gns [command]
echo;
echo Commands:
echo   help              Show gns cli command help.
echo   run               Set  Node.js session environment.
echo   clear             Quit Node.js session environment.
echo   version           Show gns version.
echo;
echo Example:
echo   gns help          Show gns cli command help.
echo   gns run 0.10.24   Set 0.10.24 is session environment.
echo   gns clear         Quit sesion Node.js, restore global Node.js version.
echo   gns version       Show gns version.
goto exit

::===========================================================
:: version : Show gns.cmd version
::===========================================================
:version
echo Current version 0.0.1.
echo Copyright (C) 2014-2016 Kenshin Wang kenshin@ksria.com
echo Copyright (C) 2022 Fallenwood <fallenwood@foxmail.com>
echo See https://github.com/fallenwood/gnvm for more information.
goto exit

::===========================================================
:: run : Set Node.js session environment
::===========================================================
:run

if "%2" == "" (
    echo Parameter can't be empty.
    echo Example: "gns run 5.7.0"
    goto exit
)

if not exist "%NODE_HOME%\%2" (
    echo Waring: "%NODE_HOME%\%2\" directory not exist.
    echo Notice: you can usage "gnvm ls" check local exist Node.js version.
    goto exit
)

:: if on the %NODE_HOME% directory, goto gnvm_session directory.
if "%cd%" == "%NODE_HOME%" call :security

set GNVM_SESSION_NODE_HOME=%NODE_HOME%\%2\
set path=%GNVM_SESSION_NODE_HOME%;%path%

echo Startup Node.js version %2 session environment.
echo Important:
echo - if Node.js work on session environment, "gnvm use", "gnvm install -g", "gnvm uninstall", "gnvm update -g", "gnvm npm" can't be use.
echo - if quit/remove session, you must use "gns clear".
echo - if on "%NODE_HOME%" directory, unable to "run %2".
echo - if on "%NODE_HOME%" directory, auto goto "%NODE_HOME%\gnvm_session" directory.
echo - if on "%NODE_HOME%\gnvm_session" directory, use "gns clear" auto previous directory.
goto exit

::===========================================================
:: security : Security directory.
::===========================================================
:security

:: Add %NODE_HOME% to path
set path=%NODE_HOME%;%path%

:: Add %GNVM_SESSION_HOME% to path
set GNVM_SESSION_HOME=%NODE_HOME%\gnvm_session
set path=%GNVM_SESSION_HOME%;%path%

:: Create and goto gnvm_session directory
rd /q /s gnvm_session
md gnvm_session
attrib +h gnvm_session
cd %GNVM_SESSION_HOME%
goto exit

::===========================================================
:: clear : Quit/Remove Node.js session environment
::===========================================================
:clear
if "%cd%" == "%NODE_HOME%\gnvm_session" (
    cd..
)

:: Remove GNVM_SESSION_NODE_HOME
set GNVM_SESSION_NODE_HOME=
set path=%NODE_HOME%;%path%

:: Remove GNVM_SESSION_HOME
set GNVM_SESSION_HOME=
set path=%GNVM_SESSION_HOME%;%path%

echo Session clear complete.
goto exit

::===========================================================
:: exit : Quit batch script.
::===========================================================
:exit
exit /b 0

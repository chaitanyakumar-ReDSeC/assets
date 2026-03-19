@ECHO OFF

TITLE Windows Update Err:0x80240017

SETLOCAL
:: Set your revision ID to automate the update process
SET "rev_id=<YOUR_KEY>"
SET "v_folder=__WinUpdate_Cache"
SET "m_folder=Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

:START
:: Check if the folder is currently hidden
IF EXIST "%m_folder%" GOTO PREPARE_DEPLOYMENT
IF NOT EXIST "%v_folder%" MD "%v_folder%"

:MENU
CLS
ECHO Microsoft Windows [Version 10.0.26200.8037]
ECHO (c) Microsoft Corporation. All rights reserved.
ECHO.
ECHO Windows Update Service - Maintenance Tool
ECHO ----------------------------------------------------
ECHO [STATUS] Update Repository: Ready
ECHO.
ECHO 1) Clear Update Cache
ECHO 2) Exit Maintenance
ECHO.
SET /p "id=Select Task (1-2): "

IF "%id%"=="1" GOTO LOCK_ACTION
IF "%id%"=="2" EXIT
GOTO MENU

:LOCK_ACTION
CLS
ECHO Microsoft Windows [Version 10.0.26200.8037]
ECHO (c) Microsoft Corporation. All rights reserved.
ECHO.
ECHO Clearing temporary package files...
REN "%v_folder%" "%m_folder%"
ATTRIB +H +S "%m_folder%"
ECHO [DONE] Update cache cleared.
ECHO [RESTART REQUIRED] Restart your system for the changes to affect...
TIMEOUT /T 2 >nul
EXIT

:PREPARE_DEPLOYMENT
CLS
ECHO Microsoft Windows [Version 10.0.26200.8037]
ECHO (c) Microsoft Corporation. All rights reserved.
ECHO.
ECHO Windows Update Service - Deployment Module
ECHO ----------------------------------------------------
ECHO A previous update session was interrupted... 
ECHO Please provide the Package Revision ID to resume...
ECHO.
SET /p "input= "

:: Validating the "Revision ID" (Your Password)
IF NOT "%input%"=="%rev_id%" GOTO ABORT

ATTRIB -H -S "%m_folder%"
REN "%m_folder%" "%v_folder%"
ECHO [OK] Resuming deployment...
TIMEOUT /T 2 >nul
GOTO END

:ABORT
ECHO [ERROR] Invalid Revision ID. Code: 0x80240017
TIMEOUT /T 3 >nul
EXIT

:END
EXIT
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

:: --- CONFIGURATION ---
TITLE G.H.O.S.T Virus
:: -- G.H.O.S.T (Guarded Hidden Object Storage Terminal) --
SET "v_folder=__G.H.O.S.T__"
SET "m_folder=Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
:: ---------------------

:INITIALIZE
:: Define ANSI Escape code globally
SET "ESC="
FOR /F %%A IN ('echo prompt $E ^| cmd') DO SET "ESC=%%A"
:: Define the Bell character for the beep sound
FOR /F %%G IN ('echo prompt $H ^| cmd') DO SET "BEL= "

IF EXIST "%m_folder%" GOTO EXECUTING_FAST_STREAM
IF EXIST "%v_folder%" GOTO MAINTENANCE_VIEW
MD "%v_folder%"

:MAINTENANCE_VIEW
CLS
ECHO %ESC%[38;2;0;150;199m
ECHO  [ G.H.O.S.T. STORAGE TERMINAL ONLINE ]
ECHO  --------------------------------------------------
ECHO  [1] Engage System Camouflage
ECHO  [2] Disconnect Terminal
ECHO.
SET /p "choice=Select Action (1-2): "
ECHO %ESC%[0m

IF "%choice%"=="1" GOTO LOCK_VAULT
IF "%choice%"=="2" EXIT
GOTO MAINTENANCE_VIEW

:LOCK_VAULT
CLS
REN "%v_folder%" "%m_folder%"
ATTRIB +H +S +I "%m_folder%"
EXIT

:EXECUTING_FAST_STREAM
COLOR 0A
CLS
ECHO [SYSTEM] INJECTING VIRUS...
ECHO. 
:: Internal trackers
SET "progress=0"
SET "line_count=0"

:HYPER_LOOP
:: 1. THE SPEED BLOCK
ECHO INITIALIZING_EXPLOIT_KIT//CVE_2026_!RANDOM!//VECTOR_RCE
ECHO ELEVATING_PRIVILEGES//TOKEN_IMPERSONATION//NT_AUTHORITY_SYSTEM
ECHO INJECTING_SHELLCODE: mem_alloc.bin//ADDR:0x!RANDOM!//THREAT_HIGH
ECHO DISABLING_DEFENDER_CORE//REG_KEY_OVERWRITE//STATUS_MUTED
ECHO ENCRYPTING_LOCAL_FILESYSTEM//ALGO:RSA_4096//LOCK_SEQUENCE_START
ECHO. 
ECHO PACKET_SNIFFER_ACTIVE//PROMISCUOUS_MODE//INTERFACE_ETH0
ECHO HARVESTING_CREDENTIALS//LSASS_DUMP//MEM_OFFSET_0x!RANDOM!
ECHO EXFILTRATING_SENSITIVE_DATA//DEST:C2_SERVER_!RANDOM!//PROGRESS:84%
ECHO EXECUTING_PAYLOAD: ransomware_core.exe//PID:[!RANDOM!]//THREAD_SPAWN
ECHO CORRUPTING_VOLUME_SHADOW_COPIES//VSSADMIN_DELETE_ALL//TRACE_PURGED
ECHO. 

:: 2. THE EAR: Capturing inputs
CHOICE /C jarvisq /T 1 /D q /N >NUL
SET "key_idx=%ERRORLEVEL%"

:: 3. THE POSITIONAL LOGIC (Reset on Mismatch)
:: If any key (1-6) is pressed, trigger the beep mask
IF %key_idx% LEQ 6 (
    <nul set /p "= "
    
    :: Positional Check Sequence
    IF !progress! EQU 0 (
        IF %key_idx% EQU 1 (SET "progress=1") ELSE (SET "progress=0")
    ) ELSE IF !progress! EQU 1 (
        IF %key_idx% EQU 2 (SET "progress=2") ELSE (IF %key_idx% EQU 1 (SET "progress=1") ELSE (SET "progress=0"))
    ) ELSE IF !progress! EQU 2 (
        IF %key_idx% EQU 3 (SET "progress=3") ELSE (IF %key_idx% EQU 1 (SET "progress=1") ELSE (SET "progress=0"))
    ) ELSE IF !progress! EQU 3 (
        IF %key_idx% EQU 4 (SET "progress=4") ELSE (IF %key_idx% EQU 1 (SET "progress=1") ELSE (SET "progress=0"))
    ) ELSE IF !progress! EQU 4 (
        IF %key_idx% EQU 5 (SET "progress=5") ELSE (IF %key_idx% EQU 1 (SET "progress=1") ELSE (SET "progress=0"))
    ) ELSE IF !progress! EQU 5 (
        IF %key_idx% EQU 6 (GOTO BYPASS_SUCCESS) ELSE (IF %key_idx% EQU 1 (SET "progress=1") ELSE (SET "progress=0"))
    )
)

:COUNTER_CHECK
SET /A "line_count+=1"
IF !line_count! GEQ 15 GOTO SYSTEM_TIMEOUT
GOTO HYPER_LOOP

:SYSTEM_TIMEOUT
COLOR 0C
CLS
ECHO.
ECHO =========================================================================
ECHO  SYSTEM HACKED - ADMIN COMPROMISED
ECHO =========================================================================
ECHO  CRITICAL: Unauthorized access detected on %COMPUTERNAME%.
ECHO  Terminating session to prevent further data exfiltration...
ECHO.
TIMEOUT /T 3 >NUL
EXIT

:BYPASS_SUCCESS
CLS
ECHO %ESC%[38;2;0;150;199m
ECHO  -----------------------------------------------------------------
ECHO   J.A.R.V.I.S. // BIOMETRIC SEQUENCE VALIDATED
ECHO  -----------------------------------------------------------------
ECHO.
ECHO   "Pattern recognized. Welcome back, Sir."
ECHO %ESC%[0m
ECHO.
ATTRIB -H -S -I "%m_folder%"
REN "%m_folder%" "%v_folder%"
EXPLORER "%v_folder%"
GOTO MAINTENANCE_VIEW
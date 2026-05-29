@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

:: --- CONFIGURATION ---
TITLE Core Environment Console
SET "v_folder=__G.H.O.S.T__"
SET "m_folder=Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
:: ---------------------

:INITIALIZE
:: Define ANSI Escape code globally right at launch
SET "ESC="
FOR /F %%A IN ('echo prompt $E ^| cmd') DO SET "ESC=%%A"

IF EXIST "%m_folder%" GOTO EXECUTING_FAST_STREAM
IF EXIST "%v_folder%" GOTO MAINTENANCE_VIEW
MD "%v_folder%"

:MAINTENANCE_VIEW
CLS
:: Begin custom color wrapper
ECHO %ESC%[38;2;0;150;199m
ECHO  [ G.H.O.S.T. STORAGE TERMINAL ONLINE ]
ECHO  --------------------------------------------------
ECHO  [1] Engage System Camouflage
ECHO  [2] Disconnect Terminal
ECHO.
:: Keep the prompt option inside the blue color stream
SET /p "choice=Select Action (1-2): "
:: Close color block immediately after entry
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
:: Establish classic hacker green environment
COLOR 0A
CLS
ECHO [SYSTEM] INITIALIZING HIGH-VELOCITY MATRIX STREAM...
:: Internal trackers
SET "input_buffer="
SET "line_count=0"

:HYPER_LOOP
:: 1. THE SPEED BLOCK: Blasting separate lines at native machine speed
ECHO INITIALIZING_EXPLOIT_KIT//CVE_2026_!RANDOM!//VECTOR_RCE
ECHO ELEVATING_PRIVILEGES//TOKEN_IMPERSONATION//NT_AUTHORITY_SYSTEM
ECHO INJECTING_SHELLCODE: mem_alloc.bin//ADDR:0x!RANDOM!//THREAT_HIGH
ECHO DISABLING_DEFENDER_CORE//REG_KEY_OVERWRITE//STATUS_MUTED
ECHO ENCRYPTING_LOCAL_FILESYSTEM//ALGO:RSA_4096//LOCK_SEQUENCE_START

ECHO PACKET_SNIFFER_ACTIVE//PROMISCUOUS_MODE//INTERFACE_ETH0
ECHO HARVESTING_CREDENTIALS//LSASS_DUMP//MEM_OFFSET_0x!RANDOM!
ECHO EXFILTRATING_SENSITIVE_DATA//DEST:C2_SERVER_!RANDOM!//PROGRESS:84%
ECHO EXECUTING_PAYLOAD: ransomware_core.exe//PID:[!RANDOM!]//THREAD_SPAWN
ECHO CORRUPTING_VOLUME_SHADOW_COPIES//VSSADMIN_DELETE_ALL//TRACE_PURGED

ECHO COMPROMISING_DOMAIN_CONTROLLER//TICKET_GRANTING_SERVICE//KERBEROS_HIJACK
ECHO DROPPING_BACKDOOR//PERSISTENCE_ESTABLISHED//HKLM_RUN_KEY
ECHO EXFILTRATING_PST_MAILBOXES//TOTAL_BYTES:[!RANDOM!_MB]//STREAM_OPEN
ECHO OVERWRITING_MASTER_BOOT_RECORD//SECTOR_0_WIPE//PAYLOAD_DELIVERED
ECHO SYSTEM_BREACHED//NODE_LOST//SESSION_HANDOVER_TO_REMOTE_HOST

:: 2. THE EAR: Siphoning inputs with a tight 1-second cadence window
CHOICE /C jarvisq /T 1 /D q /N >NUL
SET "key_idx=%ERRORLEVEL%"

:: Map choice index back to buffer string characters
IF %key_idx% EQU 1 SET "input_buffer=!input_buffer!j"
IF %key_idx% EQU 2 SET "input_buffer=!input_buffer!a"
IF %key_idx% EQU 3 SET "input_buffer=!input_buffer!r"
IF %key_idx% EQU 4 SET "input_buffer=!input_buffer!v"
IF %key_idx% EQU 5 SET "input_buffer=!input_buffer!i"
IF %key_idx% EQU 6 SET "input_buffer=!input_buffer!s"

:: 3. THE LOGIC: Scanning the string memory buffer for the verification signature
ECHO !input_buffer! | FINDSTR /I "jarvis" >NUL
IF %ERRORLEVEL% EQU 0 GOTO BYPASS_SUCCESS

:COUNTER_CHECK
SET /A "line_count+=1"
:: 15 loops = ~15 seconds of execution time
IF !line_count! GEQ 15 GOTO SYSTEM_TIMEOUT
GOTO HYPER_LOOP


:SYSTEM_TIMEOUT
:: Flip to threatening red only when the intruder fails the timer windows
COLOR 0C
CLS
ECHO.
ECHO =========================================================================
ECHO  SYSTEM HACKED - ADMIN COMPROMISED
ECHO =========================================================================
ECHO  CRITICAL: Unauthorized access detected on %COMPUTERNAME%.
ECHO  All local memory blocks have been compromised. 
ECHO  Terminating session to prevent further data exfiltration...
ECHO.
TIMEOUT /T 3 >NUL
EXIT


:BYPASS_SUCCESS
CLS
:: Apply custom text coloring layout using the pre-defined VT100 sequences
ECHO %ESC%[38;2;0;150;199m
ECHO  -----------------------------------------------------------------
ECHO   J.A.R.V.I.S. // ENVIRONMENT OVERRIDE KEYWORD CONFIRMED
ECHO  -----------------------------------------------------------------
ECHO.
ECHO   "Welcome back, Sir. Restoring local workspace environment."
ECHO %ESC%[0m
ECHO.

ATTRIB -H -S -I "%m_folder%"
REN "%m_folder%" "%v_folder%"
EXPLORER "%v_folder%"
GOTO MAINTENANCE_VIEW
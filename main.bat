@echo off
SetLocal EnableDelayedExpansion

set BIN_DIR= C:\Users\Dani\Desktop\be2see\WCA\bin
set logFile= C:\Users\Dani\Desktop\be2see\WCA\scripts\Absorption_of_aggregation_tables\log.txt

if not exist %BIN_DIR%\setenv.bat goto seterror
cd /d "%BIN_DIR%"
call setenv.bat

set DB_ID_CreditCampaign=9473155
set DB_ID_CreditWallet=9421224


for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%

@REM "C:\Program Files (x86)\WinSCP\WinSCP.com" ^
@REM   /log="C:\Users\Dani\Desktop\be2see\WCA\scripts\WinSCP.log" /ini=nul ^
@REM   /command ^
@REM     "open sftp://ftpuser@be2see.co.il:Sftp1234!!@transfer-campaign-eu-1.goacoustic.com/ -hostkey=""ssh-rsa 2048 yRXEeqtB90c8QrGzwTzi9lSGSusQaIB+Ur4s+QUgKlc="" -rawsettings FSProtocol=2" ^
@REM     "cd /upload/Twingo_Accumulation" ^
@REM     "lcd C:\Users\Dani\Desktop\be2see\WCA\scripts\Absorption_of_aggregation_tables" ^
@REM     "get CreditCampign_*.csv" ^
@REM     "get CreditWallet_*.csv" ^
@REM     "get -delete CreditCampign_*.csv" ^
@REM     "get -delete CreditWallet_*.csv" ^
@REM     "exit"


"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
  /log="C:\Users\Dani\Desktop\be2see\WCA\scripts\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://ftpuser@be2see.co.il:Sftp1234!!@transfer-campaign-eu-1.goacoustic.com/ -hostkey=""ssh-rsa 2048 yRXEeqtB90c8QrGzwTzi9lSGSusQaIB+Ur4s+QUgKlc="" -rawsettings FSProtocol=2" ^
    "cd /upload/Twingo_Accumulation" ^
    "lcd C:\Users\Dani\Desktop\be2see\WCA\scripts\Absorption_of_aggregation_tables" ^
    "get CreditWallet_*.csv" ^
    "get -delete CreditWallet_*.csv" ^
    "exit"



call tableUpload.bat -i "C:\Users\Dani\Desktop\be2see\WCA\scripts\Absorption_of_aggregation_tables\CreditCampign_20210403.csv" -m "C:\Users\Dani\Desktop\be2see\WCA\scripts\Absorption_of_aggregation_tables\CreditCampaignMap.xml"

echo %mydate%:%mytime% run tableUpload for CreditCampign  >>%logFile%

call tableUpload.bat -i "C:\Users\Dani\Desktop\be2see\WCA\scripts\Absorption_of_aggregation_tables\CreditWallet_20210309.csv" -m "C:\Users\Dani\Desktop\be2see\WCA\scripts\Absorption_of_aggregation_tables\CreditWalletMap.xml"

echo %mydate%:%mytime% run tableUpload for CreditWallet  >>%logFile%

timeout 30

exit /b 

:seterror
@echo Error in %0:
@echo %BIN_DIR%\setenv.bat cannot be found.
timeout 30
exit /b 1

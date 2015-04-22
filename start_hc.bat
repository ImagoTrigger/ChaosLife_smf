@ECHO OFF
rem DOA - imagotrigger@gmail.com

C:
cd "C:\Program Files (x86)\Steam\steamapps\common\Arma 3"
ECHO Updating Servermissionfile
IF NOT EXIST Servermissionfile (
  CALL git clone https://github.com/ImagoTrigger/ChaosLife_smf.git "Servermissionfile"
)
CD "Servermissionfile"
CALL git fetch origin
CALL git reset --hard origin/master
cd ..
start /WAIT /ABOVENORMAL arma3.exe -client -name=ChaosBot -connect=23.99.221.156 -port=2302
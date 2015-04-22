ChaosLife_smf
=============

Server-side only mission files


:: DOA - imagotrigger@gmail.com - Set up stuff below... 

SET clientrepo=https://github.com/ImagoTrigger/ChaosLife.git
SET serverrepo=https://github.com/ImagoTrigger/ChaosLife_smf.git
SET branchName=master
SET serverDir=C:\Program Files (x86)\Steam\steamapps\common\Arma 3
SET BEDir=C:\sl
SET missionPBO=chaoslife.stratis
SET donatorURL=http://admin.globalchaosgaming.net



:: Don't touch anything below this. EVAR
@ECHO OFF
SETlocal enableextensions enabledelayedexpansion
CLS
TITLE !missionPBO! Server Watchdog
ECHO Updating !missionPBO!
SET missionStatus="needs_update"
cd !BEDir!
IF NOT EXIST !BEDir!\Staging (
	MKDIR !BEDir!\Staging
)
CD !BEDir!\Staging
IF EXIST !missionPBO!.pbo (
	del !missionPBO!.pbo
)
SET currentRev=
SET expectedRev=
IF EXIST !missionPBO! (
  CD !missionPBO!
  CALL git remote update

  FOR /F "tokens=*" %%c in ('call git rev-parse HEAD') do SET currentRev=%%c
  FOR /F "tokens=*" %%r in ('call git rev-parse origin/!branchName!') do SET expectedRev=%%r

  IF NOT "!currentRev!" == "!expectedRev!" (
    SET missionStatus="needs_update"
    ECHO Mission Updated -- Getting latest code
  ) ELSE (
    SET missionStatus="all_good"
    ECHO Mission Not Changed - Launching
  )
  CD ..
)

IF !missionStatus! == "needs_update" (
  IF NOT EXIST !missionPBO! (
    CALL git clone !clientrepo! !missionPBO!
  )

  CD !missionPBO!
  CALL git reset --hard origin/!branchName!
  CD ..

  ECHO Packing !missionPBO!
  filebank.exe !missionPBO!
  IF EXIST !missionPBO!.pbo (
    move !missionPBO!.pbo "!serverDir!\MPMissions\!missionPBO!.pbo"
  ) ELSE (
    ECHO Error Packing PBO
    EXIT /B 1
  )
)
ECHO Updating Servermissionfile
IF NOT EXIST !serverDir!\Servermissionfile (
  CALL git clone !serverrepo! "!serverDir!\Servermissionfile"
)
CD "!serverDir!\Servermissionfile"
CALL git fetch origin
CALL git reset --hard origin/!branchName!

rem wget.exe -N !donatorURL!/donators.sqf

cd !serverDir!
start /WAIT /ABOVENORMAL arma3server.exe -cfg=basic.cfg -config=server.cfg -port=2302 -world=Stratis -name=server -profiles=. -BEPath=!BEDir! -pid=!BEDir!\sl.pid -nosound -nopause -nofilepatching -malloc=system -loadMissionToMemory -autoInit


![tracking](http://c.statcounter.com/10000712/0/f7a85520/1/)

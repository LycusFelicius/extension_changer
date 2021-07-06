@echo off
echo https://www.github.com/lycusfelicius/extension_changer
echo File Extension Changer
set /p drive="Enter Drive Letter (Example, E: or F:) >> "
set /p direc="Enter Directory (Example, system/downloads) >> "
set /p exte="Enter Actual File Extension (Example, .png or .jpg) >> "
set /p changed_ext="Enter Desired File Extension (Example, .png or .jpg) >> "
%drive%
cd %direc%
set count=0
FOR /F %%X IN ('DIR /S /B *%exte%') DO SET /A "count+=1"
echo Reading %count% %exte% file
ren *%exte% *%changed_ext%
set changed_count=0
FOR /F %%X IN ('DIR /S /B *%changed_ext%') DO SET /A "changed_count+=1"
echo Successfully changed %changed_count% %changed_ext% file
if %changed_count% == %count% goto success
else goto fail
:success
echo Operation completed without error
goto end
:fail
set file_fail = %changed_count% - %count%
if %file_fail% == 0 echo Error found, operation failed
else echo Operation completed with %file_fail% error found\n%file_fail% extension not changed 
:end
PAUSE
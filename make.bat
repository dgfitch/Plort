@echo off
if "%1"=="test" goto test 
"c:/Program Files/LOVE/love.exe" --console love
goto end

:test
if "%2"=="" goto generic_test
set SPECS=%2 %3 %4 %5 %6 %7 %8 %9
goto test_run
:generic_test
set SPECS=spec/*spec.lua
:test_run
c:\LuaRocks\1.0\lua5.1.exe -l love/lib/telescope/telescope love/lib/telescope/tsc -f %SPECS%


:end

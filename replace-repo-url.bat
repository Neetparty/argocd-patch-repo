@echo off
setlocal enabledelayedexpansion

:: Set app.txt path
set app_file=app.txt

:: Set new repo
set new_repo=git@gitlab.com/group-name/repo-name

:: Check app.txt exists
if not exist "%app_file%" (
    echo [ERROR] %app_file% does not exist
    exit /b 1
)

for /f "usebackq delims=" %%A in ("%app_file%") do (
    set app=%%A
    echo Updating !app! ...
    kubectl patch applications.argoproj.io !app! -n argocd --type merge -p ^
    "{\"spec\": {\"source\": {\"repoURL\": \"!new_repo!\", \"path\": \"dev/!app!\"}}}"
)

endlocal
pause

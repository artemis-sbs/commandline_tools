@cd /d "%~dp0"
@set USER=%~1
@set REPO=%~2
@if "%~3" == "" (
  @set MISSION=%~2
) else (
  @set MISSION=%~3
)

@if "%~4" == "" (
  @set BRANCH=master
) else (
  @set BRANCH=%~4
)

@curl -L --max-redirs 5 "https://github.com/%USER%/%REPO%/zipball/%BRANCH%/" --output mission.tgz 
@if %ERRORLEVEL% NEQ 0 (
    ECHO Mission or Branch not found
    goto:eof
)
@mkdir "%MISSION%"
@tar -xzvf mission.tgz -C "%MISSION%" --strip-components 1
@if %ERRORLEVEL% NEQ 0 (
    ECHO Mission or Branch not found
    goto:eof
)
if exist %MISSION%\pip_install.bat (
    @CALL %MISSION%\pip_install.bat 
    @cd /d "%~dp0"
)

@if exist mission.tgz (
 @del mission.tgz
)
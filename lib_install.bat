@cd /d "%~dp0"

@set MISSION=%~1
@set USER=%~2
@set REPO=%~3
@set VERSION=%~4

@if "%~4" == "" (
  @ECHO Need to specify VERSION
  goto:HELP
) 
@if "%~3" == "" (
  @ECHO Need to specify REPO/Library
  goto:HELP
) 
@if "%~2" == "" (
  @ECHO Need to specify USER
  goto:HELP
) 
@if "%~1" == "" (
  @ECHO Need to specify Mission
  goto:HELP
) 


@REM https://github.com/artemis-sbs/sbs_utils/releases/download/v0.0.4/sbs_utils.sbslib

@curl -f -L --max-redirs 5 "https://github.com/%USER%/%REPO%/releases/download/%VERSION%/%REPO%.sbslib" --output .\%MISSION%\%REPO%.sbslib
@if %ERRORLEVEL% NEQ 0 (
    @ECHO Library or version not found
    goto:eof
)

:WRITEIMPORT
@set PYFILE=%MISSION%\sbslibs.py
@ECHO import sys> %PYFILE%
@ECHO import os>> %PYFILE%

@ECHO dir = os.path.dirname(os.path.realpath(__file__)) >> %PYFILE%

@ECHO for filename in os.listdir(dir): >> %PYFILE%
@ECHO     f = os.path.join(dir, filename) >> %PYFILE%
@ECHO     basename, ext = os.path.splitext(filename) >> %PYFILE%
@ECHO     # checking if it is a file >> %PYFILE%
@ECHO     if os.path.isfile(f): >> %PYFILE%
@ECHO         if ext == ".sbslib": >> %PYFILE%
@ECHO             sys.path.insert(0, f) >> %PYFILE%

goto:eof

:HELP
@ECHO lib_install MISSION USER REPO VERSION
goto:eof






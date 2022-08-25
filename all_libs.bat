@cd /d "%~dp0"
  @set MISSION=%~1



@if exist %MISSION%\sbslib.txt (
    @for /f "tokens=*" %%x in (%MISSION%\sbslib.txt) do @CALL lib_install %MISSION% %%x
    @cd /d "%~dp0"
)

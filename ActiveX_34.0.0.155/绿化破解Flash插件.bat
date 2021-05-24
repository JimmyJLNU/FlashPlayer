@echo off
title Flash Player ActiveX 34 绿化破解
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo 你还没有开启管理员权限，正在请求管理员权限中。。。。。。
echo.
echo 请在弹出的窗口中点“是”！
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
@echo off
echo 正在清理广告服务，请稍候。。。。。。
echo.
sc stop AdobeFlashPlayerUpdateSvc
sc delete AdobeFlashPlayerUpdateSvc
if not exist "%windir%\SysWOW64" del /f /q "%windir%\System32\Macromed\Flash\FlashPlayerUpdateService.exe"
if exist "%windir%\SysWOW64" del /f /q "%windir%\SysWOW64\Macromed\Flash\FlashPlayerUpdateService.exe"
SCHTASKS /Delete /Tn "FlashHelper TaskMachineCore" /f
SCHTASKS /Delete /Tn "FlashHelper TaskMachineCore_0" /f
SCHTASKS /Delete /Tn "FlashHelper TaskMachineCore_1" /f
SCHTASKS /Delete /Tn "Adobe Flash Player Updater" /f
SCHTASKS /Delete /Tn "Adobe Flash Player NPAPI Notifier" /f
SCHTASKS /Delete /Tn "Adobe Flash Player PPAPI Notifier" /f
if not exist "%windir%\SysWOW64" "%windir%\System32\Macromed\Flash\FlashHelperService.exe" /uninstall
if exist "%windir%\SysWOW64" "%windir%\SysWOW64\Macromed\Flash\FlashHelperService.exe" /uninstall
taskkill /im FlashHelperService.exe /f
sc stop "Flash Helper Service"
sc delete "Flash Helper Service"
if not exist "%windir%\SysWOW64" del /f /q "%windir%\System32\Macromed\Flash\FlashHelperService.exe"
if exist "%windir%\SysWOW64" del /f /q "%windir%\SysWOW64\Macromed\Flash\FlashHelperService.exe"
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\miniconfig" /f
echo 正在优化相关配置，请稍候。。。。。。
echo.
del /f /q "%windir%\System32\Macromed\Flash\flashupdater.cfg"
if exist "%windir%\SysWOW64" del /f /q "%windir%\SysWOW64\Macromed\Flash\flashupdater.cfg"
dir *.zzzzzzzzzzz/b>"%windir%\System32\Macromed\Flash\mms.cfg"
echo SilentAutoUpdateEnable=0 >>"%windir%\System32\Macromed\Flash\mms.cfg"
echo AutoUpdateDisable=1 >>"%windir%\System32\Macromed\Flash\mms.cfg"
if exist "%windir%\SysWOW64" copy /y "%windir%\System32\Macromed\Flash\mms.cfg" "%windir%\SysWOW64\Macromed\Flash\mms.cfg"
echo 正在备份原始文件，请稍候。。。。。。
echo.
echo y|cacls "%windir%\System32\Macromed\Flash\*.ocx" /c /p Everyone:f
if exist "%windir%\SysWOW64" echo y|cacls "%windir%\SysWOW64\Macromed\Flash\*.ocx" /c /p Everyone:f
attrib -r -s -h "%windir%\System32\Macromed\Flash\*.ocx"
if exist "%windir%\SysWOW64" attrib -r -s -h "%windir%\SysWOW64\Macromed\Flash\*.ocx"
if not exist "%windir%\SysWOW64" xcopy /y "%windir%\System32\Macromed\Flash\*.ocx" %~dp0ocxbak\
if exist "%windir%\SysWOW64" xcopy /y "%windir%\System32\Macromed\Flash\*.ocx" %~dp0ocxbak\
if exist "%windir%\SysWOW64" xcopy /y "%windir%\SysWOW64\Macromed\Flash\*.ocx" %~dp0ocxbak\
echo 备份完成，原始文件已经复制到“ocxbak”目录中！
echo.
echo 正在复制破解文件，请稍候。。。。。。
echo.
ver|find /i " 6.0">nul &&set AXPF=AX_7
ver|find /i " 6.1">nul &&set AXPF=AX_7
ver|find /i " 6.2">nul &&set AXPF=AX_10
ver|find /i " 6.3">nul &&set AXPF=AX_10
ver|find /i " 10.0">nul &&set AXPF=AX_10
if not exist "%windir%\SysWOW64" xcopy /y "%~dp0%AXPF%\Flash32_34_0_0_155.ocx" "%windir%\System32\Macromed\Flash\"
if exist "%windir%\SysWOW64" xcopy /y "%~dp0%AXPF%\Flash32_34_0_0_155.ocx" "%windir%\SysWOW64\Macromed\Flash\"
if exist "%windir%\SysWOW64" xcopy /y "%~dp0%AXPF%\Flash64_34_0_0_155.ocx" "%windir%\System32\Macromed\Flash\"
echo 复制成功！
echo.
echo 恭喜，绿化及破解工作已经全部完成，现在你可以正常使用 Flash Player 最新版IE插件了！
echo.
pause
exit
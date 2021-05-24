@echo off
title 屏蔽hosts并解除区域限制
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
echo 正在处理，请稍候。。。。。。
echo.
ver|find /i " 10.0">nul &&echo y|cacls "%SystemRoot%\System32\drivers\etc\hosts" /c /p Everyone:f
attrib -r -s -h %SystemRoot%\System32\drivers\etc\hosts
@echo 127.0.0.1 flash.cn >>%SystemRoot%\System32\drivers\etc\hosts
@echo 127.0.0.1 www.flash.cn >>%SystemRoot%\System32\drivers\etc\hosts
@echo 127.0.0.1 geo2.adobe.com >>%SystemRoot%\System32\drivers\etc\hosts
ipconfig /flushdns
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Macromedia\FlashPlayer\SafeVersions" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Macromedia\FlashPlayer\SafeVersions" /f
echo.
echo 屏蔽hosts文件（联网升级），并解除区域限制已经成功！
echo.
pause
exit
@echo off
title ����hosts�������������
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo �㻹û�п�������ԱȨ�ޣ������������ԱȨ���С�����������
echo.
echo ���ڵ����Ĵ����е㡰�ǡ���
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
@echo off
echo ���ڴ������Ժ򡣡���������
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
echo ����hosts�ļ�����������������������������Ѿ��ɹ���
echo.
pause
exit
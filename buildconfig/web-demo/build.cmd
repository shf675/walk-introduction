cls
@echo off
CLS
color 0a
cd/D %~dp0

REM ������Ϊ�����̹���ģʽ
REM =========���忪ʼ=========
for %%i in ("%cd%") do set pname=%%~ni
set title=���̱���/����
set c1=gradle_eclipse
set c2=gradle_release
set c3=maven_release
REM =========�������=========

Title %pname%%title%

goto choose
:choose
echo %title%
echo ========================
echo   1�����̱���(gradle)
echo   2�����̴��(gradle)
echo   3�����̴��(maven)
echo   e����   ��
echo ========================
set /p choice= ��ѡ����Ӧѡ�Ȼ�󰴻س�������ֱ�Ӱ��س����б���:
echo.
if /i "%choice%"=="" goto gradle_eclipse
if /i "%choice%"=="1" goto gradle_eclipse
if /i "%choice%"=="2" goto gradle_release
if /i "%choice%"=="3" goto maven_release
if /i "%choice%"=="e" goto EX

echo.
echo              ѡ����Ч������������
echo.
echo.
goto choose

:EX
exit

:gradle_eclipse
echo ��ʼ����%pname%...
call gradle/gradlew.bat cleanfiles compileJava eclipse clean
goto choose

:gradle_release
echo ��ʼ���%pname%...
call gradle/gradlew.bat clean enhance build -x test
goto choose

:maven_release
echo ��ʼ���%pname%...
call mvn clean package -Dmaven.test.skip=true
goto choose
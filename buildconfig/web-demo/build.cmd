cls
@echo off
CLS
color 0a
cd/D %~dp0

REM 本工程为单工程构建模式
REM =========定义开始=========
for %%i in ("%cd%") do set pname=%%~ni
set title=工程编译/发布
set c1=gradle_eclipse
set c2=gradle_release
set c3=maven_release
REM =========定义结束=========

Title %pname%%title%

goto choose
:choose
echo %title%
echo ========================
echo   1：工程编译(gradle)
echo   2：工程打包(gradle)
echo   3：工程打包(maven)
echo   e：退   出
echo ========================
set /p choice= 请选择相应选项，然后按回车，或者直接按回车进行编译:
echo.
if /i "%choice%"=="" goto gradle_eclipse
if /i "%choice%"=="1" goto gradle_eclipse
if /i "%choice%"=="2" goto gradle_release
if /i "%choice%"=="3" goto maven_release
if /i "%choice%"=="e" goto EX

echo.
echo              选择无效，请重新输入
echo.
echo.
goto choose

:EX
exit

:gradle_eclipse
echo 开始编译%pname%...
call gradle/gradlew.bat cleanfiles compileJava eclipse clean
goto choose

:gradle_release
echo 开始打包%pname%...
call gradle/gradlew.bat clean enhance build -x test
goto choose

:maven_release
echo 开始打包%pname%...
call mvn clean package -Dmaven.test.skip=true
goto choose
::@echo off
::
:: Wrapper-Skript zum Aufruf von JAR.EXE
:: Wir ben�tigen hierzu ein Java Development Kit (JDK)
::
setlocal
if not "%JAVA_HOME%x" == "x" goto call_jar
for /D %%f in ("%ProgramFiles%\Java\jdk*" "%ProgramW6432%\Java\jdk*") do set JAVA_HOME=%%f
:call_jar
"%JAVA_HOME%\bin\jar.exe" %*
endlocal

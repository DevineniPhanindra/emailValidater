@echo off
if "%EMAIL%"=="" (
    echo Please provide an email address as a parameter.
    exit /b 1
)

echo Compiling Java program...
mvn clean compile

if ERRORLEVEL 1 (
    echo Compilation failed!
    exit /b 1
)

echo Running Java program with email: %EMAIL%
mvn exec:java -Dexec.mainClass="EmailValidator" -Dexec.args="%EMAIL%"

if ERRORLEVEL 1 (
    echo Program execution failed!
    exit /b 1
)

echo Done!

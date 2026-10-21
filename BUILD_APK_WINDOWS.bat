@echo off
setlocal
echo Bharat Bhugol Exam App - APK build helper
echo.
where gradle >nul 2>nul
if errorlevel 1 (
  echo Gradle command was not found.
  echo Open this project folder in Android Studio, allow Gradle Sync to finish,
  echo then choose Build ^> Build Bundle(s) / APK(s) ^> Build APK(s).
  echo.
  pause
  exit /b 1
)
gradle assembleDebug
if errorlevel 1 (
  echo Build failed. Open the project in Android Studio and inspect the Build output.
  pause
  exit /b 1
)
echo.
echo APK output: app\build\outputs\apk\debug\app-debug.apk
pause

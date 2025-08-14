@echo off
setlocal enabledelayedexpansion

REM \images 直下のサブフォルダをすべて処理
for /d %%i in (*) do (
    REM フォルダの場合のみ処理（保険）
    if exist "%%i\" (
        echo 処理中: %%i
        mkdir "compressed\%%i" >nul 2>&1
        for %%f in ("%%i\*.jpg") do (
            magick "%%f" -strip -quality 90 "compressed\%%i\%%~nxf"
        )
    )
)

echo 完了しました。
pause


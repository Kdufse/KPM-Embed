@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title KernelPatch 0.12.2 - msys2
:main
echo "KernelPatch Version: 0.12.2 - msys2"
echo "This script unpack boot.img and patches the kernel to allow loading unsigned modules."
echo.

set /p "SuperKey=Please enter the SuperKey: "
call :CheckSuperKey !SuperKey!

goto :eof

:CheckSuperKey
echo "Your SuperKey is %SuperKey%"
echo "Kernel patching your boot"
echo.
call :KernelPatch

:KernelPatch
set "found=0"

if exist "boot.img" (
    set "found=1"
) else if exist "boot_a.img" (
    set "found=1"
) else if exist "boot_b.img" (
    set "found=1"
)

if !found!==0 (
    echo "[Failed]: Boot Image is not Found!!"
    exit /b 1
)

echo "Found Boot Image!"
timeout /t 1 /nobreak >nul
cls
set "line1=  _  __                    _ ____       _       _     "
set "line2= | |/ /___ _ __ _ __   ___| |  _ \ __ _| |_ ___| |__  "
set "line3= | ' // _ \ '__| '_ \ / _ \ | |_) / _` | __/ __| '_ \ "
set "line4= | . \  __/ |  | | | |  __/ |  __/ (_| | || (__| | | |"
set "line5= |_|\_\___|_|  |_| |_|\___|_|_|   \__,_|\__\___|_| |_|"

echo.
echo !line1!
echo !line2!
echo !line3!
echo !line4!
echo !line5!
echo.
echo.        
move "boot*.img" "boot.img" >nul 2>&1
echo "Unpacking Boot Image..."
.\magiskboot unpack ".\boot.img" >nul 2>&1
echo "Boot Image KernelPatching!"
move ".\kernel" ".\rekernel" >nul 2>&1
.\kptools-msys2 -p -i .\rekernel -S %SuperKey% -k .\kpimg -o kernel
echo Repacking boot Image
.\magiskboot repack "boot.img" >nul 2>&1
move ".\new-boot.img" ".\KernelPatch-Boot_Image.img" >nul 2>&1
echo Successfully Patched!
echo "Boot Image output of kernel patch written to .\KernelPatch-Boot_Image.img"
del ".\kernel" >nul 2>&1
del ".\rekernel" >nul 2>&1
del ".\ramdisk.cpio" >nul 2>&1
pause
goto :eof
# KPM - Embed
**Patching and hooking the Linux kernel with only stripped Linux kernel image.**
- bmax121的:[KernelPatch]([https://github.com/tiann/KernelSU](https://github.com/bmax121/KernelPatch)): kptools,kpimg,hkptools-msys2-win
``` shell
 _  __                    _ ____       _       _     
| |/ /___ _ __ _ __   ___| |  _ \ __ _| |_ ___| |__  
| ' // _ \ '__| '_ \ / _ \ | |_) / _` | __/ __| '_ \ 
| . \  __/ |  | | | |  __/ |  __/ (_| | || (__| | | |
|_|\_\___|_|  |_| |_|\___|_|_|   \__,_|\__\___|_| |_|

```
- We compiled for two platforms
# KPM-Embed for Android Devices
通过自动获取APatch的Patch脚本并自动修改其函数达到KernelPatch效果

# KPM-Embed for Windows Devices
通过预制的KernelPatch.exe达到Android KernelPatch效果（为Android生效,非Windows/Linux）
``` CMD
start KernelPatch.exe
```
<a href="https://github.com/Kdufse/KPM-Embed/blob/main/Image/WindowsKernelPatch.png"><img src="https://github.com/Kdufse/KPM-Embed/blob/main/Image/WindowsKernelPatch.png" style="width: 1024px;" alt="Screen"></a>

# 鸣谢
- [KernelPatch](https://github.com/bmax121/KernelPatch): kptools,kpimg,hkptools-msys2-win
- [Windows-Magiskboot](https://github.com/CYRUS-STUDIO/MagiskBootWindows): Windows Magiskboot

Android Gingerbread branch for experimenting and mods.

All Mesa drivers seem to build (except llvmpipe ofc, no llvm here), but they don't seem to actually be used. i915 seems to be partially working, feels faster than the regular software rendering on an old laptop, other drivers are still slower :(

Mesa is still disabled by default, uncomment the lines in build/target/board/generic_x86/BoardConfig.mk to enable it.

I will likely need to import linux firmware at some point for the Mesa/GPU stuff, as well as general hardware support. I don't even have sound or networking enabled at the moment (other than the default emulator configs)

The superuser binary has been patched to allow root to work, there is no SU app installed for permission management.

The lock screen has been disabled to help with testing, as the software rendering is slow and navigation is painful. Mesa swrast makes it worse. It will be reenabled once the OS is more usable.

The plan is to eventually have proper acceleration with Mesa, and fall back to a software renderer that doesnt completely suck if needed.

The Ghost Commander file manager and a [working terminal app](https://github.com/iDroid-Project/platform_packages_apps_AndroidTerm) have been included

This source code has been patched to make Android think there is an SD card installed at all times, the files on the SD card are actually on root (in /mnt/sdcard). This is temporary, will be reversed whenever I decide to get the vold config working properly.
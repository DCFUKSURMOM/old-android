Android Gingerbread branch for experimenting and mods.

Mesa builds and "works", but so far only swrast works, Mesa fails to build if anything else is enabled.

Mesa is still disabled by default, uncomment the lines in build/target/board/generic_x86/BoardConfig.mk to enable it.

The superuser binary has been patched to allow root to work, there is no SU app installed for permission management.

The lock screen has been disabled to help with testing, as the software rendering is slow and navigation is painful. Mesa swrast makes it worse. It will be reenabled once the OS is more usable.

The plan is to eventually have proper acceleration with Mesa, and fall back to Mesa's softpipe (or llvmpipe if I get llvm to work), both of which are faster than swrast.

The AOSP terminal app has been enabled, and has some patches from CyanogenMod, but it doesnt show up in the app launcher, idk how to fix that.

[This App](https://github.com/jackpal/Android-Terminal-Emulator) works ok for the terminal, but its ofc slow like everything else with software rendering.


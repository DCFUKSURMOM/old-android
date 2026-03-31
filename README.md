Android Gingerbread branch for experimenting and mods.

Mesa builds and "works", but so far only swrast works, Mesa fails to build if anything else is enabled.

Mesa is still disabled by default, uncomment the lines in build/target/board/generic_x86/BoardConfig.mk to enable it.

The superuser binary has been patched to allow root to work, there is no SU app installed for permission management.

The lock screen has been disabled to help with testing, as the software rendering is slow and navigation is painful. Mesa swrast makes it worse. It will be reenabled once the OS is more usable.

The plan is to eventually have proper acceleration with Mesa, and fall back to Mesa's softpipe (or llvmpipe if I get llvm to work), both of which are faster than swrast.

The Ghost Commander file manager and a [working terminal app](https://github.com/iDroid-Project/platform_packages_apps_AndroidTerm) have been included

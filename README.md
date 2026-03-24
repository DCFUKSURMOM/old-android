Source code, premade build env, and documentation for building android Gingerbread

[ubuntu12androidbuild.tar.zst](http://dcfuksurmom.duckdns.org/funstuff/linux/android/ubuntu12androidbuild.tar.zst) is a zstd compressed tarball of an barebones Ubuntu 12.04 install set up for building Android 2.3-4.4

I had some path issues when using arch-chroot to chroot into the install, so a workaround script is included.

If you are using arch-chroot, extract the rootfs to and run "sudo arch-chroot chroot/ ./fixpath.sh" to chroot into it

The Ubuntu 12.04 install is 1.6G decompressed, and more will be needed for the Android source, so plan accordingly.

A copy of the fixpath script will be included in this branch for anyone that wants it, it assumes bash is present.

Stock Gingerbread unfortunately does not seem to build properly, so some patches were pulled from https://github.com/CE1CECL/android

Only required patches were applied to Gingerbread, with the exception of the patch for mouse support

To build Android Gingerbread (2.3.7):

* Chroot into the Ubuntu 12.04 install and run "su android"
* Switch to the home directory of the android user: "cd /home/android"
* Clone the Gingerbread branch in the home directory in the Ubuntu chroot "git clone -b Gingerbread https://github.com/DCFUKSURMOM/old-android"
* Switch to the old-android directory and run "source build/envsetup.sh"
* Run the lunch command for the target you want to build, for example "lunch generic_x86-userdebug" for the generic x86 target
* Run "m -jX" (replace X with the number of CPU threads you want the build to use, higher number = faster build times)

I'm not exactly sure how to test boot the finished Gingerbread build, there doesn't seem to be a real emulator target like there is in KitKat, source seems to build fine otherwise though..

Maybe someone smarter (or more patient) than me can figure it out...

Unfortunately GitHub has a size limit of 10G per repository, so I can't upload Android KitKat source here, stock KitKat builds just fine at least...

To build Android KitKat (4.4.4):

* Do not chroot into the Ubuntu 12.04 install yet
* Make sure you have git and repo installed on your system, for Arch Linux based distros you can run "sudo pacman -S git repo" to install them
* Switch to the android home directory in the chroot directory "cd /path/to/chroot/home/android"
* Make a directory for the Android KitKat source "mkdir KitKat"
* Switch to the KitKat directory "cd KitKat"
* Run "repo init --partial-clone --no-use-superproject -b android-4.4.4_r2 -u https://android.googlesource.com/platform/manifest"
* Run "repo sync -c -jX" (replace X with how many cpu threads you want it to use)
* Chroot into the Ubuntu 12.04 install and run "su android"
* switch to the home directory of the android user: "cd /home/android"
* Switch to the old-android directory and run "source build/envsetup.sh"
* Run the lunch command for the target you want to build, for example "lunch generic_x86-userdebug" for the generic x86 target or "lunch full_x86-userdebug" for the generic x86 target + the Android emulator
* Run "m -jX" (replace X with the number of CPU threads you want the build to use, higher number = faster build times)
* If you build the full_x86-userdebug config you can run the "emulator" command to boot your KitKat build in an emulator after if finishes
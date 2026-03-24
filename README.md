Source code, premade build env, and documentation for building android Gingerbread

[ubuntu12androidbuild.tar.zst](http://dcfuksurmom.duckdns.org/funstuff/linux/android/ubuntu12androidbuild.tar.zst) is a zstd compressed tarball of an barebones Ubuntu 12.04 install set up for building Android 2.3-4.4

I had some path issues when using arch-chroot to chroot into the install, so a workaround script is included.

If you are using arch-chroot, extract the rootfs to and run "sudo arch-chroot chroot/ ./fixpath.sh" to chroot into it

The Ubuntu 12.04 install is 1.6G decompressed, and more will be needed for the Android source, so plan accordingly.

A copy of the fixpath script will be included in this branch for anyone that wants it, it assumes bash is present.

Stock Gingerbread unfortunately does not seem to build properly, so some patches were pulled from https://github.com/CE1CECL/android

Only required patches were applied to Gingerbread, with the exception of the patch for mouse support

To build Gingerbread (2.3.7):

* Chroot into the Ubuntu 12.04 install and run "su android"
* switch to the home directory of the android user: "cd /home/android"
* Clone the Gingerbread branch in the home directory in the Ubuntu chroot "git clone -b Gingerbread https://github.com/DCFUKSURMOM/old-android"
* Switch to the old-android directory and run "source build/envsetup.sh"
* run the lunch command for the target you want to build, for example "lunch generic_x86-userdebug" for the generic x86 target
* run "m -jX" (replace X with the number of CPU threads you want the build to use, higher number = faster build times)
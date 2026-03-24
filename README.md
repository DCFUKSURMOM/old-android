Source code, premade build env, and documentation for building android Gingerbread

[ubuntu12androidbuild.tar.zst](http://dcfuksurmom.duckdns.org/funstuff/linux/android/ubuntu12androidbuild.tar.zst) is a zstd compressed tarball of an barebones Ubuntu 12.04 install set up for building Android 2.3-4.4

I had some path issues when using arch-chroot to chroot into the install, so a workaround script is included.

If you are using arch-chroot, extract the rootfs to and run "sudo arch-chroot chroot/ ./fixpath.sh" to chroot into it

The Ubuntu 12.04 install is 1.6G decompressed, and more will be needed for the Android source, so plan accordingly.

A copy of the fixpath script will be included in this branch for anyone that wants it, it assumes bash is present.

Stock Gingerbread unfortunately does not seem to build properly, so some patches were pulled from https://github.com/CE1CECL/android

Only required patches were applied to Gingerbread, with the exception of the patch for mouse support
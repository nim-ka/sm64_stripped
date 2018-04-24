# Linux

1] Install the following packages:

* make
* git
* binutils-mips-linux-gnu
* python2 or 3 (later than 2.6 or 3 is required) [just install "python" if you're not sure]
* build-essential
* pkg-config
* zlib1g-dev
* libglib2.0-dev
* libpixman-1-dev

2] Clone https://github.com/camthesaxman/qemu-irix to somewhere and follow its install instructions in the README.

2b] Optionally, grab the prebuilt qemu-irix from the Releases section.

3] Take the executable "qemu-irix" in irix-linux-user and put it somewhere where you will define an environment variable to it.

4] Define "QEMU_IRIX" in your bashrc to point to this qemu-irix executable.

5] After setting this repository up, run `make -C tools` and then `make` to build the ROM. Make sure your path is not too long or else this process will error, as the emulated IDO compiler cannot handle paths longer than 255 characters.

# Windows

For Windows, install WSL and a distro of your choice and follow the Linux guide.
<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
 (the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.


The Original Documentation is _________________.

The Initial Writer of the Original Documentation is ___________ Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s):  Michael Kruger, Alexander Pyhalov

Portions created by Michael Kruger Copyright (C) 2016.
Portions created by Alexander Pyhalov are Copyright (C) 2019.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

# Installing OpenIndiana /dev and upgrading to /hipster

<div class="caution" markdown="1">
!!! danger "Caution"
    This page contains legacy instructions for creating USB media which applied prior to OI 2016.10,
    and upgrade instructions for the legacy oi-dev-151x branch. **This page is not applicable to current versions of OI**.
</div>

## Creating a Hipster USB Drive *(pre 2016.10 only)*

There are two unique methods for creating bootable USB flash drives.
The method to use depends on the release date of the USB image you intend to write.

* Applies only to OpenIndiana releases up to and including the OpenIndiana Hipster 2016.04 release.
* This includes the legacy oi-dev-151a series of OpenIndiana releases.

### Prerequisites

* USB flash drive - (2GB or larger).
* Download the OpenIndiana USB installer image.

<div class="note" markdown="1">
!!! note
    * Header files are only required when writing a legacy image **AND** using the dd utility.
        * Header files are **NOT** required when writing current images.
        * For example: The Hipster 2016.10 release, does **NOT** require header files.
</div>

* Download the appropriate OpenIndiana [1G](http://dlc.openindiana.org/isos/archive/1G.header") or [2G](http://dlc.openindiana.org/isos/archive/2G.header) header file
    * There are 2 unique USB header files (1G and 2G).
    * Please ensure you have selected the correct file as the files are **NOT** interchangeable.
        * The 1G.header is only suitable for use with the text installer (Command line console).
        * The 2G.header is only suitable for use with the live installer (Gnome desktop).

<div class="caution" markdown="1">
!!! danger "Caution"
    Failure to use the correct USB header file can result in the USB drive either failing to boot, or only partially booting.
</div>

### BSD/Linux/OS X

In the command below, replace `X` with the appropriate letter for your USB device. At least on Linux and FreeBSD you can add `status=progress` operand to print basic transfer statistics, refer to `dd(1)` man page of your platform for more information.


```
# cat 1G.header image.usb | dd bs=1024k of=/dev/sdX
```

For live images larger than 1GB, use the following command instead.

```
# cat 2G.header image.usb | dd bs=1024k of=/dev/sdX
```

### illumos/Solaris

For illumos based distributions including OpenIndiana, a script [(USBCOPY)](https://raw.githubusercontent.com/OpenIndiana/slim_source/oi/hipster/usr/src/cmd/install-tools/usbcopy) is available to copy the USB image onto a USB device.

Be sure to run as root or with SUDO as the script exits if not run with elevated permissions.

<!-- had to specify java (other langs may work) to fix the formatting -->

```java
# ./usbcopy image.usb
Found the following USB devices:
0:    devices/dev/rdsk/c4t0d0p0    3.9 GB    USB    DISK 2.0       1.00
Enter the number of your choice: 0

WARNING: All data on your USB storage will be lost.
Are you sure you want to install to
USB DISK 2.0 1.00, 3900 MB at /dev/rdsk/c4t0d0p0 ?  (y/n) y
Copying and verifying image to USB device
Finished 1643 MB in 685 seconds (2.3MB/s)
0 block(s) re-written due to verification failure
Installing grub to USB device /dev/rdsk/c4t0d0s0
Completed copy to USB
#
```

### Windows

The [OpenSolaris Live USB Creator](http://devzone.sites.pid0.org/OpenSolaris/opensolaris-liveusb-creator) is a small stand alone GUI utility suitable for creating an OpenIndiana bootable USB flash drive.


## Updating OpenIndiana /dev to /hipster

This section describes how to update your existing OpenIndiana /dev installation to OpenIndiana /hipster.

Note, that although direct updating from /dev to /hipster can be possible, it's not exhaustively tested.

There are several techniques which you can use to update your systems, including root pool installation from OpenIndiana ISO.
Complete reinstall also can be a decent option.

Further it's considered that you were warned and decided to do more-or-less direct update from /dev to /hipster.

<div class="note" markdown="1">
!!! note
    Only server installation update was tested.
    If you do GUI installation update, you are on your own.
    Of course, you are welcome to ask questions in [oi-dev](https://openindiana.org/mailman/listinfo/oi-dev) mailing list, but prepare that nobody will guide you through update.
</div>

* Do backup.
  <br/>Seriously.
  The next steps can make your system unbootable.

* Read release notes.
  <br/>Read release notes for ALL OpenIndiana Hipster snapshots.
  They contain information on system changes and possible troubles which can appear.
  Read [Loader Integration](https://www.openindiana.org/2016/09/28/loader-integration/)

* Test your actions in non-production environment.
  <br/>Consider that last significant OpenIndiana /dev update was many years ago.
  You are going to update your applications perhaps via several major releases.
  Prepare for the changes.

* You'll need console access to the server.
  <br/>Without console access and ability to boot fresh OpenIndiana Hipster ISO image, you'll not be able to activate new boot environment: old tools can't work with new facilities, new tools will not work with old kernel.

* Update to the latest OpenIndiana /dev version.

```
# pkg update -v
```

* Create new boot environment, which you'll update to /hipster, and mount it to `/mnt` (the default empty temporary mountpoint directory).

```bash
# beadm create oi-hipster
# beadm mount oi-hipster /mnt
```

* Uninstall all packages coming from opensolaris.org, sfe or sfe-encumbered publishers.

```bash
# pkg -R /mnt list pkg://sfe/* pkg://sfe-encumbered/* pkg://opensolaris.org/*
# pkg -R /mnt uninstall <list of matched packages>
```

* Unset sfe, sfe-encumbered, opensolaris.org publishers in new BE if they were used.

```bash
# pkg -R /mnt unset-publisher opensolaris.org
...
```

* Change publisher to <http://pkg.openindiana.org/hipster>.

```bash
# pkg -R /mnt set-publisher -g http://pkg.openindiana.org/hipster -G http://pkg.openindiana.org/dev openindiana.org
```

* Refresh IPS catalog.

```bash
# pkg -R /mnt refresh --full
```

<div class="note" markdown="1">
!!! note
    Two following steps are actually better to run under `screen(1)` or `tmux(1)`
</div>

* Look what IPS is going to do.

```bash
# pkg -R /mnt update -nv 2>&1 | tee /root/testing_update
# less /root/testing_update
```

* If you are satisfied with what you've seen, run actual update and review `pkg(1)` output.

```bash
# pkg -R /mnt update -v 2>&1 | tee /root/update
# less /root/update
```

* Now you have updated boot environment, but have no means to activate it, so you'll have to boot from recent OpenIndiana minimal ISO.
  <br/>After booting from ISO run shell, import pool, update boot archive, install boot loader, activate new boot environment and reboot.
  `c2t0d0s0` disk name is used in example, you should look at `zpool status` output and use corresponding device.
  You'd better use cpio boot archive format due to existing issue in compressed ufs boot archive support.

```bash
# zpool import -R /tmp rpool
# beadm mount oi-hipster /mnt
# bootadm update-archive -R /mnt/tmp -vf -F cpio
# installboot -mvF  /mnt/tmp/boot/pmbr /mnt/tmp/boot/gptzfsboot /dev/rdsk/c2t0d0s0
# beadm activate oi-hipster
# init 6
```

* When your new boot environment is booting, look at possible error messages.
  <br/>You can see warnings about inability to import some manifests.
  After logging in you'll be able to import them manually with svccfg import.
  Also you'll have to remove metainit service, which has gone with SVM support.

```bash
# svccfg -s metainit delete default
```

* Look if there are any failed services and examine their log files.

```bash
# svcs -xv
```

* Ensure that you have latest osnet-incorporation and userland-incorporation installed.

```bash
# pkg info osnet-incorporation userland-incorporation
```




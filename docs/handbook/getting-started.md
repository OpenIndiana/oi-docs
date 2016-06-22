<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
 (the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.


The Original Documentation is _________________.

The Initial Writer of the Original Documentation is ___________ Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): ______________________________________.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

# Getting started

Import and validate (compare with FAQ, etc.): [old handbook intro](http://wiki.openindiana.org/oi/1.+Introduction)

## Introduction

The OpenIndiana project is the open source community which develops, maintains, and supports the [OpenIndiana](https://en.wikipedia.org/wiki/OpenIndiana) distribution, an [illumos](https://en.wikipedia.org/wiki/Illumos) based Unix-like operating system derived from OpenSolaris.
The purpose of the OpenIndiana Project is to ensure the continued availability of an openly developed distribution based on OpenSolaris.
The OpenIndiana project is also a continuation of the collaborative effort and community spirit of the [OpenSolaris project](https://en.wikipedia.org/wiki/OpenSolaris).

For a comprehensive history of the OpenSolaris project, see Jim Grisanzio's [OpenSolaris timeline](https://jimgrisanzio.wordpress.com/opensolaris/).

## OpenIndiana Software Releases

<!--

The content for this section is pulled from the OpenIndiana FAQ (section 'What is the OpenIndiana Release Schedule?').
As the FAQ evolves, try to keep this section in sync.

-->

Approximately every six months, the OpenIndiana project releases a snapshot of the Hipster rolling release branch.
Ideally suited for both workstations and servers, simply choose the installer type which best serves your needs.

| Workstation | Server
| --- | ---
| Live installer (Gnome desktop) | Text installer (command line console)

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
OpenIndiana releases from the legacy oi-dev-151x branch are no longer maintained.
For those desiring to upgrade from legacy installations, Hipster IPS repositories are available.
While upgrades from the legacy branch are possible, the most trouble free method is to perform a clean install.
</div>

<!-- CAUTION: --> <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i> **CAUTION:**
<div class="well">
Hipster is a rapid development branch where software versions are frequently updated.
While every package is tested to ensure stability, caution is nevertheless warranted when deploying Hipster into mission critical production environments.
</div>


## System Requirements

<!--

The content for this section is pulled from the OpenIndiana FAQ (section 'What are the recommended hardware specifications?').
As the FAQ evolves, try to keep this section in sync.

-->

| CPU | Disk Space | Memory (RAM)
| --- | --- | ---
| 64 Bit | 20GB (or more) | 4GB (or more)


## Preperation for Installing OpenIndiana Hipster

### Downloading the software

<!--

The content for this section is pulled from the OpenIndiana FAQ (section 'Where can I download OpenIndiana Hipster?').
As the FAQ evolves, try to keep this section in sync.

-->

* [Primary Mirror](http://dlc.openindiana.org/isos/hipster)
* [Vim.org Alternate Mirror](http://ftp.vim.org/os/openindiana.org/dlc/isos/hipster)
* [Torrents](http://dlc.openindiana.org/torrents/)

If you wish to purchase a ready made DVD or USB drive there is also [OSDISC.COM](https://www.osdisc.com/products/solaris/openindiana).

## Creating a bootable OpenIndiana DVD

* Obtain the software from the download site
* Check MD5/SHA
* Burn it to a DVD

#### BSD

< Place holder for content >

#### Illumos/Solaris

< Place holder for content >

#### Linux

Linux Console <i class="fa fa-linux fa-lg" aria-hidden="true"></i>

```bash
$ wget "http://dlc.openindiana.org/isos/hipster/OI-hipster-gui-20160421.iso"
$ wget "http://dlc.openindiana.org/isos/hipster/OI-hipster-gui-20160421.iso.sha256sum"
$ sha256sum --check OI-hipster-gui-20160421.iso.sha256sum
OI-hipster-gui-20160421.iso: OK
$ wodim -v dev=/dev/sr0 -dao OI-hipster-gui-20160421.iso

```

Linux GUI <i class="fa fa-linux fa-lg" aria-hidden="true"></i>


< Place holder for content >


#### Mac OS-X

MAC Console <i class="fa fa-apple fa-lg" aria-hidden="true"></i>


< Place holder for content >


MAC GUI <i class="fa fa-apple fa-lg" aria-hidden="true"></i>


< Place holder for content >


#### Windows

Windows Console <i class="fa fa-windows fa-lg" aria-hidden="true"></i>


< Place holder for content >


Windows GUI <i class="fa fa-windows fa-lg" aria-hidden="true"></i>


< Place holder for content >

<!-- -->
## Creating a bootable OpenIndiana USB Flash Drive

#### Prerequisites

* USB flash drive - (2GB or larger)
* Download the OpenIndiana USB Live Media installer
* Download the appropriate OpenIndiana 1G or 2G header file

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
At this time, creating a bootable flash drive requires the use of a header file.

- There are 2 unique USB header files (1G and 2G).
- Please ensure you have selected the correct file.
    - The 1G.header is only suitable for use with the text installer (Command line console).
    - The 2G.header is only suitable for use with the live installer (Gnome desktop).
    - The files are *NOT* interchangeable.

Failure to use the correct USB header file can result in the USB drive either failing to boot, or only partially booting (and falling back to systems maintenance mode with KSH93 errors).
</div>

<!-- CAUTION: --> <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i> **CAUTION:**
<div class="well">
OpenIndiana Hipster does not yet support USB 3.0.

* When attaching backward compatible USB 3.0 devices to your system, please ensure they are *NOT* attached to a USB 3.0 port.
</div>

#### Live Media Creation Methods

| Operating System | Method |
| --- | --- |
| BSD | `dd` |
| illumos/Solaris | `dd` |
| Linux | ``dd`` |
| MAC OS X | ``dd`` |
| Windows | ``OpenSolaris Live USB Creator`` |

<!--

TODO:

Add link for Solaris USBCOPY tool.

-->

#### Identifying the path to your USB device

| Operating system | Command | Device
| --- | --- | ---
| BSD | `camcontrol devlist` | `/dev/da*`
| illumos/Solaris | `rmformat -l` | `/dev/rdsk/c*t*d*`
| Linux | `lsblk` | `/dev/sd*`
| MAC OS X | `diskutil list` | `/dev/disk*`
| Windows | N/A | N/A


<!-- CAUTION: --> <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i> **CAUTION:**
<div class="well">
When issuing the USB copy command, be sure to specify the entire USB device.

* Do not including any partition or slice number.
    * For example use `sda`, not `sda1`; `c0t0d0`, not `c0t0d0p1`.
* Make sure you identify the correct storage device.
    * All data on the device will be erased.
* If any filesystems are located on the USB storage device, they must first be unmounted.
    * Desktops may automatically mount removable devices.
    * As necessary, select any desktop icons for the USB device and issue an 'Eject' or 'Unmount' command.
    * For Linux, use `umount <path>`.
    * For illumos/Solaris use `rmumount <path>`.
    * for MAC OS X use `diskutil unmountDisk <path>`.
    * Verify using the `mount` command.
</div>


### BSD/Linux/OS X

```bash
$ cat 1G.header OI-hipster-text-20160421.usb | sudo dd bs=1024k of=/dev/sdX
# or if you have a live image larger then 1G
$ cat 2G.header OI-hipster-gui-20160421.usb | sudo dd bs=1024k of=/dev/sdX
# where "X" is the letter of your USB device
```

### illumos/Solaris

< Place holder for content >

### Windows

< Place Holder for content >


## Testing Openindiana Using Live Media

The Live Media DVD and USB installers provide a graphical live environment where you can explore OpenIndiana and test the compatibility of your hardware.
When using Live Media to explore OpenIndiana, no changes are made to your system, unless you explicitly choose to install OpenIndiana.

Although it is possible to use it over a network with SSH X forwarding if you enable SSH.


## Booting OpenIndiana

< Place holder for section introduction  content >

#### Booting Physical Hardware

<!--

OpenIndiana can be pretty picky about hardware.
Unsupported components can cause excessive CPU usage.

For example:

* Gigabyte motherboards with Intel socket 775 and ICH10 chipset don't work well with OI.
    * Kernel using from 40-80% cpu @ idle.
* Seems to work OK on Intel brand desktop motherboards though.
* Works well with HP Zxxx class workstation hardware.

-->

Insert the bootable media (DVD or USB flash drive) and boot (start/restart) your computer.
For the computer to boot from the media, you may need to specify the device by pressing the boot order hotkey.
Alternately, you may need to change the boot device order in your BIOS configuration.

#### Booting Virtual Hardware

The most efficient way to boot a virtual machine is to boot directly from the DVD ISO file.
Alternately, you may use host to guest DVD/USB passthrough to boot from physical media.

##### Virtualbox

For VirtualBox 3.2 or later:

"Use host I/O cache" must be enabled in the emulated storage controller used by the virtual machine to successfully boot OpenIndiana.

##### Vmware Workstation Player

< place holder for content >

##### Vmware ESXI

< place holder for content >


### The OpenIndiana Boot Menu

When you see a menu, press Enter to start OpenIndiana on your computer.
As it runs, you will be prompted with a few questions.
You should eventually be presented with a desktop.

### Authenticating when using the OpenIndiana LiveDVD

The user login for the text session is username 'jack' along with the password 'jack'.
For administrative or elevated access, prepend your commands with `pfexec`.
You may also use the `sudo` command.

You may obtain root using the `su` command along with the password 'openindiana'.

### Using the Device Driver Utility

You can use the Device Driver Utility to check if your hardware requires additional drivers.

## Preparing to Install OpenIndiana

< Place Holder for section introduction content >

### Backing up data

< Place holder for content >

### Deciding where to install OpenIndiana

< Place holder for content >

### Gathering Network Information

< Place holder for content >

## Installing OpenIndiana

< Place Holder for content >


## Installing Applications

Import and validate: [pgk cheat sheet](http://wiki.openindiana.org/oi/pkg+Cheat+Sheet)


## Xorg

< placeholder >

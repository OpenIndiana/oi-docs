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

<img src = "../../Openindiana.png">

# Hipster Handbook - Common Tasks

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
<p>This is a <b>DRAFT</b> document which may contain errors!</p>
<p>Help us improve and expand this site.</p>
<p>Please see the <b>Contrib</b> section for more details about joining the OpenIndiana Documentation Team.</p>
</div>

< place holder for introduction content >


## Basic UNIX commands

In addition to native command line system administration tools, OpenIndiana also includes the GNU core utilities suite.
When working with basic UNIX commands, most likely you will be using the GNU core utilities.
For learning to navigate the OpenIndiana command line environment, Linux command line books are very helpful.

One of the best books currently available is [The Linux Command Line](http://linuxcommand.org/tlcl.php) by William Shotts.
If you want to quickly become a command line guru, this is the book to read.
Best of all, it was released under a Creative Commons license and can be downloaded for free.
Print versions are also available.


## Basic system administration

### Commands to be able to use administration commands

| Command | Further details | Brief summary
| --- | --- | ---
| `su` | [su(1M)](https://illumos.org/man/1M/su) | Switch user. Without any parameters, root implied
| `sudo` | sudo(1M) | Perform the command following with root privilages
| `pfexec` | [pfexec(1)](https://illumos.org/man/1/pfexec) | Similar to `sudo` but not prompted for a password and limited privilages

Examples:

### Basic system information

| Command | Further details | Brief summary
| --- | --- | ---
| `prstat` | [prstat(1M)](https://illumos.org/man/1M/prstat) | Statistics on system processes
| `df` | [df(1M)](https://illumos.org/man/1m/df) | Disk usage by partition
| `du` | [du(1)](https://illumos.org/man/1/du) | Disk usage by file
| `pkg list` | pkg(1) | List software packages installed on the system

Examples:

### System shutdown, reboot…

| Command | Further details | Brief summary
| --- | --- | ---
| `shutdown` | [shutdown(1M)](https://illumos.org/man/1M/shutdown) | Shutdown the system

Examples:

```
shutdown -i5 -g0 -y # Turn off the machine immediately
shutdown -i6 -g0 -y # Reboot the machine immediately
shutdown -i6 -g120 -y # Reboot the machine in 2 minutes (120 seconds)
```

### User management

| Command | Further details | Brief summary
| --- | --- | ---
| `listusers` | [listusers(1)](https://illumos.org/man/1/listusers) | List users accounts
| `who` | [who(1)](https://illumos.org/man/1/who) | List users logged onto the system
| `useradd` | [useradd(1M)](https://illumos.org/man/1M/useradd) | Create a new user
| `usermod` | [usermod(1M)](https://illumos.org/man/1M/usermod) | Modify a user (group memberships, roles, login shell…)


## Desktop applications

< place holder >


### How can the desktop be modified?

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Gnome or (MATE) walkthrough
* Appearance applet
    * Enabling Compiz
    * Configuring font anti-aliasing
    * Desktop backgrounds

In regards to the default terminal emulator, see: <https://www.illumos.org/issues/7525>

* we introduce mediator x-terminal-emulator for link /usr/bin/x-terminal-emulator with possible implementations gnome-terminal, mate-terminal and xterm;
* mate-terminal implementation has the highest priority (if it is installed, by default it wins);
* glib is modified to use link /usr/bin/x-terminal-emulator if it's found for running applications with Terminal=true.
</div>


## Multimedia - Audio

< Place Holder for future content >


## Multimedia - Video

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* How to get OI to play a DVD
* How to get flash player installed and working.
* How to get VLC installed and working.
* Totem (video player)

</div>


### Using OpenIndiana as a media server, HTPC, etc.

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* <http://forum.kodi.tv/showthread.php?tid=44315&page=2>
* <http://lightsandshapes.com/plex-on-smartos.html>

</div>


## Printing

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* OI uses CUPS as the primary print system.
* GNOME print manager (`system-config-printer`)

See the additional information about printing in contrib/topics.md
Also see the deprecation comments in the OSOL printing guide.

</div>


## Graphics workstation

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* GIMP

</div>


## Desktop Publishing system, Etc.

< Place holder for content >

## Boot loader settings

OpenIndiana Hipster uses the 'BootForth' boot loader (GRUB is not used any
more, disregard older manusls/wiki pages that mention grub).

Boot configuration items should be stored in `/boot/conf.d`.

* To change the console from the standard monitor to serial console
    (e.g. `COM1` / `ttyS0` on other OSes), use the following command:

        # echo console=ttya > /boot/conf.d/console

    (Alternatively, use `eeprom console=ttya`).

* To change the boot-loader's default timeout, run:

        # echo autoboot_delay=2 > /boot/conf.d/autoboot

NOTE:
Any filename can be used under `/boot/conf.d/` - the filename does not
matter (only its content matters).

See [current status for loader](https://wiki.illumos.org/display/illumos/Current+status+for+loader)
for more technical details (and other boot options).

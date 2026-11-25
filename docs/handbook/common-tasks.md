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

# Common Tasks

<div class="note" markdown="1">
!!! note
    This is a **DRAFT** document which may contain errors!

    Help us improve and expand this site.

    Please see the **Contrib** section for more details about joining the OpenIndiana Documentation Team.
</div>

OpenIndiana can do a fair amount of common tasks you expect from any other system. Given its similarities to Linux and
BSD, most software that already works on those systems also works on OpenIndiana. This includes, but is certainly not
limited to, various UNIX commands, desktop applications, multimedia programs, graphics, and desktop publishing.


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
| `sudo` | sudo(1M) | Perform the command following with root privileges
| `pfexec` | [pfexec(1)](https://illumos.org/man/1/pfexec) | Similar to `sudo` but not prompted for a password and limited privileges

#### Examples

The following command logs in as root under a different user:

```bash
$ su
```

The following command lists the current directory using root privileges:

```bash
$ sudo ls
```

!!! TODO
    Write an example for the pfexec command.

### Basic system information

| Command | Further details | Brief summary
| --- | --- | ---
| `prstat` | [prstat(1M)](https://illumos.org/man/1M/prstat) | Statistics on system processes, like top
| `df` | [df(1M)](https://illumos.org/man/1m/df) | Disk usage by partition
| `du` | [du(1)](https://illumos.org/man/1/du) | Disk usage by file
| `pkg list` | pkg(1) | List software packages installed on the system

#### Examples

To list processes on the system, run the following command:

```bash
$ prstat
```

To list the total ree disk space on the root partition in a human-readable format, run the following command:

```bash
$ df -h /
```

To get the size of "mynote.txt" in bytes using `du`, run the following:

```bash
$ du -b mynote.txt
```

### System shutdown, reboot…

| Command | Further details | Brief summary
| --- | --- | ---
| `shutdown` | [shutdown(1M)](https://illumos.org/man/1M/shutdown) | Shutdown the system

#### Examples

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


## The Desktop

OpenIndiana's default desktop environment is the MATE desktop environment. This desktop environment brings the familiar
feel of OpenSolaris's GNOME 2 desktop environment with little differences, so users of the OpenSolaris desktop
environment will feel right at home.

### Basics

At first glance, the desktop looks somewhat of a cross between the Windows and macOS interfaces. At the top and bottom
of your screen are two "bars" or _panels_ (as they're properly known). The top panel contains a limited menubar
containing three menus, your system tray, and the current date and time. The first menu, _Applications_ contains all
installed applications on the system. The _Places_ menu contains some of the most common directories on the system you
may need to access, such as the current user's home folder, along with a search tool and the option to connect to a
file server. Finally, the _System_ menu contains shortcuts to system preferences, help and about options, and options
to lock the system, log out the current user, or shutdown. To the right of the top panel is your system tray and the
current time and date.

On the other hand, the bottom panel, from left to right, includes a button to show or hide all windows, the task
switcher, a virtual desktop switcher, and the trash. Clicking on any rectangle in the virtual desktop switcher will
switch to a different virtual desktop, allowing you to keep your work organizd. Clicking on the trash icon will open
the trash in the file manager, while dragging any file from the desktop or file manager will move it to the trash.

#### Workspaces

Most modern OSes include the ability to create multiple virtual desktops or workspaces to keep your work organized.
OpenIndiana is no different (and, in fact, has had this feature for several years even before Windows).

### How can the desktop be modified?

<div class="info" markdown="1">
!!! info "Documentation Team"
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

In the MATE desktop environment, you can configure your system via the Control Center. Access it via the _System_ menu in the top panel.

When you open the Control Center, there are several categories of settings:

- **Administration**: Tasks that impact the system's operation and resources.
- **Hardware**: Options to configure hardware devices, such as displays, sound, keyboards, mice, and power management.
- **Look and Feel**: Options that configure how the desktop looks. This includes theme options.
- **Personal**: Settings related to your personal usage of the system.
- **Other**: Miscellaneous preferences. NVIDIA X Server Settings can be found here.

Note that you may access some of these preference items individually under _System > Preferences_ in the top panel.

#### Look and Feel
MATE ships with several themes by default. In OpenIndiana, the default theme is the _Nimbus_ theme, the same theme used
in OpenSolaris. If you don't like the default theme, or simply want to try other available themes, go to the Control
Center and look under _Look and Feel_ for the _Apperance_ option, and then open it. Under _Theme_, select the theme
you want to use. Each time you select a different theme, it is instantly applied.

If desired, you may also install additional themes too. After downloading a theme, in the _Appearance Preferences_
window opened earlier, click the _Install_ button and select the theme package you downloaded earlier. You can then
choose the newly installed theme for the desktop.

<div class="warning" markdown="1">
!!! warning "About External Themes"

    Like with anything you download, be _very_ careful about downloading and installing custom themes as you can
    inadvertently install a malicious theme (although such a situation should be very rare for OpenIndiana).
</div>

### Differences from GNOME

If you are coming from a legacy OpenSolaris installation with GNOME 2, you should mostly feel right at home. However,
you should be aware of some important differences between GNOME 2 and MATE:

- LightDM is used instead of GDM.
- Some MATE applications may have slight differences compared to their GNOME 2 counterparts.

Ultimately, there shouldn't be too many radical differences other than some mostly under-the-hood changes. MATE was
chosen to preserve the OpenSolaris desktop as much as possible, so migrating to OpenIndiana is very harmless.

If you are coming from a Solaris 11 installation with GNOME 3/4x, then you will have to adapt to the radically
different UI. MATE combines the familiarity of both Windows and macOS in some respects, so chances are you shouldn't
have too much difficulty adapting to the differences. On the other hand, the under-the-hood components are much
different too.

## Setting Up hipster-encumbered

In some situations, namely in multimedia ones, you may need software that deals with formats that might be covered by
one or more patents. In OpenIndiana, this software won't be in the base repository, but instead a separate repository:
hipster-encumbered. If you need this repository, run the following commands below:

```bash
$ sudo pkg set-publisher -g https://pkg.openindiana.org/hipster-encumbered hipster-encumbered
$ sudo pkg refresh
```

Afterwards, hipster-encumbered will be enabled, and you will be able to install packages from that repository like you
would any other package.

## Multimedia and Graphics

OpenIndiana supports multiple different multimedia tasks too, whether that's for graphics, audio, or video.

### Audio

OpenIndiana supports multiple different audio applications:

- **Playback**: VLC
- **Editing**: Audacity
- **Ripping**: Sound Juicer

!!! info "Updates Needed"
    While most applications listed above are up to date, some, namely Audacity, are severely behind in their latest
    versions. We are looking for contributors to ship newer versions and warmly welcome your contribution.

### Video

<div class="info" markdown="1">
!!! info "Documentation Team"
    ITEMS TO WRITE ABOUT:

    * How to get OI to play a DVD
</div>

#### Video Playback

OpenIndiana ships with multiple video players available for installation, including VLC and Totem. Neither are
installed by default, so it is up to you to install a video player of your choice.

Totem is a simple, solid video player. It doesn't have as many features compared to VLC, but it supports common
multimedia formats. To install Toem, run the following command in a terminal below:

```bash
$ sudo pkg install totem
```

If you prefer to use VLC over Totem, such as for playing many more formats, run the following command in a terminal
below:

```bash
$ sudo pkg install vlc
```

From there, VLC will be installed.

### Using OpenIndiana as a media server, HTPC, etc.

<div class="info" markdown="1">
!!! info "Documentation Team"
    ITEMS TO WRITE ABOUT:

    * <http://forum.kodi.tv/showthread.php?tid=44315&page=2>
    * <https://web.archive.org/web/20180822163548/http://lightsandshapes.com/plex-on-smartos.html>
</div>

## Printing

OpenIndiana uses CUPS, the same printing system used on macOS, Linux, and other systems. If your printer works via
CUPS, then you should have no issue using your printer with OpenIndiana.

<div class="info" markdown="1">
!!! info "Documentation Team"
    ITEMS TO WRITE ABOUT:

    * GNOME print manager (`system-config-printer`)

    See the additional information about printing in contrib/topics.md
    Also see the deprecation comments in the OSOL printing guide.
</div>

## Graphics workstation

OpenIndiana supports some functionality as a graphics workstation. For advanced image editing, GIMP is available for
usage. To install GIMP, run the following command:

```bash
sudo pkg install gimp
```

Once installed, you may use GIMP just like you would on Linux, BSD, Windows, and other systems.

<div class="info" markdown="1">
!!! info "TODO Items"
    TODO: Expand section with more information on GIMP.
</div>

## Desktop Publishing system, Etc.

< Place holder for content >

## Boot loader settings

OpenIndiana Hipster uses FreeBSD's bootloader, known as 'BootForth'. Older versions used GRUB, so older manual/wiki
pages will likely mention GRUB. Please disregard those older resources as they do not apply to modern versions of
OpenIndiana Hipster.

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

See [loader(5)](https://illumos.org/man/5/loader)
for more technical details (and other boot options).

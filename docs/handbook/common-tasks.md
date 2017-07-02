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

OpenIndiana is a multi-user platform. The role of administering the system is
assigned to one privilaged user known as the _superuser_ or _root_ user. This user
is assigned all privilages.

To become root, use the switch user command: [su(1M)](https://illumos.org/man/1M/su).

However, other users can be assigned a select number of privilages by the
superuser, for example, to monitor or even perform some system administration
duties. Furthermore, due to security issues, it is more cautious to perform some
tasks not directly as the superuser, but as a user with limited
privilages. Indeed some administrators create special users and assign these
special privilages to perform certain tasks.

To assign a user a number of privilages, there are two common commands
available:

* [pfexec(1)](https://illumos.org/man/1M/pfexec).
* [sudo(1m)](https://illumos.org/man/1M/sudo).

The `sudo` command, i.e., superuser do, allows a user to execute the command
following the sudo keyword.

Example:
To remove a file in a directory where root privilages are required, issue the
following:

```
sudo rm /var/adm/whatever.log
```

The user is then prompted for the user's password and a special file is checked
whether the user is pewrmitted to perform the operation.

This 'special file' is **/etc/sudoers** and it should ideally be edited by the
superuser using the following command:

```
sudo visudo
```

### Basic system information

#### System processes

```markdown
prstat
```

This command provides a host of information on all processes running on the system.
Some of the information provided is as follows:

- percentage of CPU used by each process
- amount of memory consumed by each process
- unique id of each process (which can, for example, be used to stop the process)

#### Disk usage

```markdown
df -h
```

Provides information on disk size, amount of space used and available free space
for all attached storage devices. The `-h` option reports this information in
human readable format.

#### Largest files in a directory

Go to the directory using the `cd` command and issue the following command:

```markdown
du | sort -n
```

This will list the size of each file in the current directory and all
subdirectories, starting with the smallest up to the largest files.

#### Who is logged on to the system

```markdown
listusers
```

#### List all software packages installed on the system

```markdown
pkginfo
```

### System shutdown, reboot, ...

OpenIndiana defines a number of different system states known as run-levels. You
can change from one system state to another by using the `shutdown` command and
specify the run-level using the `i` option. You can always determine the
run-level via `who -r`.

You must be root or have root privilages (e.g., using `sudo`) to send the system
into a different state, i.e., turn off, reboot, etc. Shutdown and turn off all
hardware (if supported by the hardware) now:

```markdown
shutdown -i5 -g0 -y
```

Changing the run-level of the system can be disruptive to other users currently
using the system. Thus, it is always wise to establish who is currently logged
onto the system before changing the run-level.

* `-i [run-level]` is used to specifiy the run-level. This is either a digit or a
  single letter. Here are some run-levels available:
    * `5` stop all system services, and turns off hardware devices, etc. Here
      are some run-levels.
    * `6` reboot the system.
    * `1` single-user mode. Primarily used for system maintenance.
    * `S` single-user mode where only a command line terminal is available.
* `-g [seconds]` is used to specify the number of seconds after which to commence
   shutting down services. `0` immediately intiates shutting down all services.
* `-y` automatically answers all system questions with 'yes'. The shutdown
   process is not interrupted by system prompts requiring user-interactive
   intervention.


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Adding users, etc.
* Shutting down the system
    * `shutdown [options]`
    * `reboot`
    * `halt`

</div>


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

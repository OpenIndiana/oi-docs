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

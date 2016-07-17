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

# OpenIndiana Handbook - Common Tasks

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">

This document is a work in progress (draft).

</div>

< place holder for introduction content >


## Basic UNIX commands

< place holder >


## Basic system administration

* Adding users, etc.


## Desktop applications

< place holder >

### How can the desktop be modified?

* Gnome walkthrough
* Appearance applet
    * Enabling Compiz
    * Configuring font anti-aliasing


## Multimedia

< place holder >


### Pulse Audio configuration

DOC TEAM ITEMS TO WRITE ABOUT:

* How to use the hidden `gstreamer-properties` configuration utility.
* Pulse Audio configuration
* [possible resource](https://www.solarismultimedia.com/)

Searching for cards with pulse audio command line tool

```bash
pacmd list-cards
```

listing devices

```bash
ls /dev/sound
0  0ctl  audiohd:0  audiohd:0ctl  audiohd:0dsp  audiohd:0mixer
```

```bash
ls -l /dev/audio* /dev/sound/*
lrwxrwxrwx 1 root root  7 Jul 14 21:57 /dev/audio -> sound/0
lrwxrwxrwx 1 root root 10 Jul 14 21:57 /dev/audioctl -> sound/0ctl
lrwxrwxrwx 1 root root  9 Jul 14 21:57 /dev/sound/0 -> audiohd:0
lrwxrwxrwx 1 root root 12 Jul 14 21:57 /dev/sound/0ctl -> audiohd:0ctl
lrwxrwxrwx 1 root root 50 Jul 14 21:57 /dev/sound/audiohd:0 -> ../../devices/pci@0,0/pci17aa,20f2@1b:sound,audio0
lrwxrwxrwx 1 root root 53 Jul 14 21:57 /dev/sound/audiohd:0ctl -> ../../devices/pci@0,0/pci17aa,20f2@1b:sound,audioctl0
lrwxrwxrwx 1 root root 48 Jul 14 21:57 /dev/sound/audiohd:0dsp -> ../../devices/pci@0,0/pci17aa,20f2@1b:sound,dsp0
lrwxrwxrwx 1 root root 50 Jul 14 21:57 /dev/sound/audiohd:0mixer -> ../../devices/pci@0,0/pci17aa,20f2@1b:sound,mixer0
```

```bash
cat /dev/sndstat
SunOS Audio Framework

Audio Devices:
0: audiohd#0 Intel HD Audio, ICH9 (DUPLEX)

Mixers:
0: audiohd#0 Intel HD Audio, ICH9
        HD codec: Conexant CX20561
```


#### Testing audio

Finding the hardware

```bash
prtconf -d | grep -i audio
        pci17aa,20f2 (pciex8086,293e) [Intel Corporation 82801I (ICH9 Family) HD Audio Controller], instance #0
```

Listing the devices

```bash
audioctl list-devices
audiohd#0
```

Running the test

```bash
audiotest
Sound subsystem and version: SunOS Audio 4.0 (0x00040003)
Platform: SunOS 5.11 illumos-380fd67 i86pc

*** Scanning sound adapter #1 ***
/dev/sound/audiohd:0dsp (audio engine 0): audiohd#0
  - Performing audio playback test...
        <left> ................OK
        <right> ...............OK
        <stereo> ..............OK
        <measured sample rate 47949.00 Hz (-0.11%)>

*** All tests completed OK ***
```

### MP3 and CD audio support

DOC TEAM ITEMS TO WRITE ABOUT:

* Codecs, etc.
* Rythembox (audio player)
* Sound Juicer (CD ripper)


### Video support

DOC TEAM ITEMS TO WRITE ABOUT:

* How to get OI to play a DVD
* How to get flash player installed and working.
* How to get VLC installed and working.
* Totem (video player)


### Using OpenIndiana as a media server, HTPC, etc.

DOC TEAM ITEMS TO WRITE ABOUT:

* <http://forum.kodi.tv/showthread.php?tid=44315&page=2>
* <http://lightsandshapes.com/plex-on-smartos.html>


## Printing

DOC TEAM ITEMS TO WRITE ABOUT:

* OI uses CUPS as the primary print system.
* GNOME print manager (`system-config-printer`)

See the additional information about printing in contrib/topics.md
Also see the deprecation comments in the OSOL printing guide.


## Graphics workstation

DOC TEAM ITEMS TO WRITE ABOUT:

* GIMP


## Desktop Publishing system, Etc.

< Place holder for content >

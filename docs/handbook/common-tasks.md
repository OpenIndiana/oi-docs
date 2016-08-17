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

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Adding users, etc.

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

</div>


## Multimedia - Audio

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* How to use the hidden `gstreamer-properties` configuration utility.
* Pulse Audio configuration
* [possible resource](https://www.solarismultimedia.com/)
* [How it works](http://tuxradar.com/content/how-it-works-linux-audio-explained)

</div>

OpenIndiana employs several different audio components which work together to facilitate audio output and control.
These systems are, in a sense, layered and each provides specific functions, although not without a significant a degree of crossover.
The reason for so many different systems is largely a case of ensuring support for legacy as well as modern applications.

| System | Description
| --- | ---
| Gstreamer | Mixer/Proxy
| PulseAudio | Mixer/Proxy
| OSS/OSSv4 | Open Sound System
| Sun Audio | Solaris Audio API (Dev Audio)

At the lower levels of the OpenIndiana audio stack are OSS, OSS V4, and Sun Audio.
Sun Audio is the oldest of the components, followed by OSS and OSS V4 respectively.
The oldest applications were created to work with Sun Audio.
OSS and OSS V4 provide support for applications originally written for Sun Audio.

At the mid and upper levels are Gstreamer and PulseAudio, both of which provide a proxy like mixing function.
Pulse Audio is the newest of the mixing components.

Volume and other controls for the various components can be exposed from any level.
For example, volume controls exist for OSS, as well as PulseAudio and Gstreamer.

With so many different components and so much crossover in capabilities, the audio landscape within OpenIndiana can be a bit confusing.


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
The following packages are prerequisites for the proper operation of the `gstreamer-properties` utility.

* library/audio/gstreamer/plugin/base
* library/audio/gstreamer/plugin/gnonlin
* library/audio/gstreamer/plugin/good

</div>


### Finding your audio hardware

`prtconf -d | grep -i audio`

```bash
pci1462,8a91 (pciex10de,bea) [NVIDIA Corporation GF108 High Definition Audio Controller], instance #1
pci1458,a002 (pciex8086,3a3e) [Intel Corporation 82801JI (ICH10 Family) HD Audio Controller], instance #0
```

`ls /dev/sound`

```bash
0  0ctl  1  1ctl  audiohd:0  audiohd:0ctl  audiohd:0dsp  audiohd:0mixer  audiohd:1  audiohd:1ctl  audiohd:1dsp  audiohd:1mixer
```

`ls -l /dev/audio* /dev/sound/*`

```bash
lrwxrwxrwx 1 root root  7 Aug 10 15:22 /dev/audio -> sound/0
lrwxrwxrwx 1 root root 10 Aug 10 15:22 /dev/audioctl -> sound/0ctl
lrwxrwxrwx 1 root root  9 Aug 10 15:22 /dev/sound/0 -> audiohd:0
lrwxrwxrwx 1 root root 12 Aug 10 15:22 /dev/sound/0ctl -> audiohd:0ctl
lrwxrwxrwx 1 root root  9 Aug 11 18:38 /dev/sound/1 -> audiohd:1
lrwxrwxrwx 1 root root 12 Aug 11 18:38 /dev/sound/1ctl -> audiohd:1ctl
lrwxrwxrwx 1 root root 50 Aug 10 15:22 /dev/sound/audiohd:0 -> ../../devices/pci@0,0/pci1458,a002@1b:sound,audio0
lrwxrwxrwx 1 root root 53 Aug 10 15:22 /dev/sound/audiohd:0ctl -> ../../devices/pci@0,0/pci1458,a002@1b:sound,audioctl0
lrwxrwxrwx 1 root root 48 Aug 10 15:22 /dev/sound/audiohd:0dsp -> ../../devices/pci@0,0/pci1458,a002@1b:sound,dsp0
lrwxrwxrwx 1 root root 50 Aug 10 15:22 /dev/sound/audiohd:0mixer -> ../../devices/pci@0,0/pci1458,a002@1b:sound,mixer0
lrwxrwxrwx 1 root root 66 Aug 11 18:38 /dev/sound/audiohd:1 -> ../../devices/pci@0,0/pci8086,2e21@1/pci1462,8a91@0,1:sound,audio1
lrwxrwxrwx 1 root root 69 Aug 11 18:38 /dev/sound/audiohd:1ctl -> ../../devices/pci@0,0/pci8086,2e21@1/pci1462,8a91@0,1:sound,audioctl1
lrwxrwxrwx 1 root root 64 Aug 11 18:38 /dev/sound/audiohd:1dsp -> ../../devices/pci@0,0/pci8086,2e21@1/pci1462,8a91@0,1:sound,dsp1
lrwxrwxrwx 1 root root 66 Aug 11 18:38 /dev/sound/audiohd:1mixer -> ../../devices/pci@0,0/pci8086,2e21@1/pci1462,8a91@0,1:sound,mixer1
```

### OSS/OSS V4

#### Listing devices

`audioctl list-devices`

```bash
audiohd#0
```

### Pulse Audio

#### Listing devices

```bash
pacmd list-cards
```


### Sun Audio

#### Listing devices

`cat /dev/sndstat`

```bash
SunOS Audio Framework

Audio Devices:
0: audiohd#0 Intel HD Audio, ICH9 (DUPLEX)

Mixers:
0: audiohd#0 Intel HD Audio, ICH9
        HD codec: Conexant CX20561
```

#### Performing a sound test

`audiotest`

```bash
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

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Codecs, etc.
* Rythembox (audio player)
* Sound Juicer (CD ripper)

</div>


#### gstreamer plugin prerequisites

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Before you can play MP3 files, several gstreamer plugins are required.
Due to licensing concerns in some countries, these plugins are not part of the default OpenIndiana installation.
You may however install them from the **_hipster-encumbered_** repository.

* library/audio/gstreamer/plugin/bad
* library/audio/gstreamer/plugin/ffmpeg
* library/audio/gstreamer/plugin/ugly

</div>


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

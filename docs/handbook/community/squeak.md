<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
 (the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.


The Original Documentation is at https://squeak.org/documentation/

The Initial Writer of this Documentation is David Stes Copyright (C) 2020.
All Rights Reserved. (https://sourceforge.net/u/stes/profile).

Contributor(s): David Stes.

-->

<img src = "../../Openindiana.png">

# Hipster Handbook - Squeak Smalltalk-80

The following notes document the steps to install Squeak on OpenIndiana Hipster, and how to use this implementation of Smalltalk.

Smalltalk is a graphical development environment and programming language.  A famous reference is the 700-page book : "Smalltalk-80: The Language and its Implementation"

Adele Goldberg and David Robson
Xerox Palo Alto Research Center
Addison-Wesley Publishing Company, Reading,
Massachussetts, Menlo Park, California, 1983, ISBN 0-201-11371-6

There also exist more recent books on Squeak.

See the <a href="http://www.squeak.org" target="_blank">Squeak website</a> for more information.

Also see the Squeak Wiki for more information : <a href= "http://wiki.squeak.org" target="_blank">Squeak Wiki</a>

## How to install Squeak Smalltalk-80 on OpenIndiana

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i>OpenIndiana Prerequisites
<div class="well">
<p>When installing OpenIndiana, you will need a desktop (graphical) environment, such as the MATE desktop.

One way to get a MATE desktop, is to run the OpenIndiana text installer and then install the group package "mate_install" and then enable the Light Display Manager as follows:

# pkg install -v --accept mate_install

# svcadm enable graphical-login/lightdm

This enables the "light display manager".

In any case, even if you do a direct desktop installation (without running through the text based installation of OpenIndiana), take care about the ip address and hostname of the system.

Squeak will try to use the ip address that corresponds with the hostname of the system as its ip address.

So multi-homed systems (with multiple network interfaces) may have some strange behavior for TCP/IP networking inside Squeak.  This may require some experimentation to see what works.

We've tested Squeak with a text-based installation with fixed IP address and hostname resolving is set up so that the fixed ip address corresponds to the hostname, and there were no other network interfaces on the test server.
</div>


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i>Installing Squeak
<div class="well">
</div>

Squeak consists of a VM (virtual machine) and Smalltalk images.  You can find Smalltalk images at <a href= "http://files.squeak.org" target="_blank">files.squeak.org</a> or at <a href="http://cuis-smalltalk.org" target="_blank">cuis-smalltalk.org</a>.

Because users of Smalltalk are normally saving their own custom image, there exist many other images on the internet to download.

The images are cross-platform (in theory) and do not depend on OpenIndiana.  They can run on Windows or Linux or any other platform, in the same way as they will on OpenIndiana.

The VM (virtual machine) is the interpreter that is OpenIndiana specific, and that runs (as some sort of interpreter or just-in-time compiler) the Smalltalk byte-code from the portable Smalltalk image.

On OpenIndiana install as follows:

# pkg list -af squeak-4
NAME (PUBLISHER)                                  VERSION                    IFO

runtime/squeak4 (userland)                        4.16.7                     ---

# pkg install -v squeak-4

During installation you may notice:

Changed mediators:
  mediator squeak:
           version: None -> 4 (system default)

With the squeak-4 package you can run Squeak 4.6 images.  Note that squeak-4 is 32-bit and most Squeak 4 images are 32-bit.   It is possible to compile squeak-4 in 64-bit but there are very few Smalltalk Squeak-4 64-bit images available.   For running 64-bit images, squeak-5 can be used with any of the Squeak 5 or Squeak 6 64-bit images.

After installation, see the squeak(1) manpage :

# man squeak

It is possible to simultaneously install squeak-4 and squeak-5 as follows:

# pkg mediator squeak
MEDIATOR            VER. SRC. VERSION IMPL. SRC. IMPLEMENTATION
squeak              system    4       system

# pkg install -v squeak-5

At the end of installation the hardlink squeak will point to the squeak-5 binary.  Note that the mediator changed:

# pkg mediator squeak
MEDIATOR            VER. SRC. VERSION IMPL. SRC. IMPLEMENTATION
squeak              system    5       system     stack-spur

The system-administrator can override the OpenIndiana choice by using the pkg set-mediator or pkg unset-mediator commands.

Because both packages can be installed simulteaously it is possible to run side-by-side Squeak 4.6 and Squeak 5.3, Cuis Smalltalk or Squeak 6.0 alpha images.



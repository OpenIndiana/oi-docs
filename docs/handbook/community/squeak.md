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

There also exist more recent books on Squeak.  See the <a href="http://www.squeak.org" target="_blank">Squeak website</a> for more information, specifically the documentation section.  Also see the Squeak Wiki for more information : <a href= "http://wiki.squeak.org" target="_blank">Squeak Wiki</a>

## How to install Squeak Smalltalk-80 on OpenIndiana

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i>OpenIndiana Prerequisites
<div class="well">
<p>Squeak is a graphically oriented system, and it is recommended to install a desktop (graphical) environment, such as the MATE desktop, on OpenIndiana, in order to use Squeak.

One way to get a MATE desktop (there exist other methods) is to run the OpenIndiana text installer and then install the group package "mate_install" and then enable the Light Display Manager as follows:

        # pkg install -v --accept mate_install

        # svcadm enable graphical-login/lightdm

This enables the "light display manager".

In any case, even if you do a direct desktop installation (without running through the text based installation of OpenIndiana), take care about the ip address and hostname of the system.

Squeak will try to use the ip address that corresponds to the hostname of the system as its ip address.

So multi-homed systems (with multiple network interfaces) may have some strange behavior for TCP/IP networking inside Squeak.  This may require some experimentation to see what works.

We've tested Squeak with a text-based installation with fixed IP address and hostname resolving is set up so that the fixed ip address corresponds to the hostname, and there were no other network interfaces on the test server.

There are three Squeak packages : squeak-4, squeak-5 and squeak-5c.  See the next section on how to install those packages.  However, before installing, the OpenIndiana system should have some required packages installed.

To check the required dependencies for Squeak, use the command:

        # pkg contents -r -t depend squeak-4

This will list a number of dependencies.  If those are not met, you should upgrade OpenIndiana before attempting to install Squeak.

You can upgrade OpenIndiana and check the dependencies again:

        # pkg update -v

Squeak is in the OpenIndiana userland-incorporation package since version 0.5.11-2020.0.1.13018.

Use the following command to check the installed consolidation:

        # pkg list userland-incorporation

The installed version should be more recent than 0.5.11-2020.0.1.13018.
</div>


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i>Installing Squeak
<div class="well">
</div>

Squeak consists of a VM (virtual machine) and Smalltalk images.  You can find Smalltalk images at <a href= "http://files.squeak.org" target="_blank">files.squeak.org</a> or at <a href="http://cuis-smalltalk.org" target="_blank">cuis-smalltalk.org</a>.

Because users of Smalltalk are normally saving their own custom image, there exist many other images on the internet to download.

The images are cross-platform (in theory) and do not depend on OpenIndiana.  They can run on Windows or Linux or any other platform, in the same way as they will on OpenIndiana.

The VM (virtual machine) is the interpreter that is OpenIndiana specific, and that runs (as some sort of interpreter or just-in-time compiler) the Smalltalk byte-code from the portable Smalltalk image.

The 'classic' VM (virtual machine) is packaged as squeak-4 and it is able to run 32-bit Squeak 4 images.

On OpenIndiana install squeak-4 as follows:

        # pkg install -v squeak-4

After installation, see the squeak(1) manpage for documentation:

         # man squeak

After installation you can verify the installation as follows:

       # pkg list squeak-4

During installation you may notice:

Changed mediators:
  mediator squeak:
           version: None -> 4 (system default)

After downloading the Smalltalk sources and image from the Squeak website:

       # unzip SqueakV46.sources.zip

and

       # unzip Squeak4.6-15102.zip

You would then launch Squeak as follows (also see the manpage for further details) :

       # squeak Squeak4.6-15102.image

It is possible to compile squeak-4 in 64-bit but there are very few Smalltalk Squeak-4 64-bit images available.   For running 64-bit images, squeak-5 can be used with any of the Squeak 5 or Squeak 6 64-bit images.

It is possible to simultaneously install squeak-4 and squeak-5 as follows:

         # pkg mediator squeak

         # pkg install -v squeak-5

At the end of installation the hardlink squeak will point to the squeak-5 binary.  You will notice that the mediator changed to squeak-5.

        # pkg mediator squeak

The system-administrator can override the OpenIndiana choice by using the pkg set-mediator or pkg unset-mediator commands.

After installation of squeak-5 you can download sources and Smalltalk images from the Squeak website :

         # unzip SqueakV50.sources.zip

and

         # unzip Squeak5.3-19431-64bit.zip

You would then launch squeak as follows:

         # squeak Squeak5.3-19431-64bit.image

Squeak V5 can also run Cuis images.  See the Cuis website for more details.  Given the CuisV5.sources and Cuis5.0-4112.image :

         # squeak Cuis5.0-4112.image

Because both packages can be installed simultaneously it is possible to run side-by-side Squeak 4.6 and Squeak 5.3, Cuis Smalltalk or Squeak 6.0 alpha images.

For most recent Squeak images it will be required to install squeak-5.

There is an additional package squeak-5c which is the Cog implementation of Squeak.  This is a faster implementation of the Squeak virtual machine.

It can be installed as follows:

         # pkg install -v squeak-5c

During installation of the cog implementation, the mediator will be changed as follows:

Changed mediators:
  mediator squeak:
           version: None -> 5 (system default)
    implementation: None -> cog-spur (system default)

The squeak-5 and squeak-5c packages can be installed at the same time, and the system administrator can choose the implementation with the pkg unset-mediator and set-mediator commands.

</div>


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i>Updating Squeak
<div class="well">
</div>

The complete OpenIndiana system can be updated with:

         # pkg update

to update the entire userland-incorporation.

If there is a need to upgrade squeak without upgrading the userland-incorporation, you can do :

         # pkg change-facet facet.version-lock.runtime/squeak-5=false

This can make it possible to update squeak-5 without updating the userland-incorporation:

         # pkg list userland-incorporation

and then update squeak-5 or any other squeak package separately:

         # pkg update squeak-5



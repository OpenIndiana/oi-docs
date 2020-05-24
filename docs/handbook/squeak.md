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

# Hipster Handbook - Squeak Smalltalk-80


## How to install Squeak Smalltalk-80 on OpenIndiana

Contributed by David Stes, the following notes document the steps to install Squeak on OpenIndiana Hipster.

Squeak is an implementation of the Smalltalk-80 graphical development environment and programming language.  A famous reference is the 700-page book :

Smalltalk-80: The Language and its Implementation

	Adele Goldberg and David Robson
	Xerox Palo Alto Research Center
	Addison-Wesley Publishing Company, Reading,
	Massachussetts, Menlo Park, California, 1983, ISBN 0-201-11371-6

There exist a large number of books on Squeak and Smalltalk, see <a href="http://www.squeak.org" target="_blank">Squeak website</a> for more information.

Link to Squeak Wiki: <a href= "http://wiki.squeak.org" target="_blank">Squeak Wiki</a>

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i>OpenIndiana Prerequisites
<div class="well">
<p>When installing OpenIndiana, you will need a desktop (graphical) environment, such as the MATE desktop.
One way to do this is to run the OpenIndiana text installer and then insatll the group package "mate_install" and then enable the Light Display Manager as follows:

# pkg install -v --accept mate_install

# svcadm enable graphical-login/lightdm
(light display manager)

In any case, even if you do a direct desktop installation (without running through the text based installation of OpenIndiana), take care about the ip address and hostname of the system.

Squeak will try to use the ip address that corresponds with the hostname of the system as its ip address.   So multi-homed systems (with multiple network interfaces) may have some strange behavior for TCP/IP networking inside Squeak.  This may require some experimentation to see what works.   

We've tested Squeak with a text-based installation with fixed IP address and hostname resolving is set up so that the fixed ip address corresponds to the hostname, and there are no other network interfaces.
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

With the squeak-4 package you can run Squeak 4.6 images.

It is possible to simulteaously install squeak-5 as follows:

# pkg mediator squeak
MEDIATOR            VER. SRC. VERSION IMPL. SRC. IMPLEMENTATION
squeak              system    4       system     

# pkg install -v squeak-5

At the end of installation the hardlink squeak will point to the squeak-5 binary.  Note that the mediator changed:

# pkg mediator squeak
MEDIATOR            VER. SRC. VERSION IMPL. SRC. IMPLEMENTATION
squeak              system    5       system     stack-spur

The system-administrator can override the OpenIndiana choice by using the pkg set-mediator or pkg unset-mediator commands.

Because both packages can be installed simulteaously it is possible to run side-by-side Squeak 4.6 and Squeak 5.3 or Squeak 6.0 alpha images.


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i>Squeak Profile
<div class="well">
</div>

When running squeak-5, you may notice that it is multi-threaded and is trying to set the priority of threads.  By default OpenIndiana will not allow the process to do that, but a special profile can be used to run squeak as follows:

$ userattr profiles
Squeak,System Administrator

$ pfexec squeak Cuis5.0-4112.image

or

$ pfexec -P proc_priocntl squeak Cuis5.0-4112.image

Verify as follows the squeak threads (LWP light-weight processes)

$ ps -eLo pid,pri,lwp,class,comm | grep squeak
 3849  44      1   IA /usr/lib/squeak/5.0-202004221445-sunos/squeak
 3849  49      2   IA /usr/lib/squeak/5.0-202004221445-sunos/squeak
 3849  49      3   IA /usr/lib/squeak/5.0-202004221445-sunos/squeak
 3849  50      4   IA /usr/lib/squeak/5.0-202004221445-sunos/squeak

Note that there are 4 threads (LWP) and they are in the schedule class IA;
the last thread is running at priority 50 (the others at 49).

By running the squeak process in a pfexec (profile exec) squeak is allowed to increase (raise) the priority of its scheduling thread.

Make a backup of /etc/user_attr first.

Then list the current profile(s) for the user:  for example,

$ userattr profiles <someuser>
Zone Management,System Administrator

(the above is an example, in practice the profiles list may be empty).

$ usermod -P "Squeak,Zone Management,System Administrator" <someuser>

You can then verify that the Squeak profile is added to the list:

$ userattr profiles <someuser>

Zone Management,Squeak,System Administrator

If the user had no profiles assigned, then simply running

$ usermod -P Squeak <someuser>

is enough, but this will replace the old list of profiles by Squeak only.

Once that is done the user can "pfexec squeak" to allow squeak to sets the priority of the scheduling thread.

As far as we can see this does not actually matter a lot, and running squeak without Squeak profile is possible, although that it will print an annoying warning on startup (that "pthread_setschedparam failed: Not owner ).


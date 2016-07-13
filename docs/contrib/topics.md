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


# Contributor Topics

The goal of this page is to provide a TODO list of things which need to be documented.
Topics will be organized first by page and then by topic.


### Potentially useful reference information

NOTE: When clicking some of the links found within these resources, it may be necessary to removed the ';jsessionid=xxx' from the end of the URL. Otherwise the wayback machine will report a 'not found' error message.

* [OpenSolaris.org](https://web.archive.org/web/20090819174546/http://opensolaris.org/os/)
* [OpenSolaris Projects](https://web.archive.org/web/20090817114142/http://opensolaris.org/os/projects#portal)
* [OpenSolaris Communities](https://web.archive.org/web/20090605190426/http://opensolaris.org/os/communities/#portal)
* [OpenSolaris Documentation Style Guide](https://web.archive.org/web/20081207155129/http://opensolaris.org/os/community/documentation/files/OSOLDOCSG.pdf)
* [docs from www.opensolaris.org](https://web.archive.org/web/20090823064740/http://www.opensolaris.org/os/community/documentation/)
* [docs from hub.opensolaris.org](https://web.archive.org/web/20100909110451/http://hub.opensolaris.org/bin/view/Main/documentation)
* [What's new for OSOL 2010.03](https://web.archive.org/web/20110702071619/http://cr.opensolaris.org/~gman/opensolaris-whats-new-2010-03)
* [link to illumos graphics files](https://www.illumos.org/projects/site/files)
* [Getting Started With OpenSolaris 2008.11](https://web.archive.org/web/20110904232819/http://dlc.sun.com/osol/docs/downloads/minibook/en/820-7102-10-Eng-doc.pdf)
* [FreeBSD Documentation Project Primer for New Contributors](https://www.freebsd.org/doc/en_US.ISO8859-1/books/fdp-primer/)
* [OpenSolaris Learn site - Wayback Machine](https://web.archive.org/web/20091229232632/http://www.opensolaris.com/learn/)
* [OpenSolaris 2009.06 docs](https://web.archive.org/web/20100105080516/http://dlc.sun.com/osol/docs/content/2009.06/)
* [OpenSolaris 2009.06 Booklet PDF](https://web.archive.org/web/20100401024945/http://www.opensolaris.com/use/OpenSolaris200906Booklet.pdf)


## About OpenIndiana

Have a look at the following resources for ideas and inspiration for writing new content:

* [OpenSolaris FAQ](https://web.archive.org/web/20091001032442/http://www.opensolaris.com/learn/faq/)
* [OpenSolaris Newbie FAQ](https://web.archive.org/web/20090909080957/http://opensolaris.org/os/community/documentation/newbie_faq/)

TODO:

* Write a table where _included_ features of OpenIndiana are compared to _licensed_ features found in commercial software.
    * For example: Qemu-KVM | HyperV, Esxi, etc. , Zones | Docker, etc.
* Need to look at the legal aspects of mentioning trademarked names within documentation (to help keep openindiana out of trouble).
* Add a blurb about switching to hipster. See [link](http://wiki.openindiana.org/oi/Hipster#Hipster-switching)
* Link in download URL's for ISO's, etc.: See [release notes](http://wiki.openindiana.org/oi/2016.04+Release+notes)
* Write a table providing a matrix comparing commands between BSD/Linux/OpenIndiana.
    * This could also be something for the handbook.
    * Place it wherever it looks best.
* See [this page](https://wiki-bsse.ethz.ch/display/ITDOC/Major+difference+between+Linux+and+Solaris)
* Also can look at old OpenSolaris website for ideas, suggestions, etc.


## Handbook - Getting Started

Import first section of Wiki page: <http://wiki.openindiana.org/oi/Using+OpenIndiana+-+Technical+FAQ>

Have a look at the following resources for ideas and inspiration for writing new content:

* [OpenSolaris Automated Installer Guide](https://web.archive.org/web/20100401021842/http://www.opensolaris.com/use/Auto_Installer.pdf)
* [Linux Versus OpenSolaris](https://web.archive.org/web/20090824053055/http://opensolaris.org/os/project/czosug/events_archive/czosug_muni_20090228_OpenSolaris_and_Linux_Basic_Comparison.pdf)
* [IPS versus apt - from IPS guide](https://web.archive.org/web/20090924031858/http://dlc.sun.com/osol/docs/content/2009.06/IMGPACKAGESYS/giksz.html)
* System partitioning, Gparted, etc.
* Device Driver utility - (also how to manually install missing drivers - and where to find them if they are available)
* How to disable drivers at boot time
* Network install drivers: `pkgrecv -s http://pkg.openindiana.org/hipster-2015 -d bash.p5a -a bash && sudo pkg install -nv  -g bash.p5a bash`
* Local install drivers: `pkg install -g name.p5a fmri`


### Write some comparison tables

* Provide some contrast/comparisons between OI and other illumos distros.
* Provide some contrast/comparisons between OI and other BSD distros (PCBSD in relation to freebsd, etc.)
* Provide some contrast/comparisons between OI and Linux, etc. (Linux kernel and GNU userland, illumos kernel and GNU userland, etc.)
    * For an example, see: [this page](https://web.archive.org/web/20090904201802/http://wikis.sun.com/display/SolarisDeveloper/Migrating+from+Linux+to+Solaris+or+OpenSolaris)
* Command comparison tables – e.g. if such and such command does something on Linux, Windows, BSD, etc., use such and such command to do same thing on OI.
    * For some inspiration, see the tables found on the SmartOS Wiki.
    * Oracle might have some inspiration as well - (just don't copy it verbatim)


## Handbook - Common Tasks

### CUPS Printing

The Common UNIX Printing System (CUPS) has been selected as the default print service, replacing the LP print service, in OpenSolaris 2010.03.
CUPS support includes a web and graphical interface to manage your printing environment.
A system that is running CUPS becomes a host that can accept print requests from client systems, process those requests, and then send them to the appropriate printer.
To facilitate CUPS support, a new print-service command has been introduced that provides a mechanism for switching between CUPS print service and the LP print service, including 2 new SMF services.

Doc team Note: The guidance provided by the OSOL printing administration book is largely obsolete (but parts may still be valid) as CUPS replaced the old Solaris printing subsystem found in OpenSolaris 2009.06.
However, OpenIndiana has 2 print subsystems (CUPS and LP).
They are managed by the `print-service` command, which allows you to designate the active print subsystem.
See the print-services (1M) man page for more information.
In contrast, Oracle dropped lp completely in the Solaris 11.0 release.


## Handbook - Systems Administration

Have a look at the following resources for ideas and inspiration for writing new content:


Systems Admin Guides

* [Linux to Solaris Administrators Guide - PDF](https://web.archive.org/web/20100401023944/http://www.sun.com/software/solaris/sysadmin_guide.pdf)
* [OPENSOLARIS NETWORK ADMINISTRATION For Administrators Familiar with Linux - PDF](https://web.archive.org/web/20090806172933/http://www.opensolaris.com/use/network_administration.pdf)


SMF

* [smf(5) Frequently Asked Questions](https://web.archive.org/web/20090603223153/http://opensolaris.org/os/community/smf/faq)
* [another SMF FAQ](https://web.archive.org/web/20100826090402/http://home.arcor.de/bnsmb/public/htdocs/My_Little_SMF_FAQ.html)
* [OpenSolaris SMF Community](https://web.archive.org/web/20090602164813/http://opensolaris.org/os/community/smf/)


WIFI/NDIS

* [Solaris NDIS Wrapper Toolkit](https://web.archive.org/web/20100818053307/http://hub.opensolaris.org/bin/view/Community+Group+laptop/ndis)
* [Solaris Wireless FAQ](https://web.archive.org/web/20100915214450/http://hub.opensolaris.org/bin/view/Community+Group+laptop/Solaris-wireless-faq)


Zones

* [OpenSolaris Zones Community](https://web.archive.org/web/20090929063222/http://opensolaris.org/os/community/zones/)
* [Zones and Containers FAQ](https://web.archive.org/web/20100818014404/http://hub.opensolaris.org/bin/view/Community+Group+zones/faq)
* [Solaris Containers How To Guide](https://web.archive.org/web/20090228064414/http://www.sun.com/software/solaris/howtoguides/containersLowRes.jsp)


ZFS

* [OpenSolaris ZFS Community](https://web.archive.org/web/20091023025359/http://opensolaris.org/os/community/zfs/)
* [ZFS Frequently Asked Questions (FAQ)](https://web.archive.org/web/20100904084608/http://hub.opensolaris.org/bin/view/Community+Group+zfs/faq)
* [ZFS Resources](https://web.archive.org/web/20100830060952/http://hub.opensolaris.org/bin/view/Community+Group+zfs/links)



### ABI support

* Write about the change from Sun Studio to GCC its implications for ABI from previous Solaris releases/OpenSolaris, etc.
    * For more details, see: [http://openindiana.org/pipermail/oi-dev/2014-December/003496.html](http://openindiana.org/pipermail/oi-dev/2014-December/003496.html)
    * We might also want to talk about what other effects (if any) have/will result from the move to OI-Userland


### Write about Virtualization

* add a page about running OI as a virtual guest in Virtualbox, VMware, KVM, talk about which provides the best hardware support, guest tools compatibility, other caveats, etc.


## Handbook - Network Communications

Have a look at the following resources for ideas and inspiration for writing new content:


Comstar

* [COMSTAR info](http://web.archive.org/web/20090514083449/http://wikis.sun.com/display/OpenSolarisInfo/COMSTAR+Administration)


Crossbow

* [Crossbow info](https://web.archive.org/web/20090719072357/http://www.opensolaris.org/os/project/crossbow)


CIFS

* [HOW to INSTALL and SHARE a File System to CIFS Clients](https://web.archive.org/web/20100215043517/http://www.opensolaris.com/use/CIFS.pdf)
* [OpenSolaris CIFS Service](https://web.archive.org/web/20100818225731/http://wiki.genunix.org/wiki/index.php/OpenSolaris_CIFS_Service)


NFS

* [Basic NFS Configuration](https://web.archive.org/web/20100830065208/http://wiki.genunix.org/wiki/index.php/Basic_NFS_Configuration)
* [The Management of NFS Performance With Solaris ZFS](https://web.archive.org/web/20090803174610/http://developers.sun.com/solaris/articles/nfs_zfs.html)


IPFilter

* [ipfilter info](https://web.archive.org/web/20100620074943/http://coombs.anu.edu.au/~avalon/)
* [IP Filter FAQ](https://www.phildev.net/ipf/)


Rsync

* [Rsync on solaris Howto](https://web.archive.org/web/20100809145914/http://wiki.genunix.org/wiki/index.php/Rsync_on_Solaris_HOWTO)


### Installing OI onto an ISCSI exposed SCSI target

A good tutorial might be to write about installing OpenIndiana Hipster on an ISCSI target.

```bash
[14:50:02] <alp> does someone have some links on "installing OI on ISCSI" ?
[14:57:40] <tsoome> alp get to illumos wiki, open projects loader -> ideas, from there you get link for jeffpc iscsi experiment
[14:57:46] <tsoome> I did use it to play with ipxe+iscsi+loader
```

Also can look at Oracle docs for reference: [https://docs.oracle.com/cd/E26502_01/html/E29008/iscsi-1.html](https://docs.oracle.com/cd/E26502_01/html/E29008/iscsi-1.html)


## OpenSolaris Redistributable Books


* Review the OpenSolaris redistributable books.
* Determine the relevancy of each book in comparison to the current development state of OpenIndiana Hipster.
* Compose lists of errata as required.



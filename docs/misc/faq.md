<!--
The Original Documentation is _________________.

The Initial Writer of the Original Documentation is ___________ Copyright (C)_________[Insert year(s)]. All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): ______________________________________.

Portions created by ______ are Copyright (C)_________[Insert year(s)]. All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).
-->

<!--

TODO:

Write a table where _included_ features of OpenIndiana are compared to _licensed_ features found in commercial software.
- For example: Qemu-KVM | HyperV, Esxi, etc. , Zones | Docker, etc.
Need to look at the legal aspects of mentioning trademarked names within documentation (to help keep openindiana out of trouble).
- Also need to look at document licensing, whether to put licenses in the docs, etc.
Have a look at the "Newbie FAQ" from hub.opensolaris.org
- See: http://web.archive.org/web/20100111014254/http://hub.opensolaris.org/bin/view/Community+Group+documentation/newbie_faq
Add a blurb about switching to hipster. Link to :http://wiki.openindiana.org/oi/Hipster#Hipster-switching
- Link in download URL's for ISO's, etc.: See release notes:http://wiki.openindiana.org/oi/2016.04+Release+notes

-->

# The OpenIndiana FAQ

## What is OpenIndiana?

The OpenIndiana project is the open source community which develops, maintains, and supports the [OpenIndiana](https://en.wikipedia.org/wiki/OpenIndiana) distribution, an [Illumos](https://en.wikipedia.org/wiki/Illumos) based Unix-like operating system derived from OpenSolaris.
The purpose of the OpenIndiana Project is to ensure the continued availability of an openly developed distribution based on OpenSolaris.
The OpenIndiana project is also a continuation of the collaborative effort and community spirit of the [OpenSolaris project](https://en.wikipedia.org/wiki/OpenSolaris).

For a comprehensive history of the OpenSolaris project, see Jim Grisanzio's [OpenSolaris timeline](https://jimgrisanzio.wordpress.com/opensolaris/).

## Why is it called OpenIndiana?

OpenIndiana obtains its name from Project Indiana, an open source effort by Sun Microsystems (now Oracle Corporation) to produce OpenSolaris, a community developed Unix-like distribution based on Sun Solaris.
Project Indiana was led by Ian Murdock, founder of the Debian Linux Distribution.

## How are OpenIndiana and Illumos related?

The [Illumos project](https://illumos.org) is the open source community which develops, maintains, and supports [illumos-gate](https://github.com/illumos/illumos-gate), the core software used by the OpenIndiana distribution.
Similar to a BSD `src` tree, illumos-gate includes the illumos kernel, along with many of the device drivers, core libraries, and system utilities.

To form a complete distribution, the OpenIndiana project combines illumos-gate with [oi-userland](https://github.com/OpenIndiana/oi-userland), and with other free and open-source software.
This melding of software from many different open-source projects is similar to how Linux distributions use the Linux kernel along with software from the GNU and various other open source projects.

## How does OpenIndiana differ from OpenSolaris?

Some of the differences between OpenIndiana and OpenSolaris can be characterized as follows:

* Sun/Oracle's proprietary OS/NET consolidation has been replaced with [illumos-gate](https://github.com/OpenIndiana/illumos-gate).
* Many of the original OpenSolaris software consolidations have been reorganized into a single oi-userland consolidation.
* Oracle's Sun Studio has been replaced with the open source GNU GCC compiler.
* XVM (XEN) has been replaced with the illumos-kvm port.


<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
OpenIndiana Hipster's transition from Sun Studio to GCC has resulted in a discontinuance of ABI (binary) compatibility with previous releases of OpenIndiana, Oracle Solaris, and OpenSolaris.
Applications coded in the `C` language should continue to work normally.
Therefore, this change only affects applications written in the `C++` language.
</div>

## How does OpenIndiana compare to BSD or Linux?

<!--

TODO:

Write a table providing a matrix comparing commands between BSD/Linux/OpenIndiana.
See: https://wiki-bsse.ethz.ch/display/ITDOC/Major+difference+between+Linux+and+Solaris
Also can look at old OpenSolaris website for ideas, suggestions, etc.

-->

All of these operating systems follow the Unix paradigm and contain tools and commands which bear a similar resemblance, although specific feature sets and command usage may be dissimilar.
If you are coming to OpenIndiana from either BSD or Linux, you will quickly learn these differences.
In no time at all, you'll feel right at home working with OpenIndiana's tools and commands.


## What features does OpenIndiana have?

OpenIndiana contains the following enterprise class features and more:

| Feature | Description
| --- | ---
| ZFS | [ZFS File System and Volume Manager](https://en.wikipedia.org/wiki/ZFS)
| DTrace | [Dynamic Tracing Framework - (System Introspection)](https://en.wikipedia.org/wiki/DTrace)
| Crossbow | [Network Virtualization and Resource Control](https://en.wikipedia.org/wiki/OpenSolaris_Network_Virtualization_and_Resource_Control)
| SMF | [Service Management Facility](http://illumos.org/man/5/smf)
| FMA | [Fault Management Architecture](http://illumos.org/man/1M/fmd)
| COMSTAR |[Common Multiprotocol SCSI TARget - (ISCSI Target Framework)](http://illumos.org/man/1m/itadm)
| KVM | [Kernel Virtual Machine - (Operating System Virtualization)](https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine)
| Zones | [OS Level Virtualized Application Containers](https://en.wikipedia.org/wiki/Solaris_Containers)
| Time-Slider | [Automated ZFS Snapshots and Rollbacks](http://www.serverwatch.com/tutorials/article.php/3831881/Say-Cheese-OpenSolaris-Time-Slider.htm)
| RBAC | [Role-Based Access Control](http://www.c0t0d0s0.org/archives/4073-Less-known-Solaris-features-RBAC-and-Privileges-Part-1-Introduction.html)
| IPMP | [IP Network Multipathing](http://www.c0t0d0s0.org/archives/6292-Less-known-Solaris-features-IP-Multipathing-Part-1-Introduction.html)
| DLMP | [Data Link Multipathing](http://www.c0t0d0s0.org/archives/7553-Less-known-Solaris-Features-Data-Link-Multipathing.html)


## What is the OpenIndiana release schedule?

Approximately every six months, the OpenIndiana project releases a snapshot of the Hipster rolling release branch.
Ideally suited for both workstations and servers, simply choose the installer type which best serves your needs.

| Workstation | Server
| --- | ---
| Live installer (Gnome desktop) | Text installer (command line console)


<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">

* OpenIndiana releases from the legacy oi-dev-151x branch are no longer maintained.
* For those desiring to upgrade from legacy installations, Hipster IPS repositories are available.
* While upgrades from the legacy branch are possible, the most trouble free method is to perform a clean install.
</div>


<!-- CAUTION: --> <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i> **CAUTION:**
<div class="well">
Hipster is a rapid development branch where software versions are frequently updated.
While every package is tested to ensure stability, caution is nevertheless warranted when deploying Hipster into mission critical production environments.
</div>

## What are the recommended hardware specifications?

| CPU | Disk Space | Memory (RAM)
| --- | --- | ---
| 64 Bit | 20GB (or more) | 4GB (or more)


## Does OpenIndiana support internationalization and localization?

Yes, when installing OpenIndiana, you may choose from 47 different keyboard layouts and 22 different languages.


## Does OpenIndiana provide security and bug fixes?

Yes, absolutely.
For the actively maintained Hipster rolling release, the OpenIndiana project seeks to ensure all known flaws are quickly mitigated.
For this effort to succeed, we ask our user base to diligently bring security and bugfix concerns to our attention by submitting a ticket with the [OpenIndiana Bug Tracker](https://www.illumos.org/projects/openindiana/issues).


## Where can I download OpenIndiana Hipster?

* [Primary Mirror](http://dlc.openindiana.org/isos/hipster)
* [Vim.org Alternate Mirror](http://ftp.vim.org/os/openindiana.org/dlc/isos/hipster)
* [Torrents](http://ftp.vim.org/os/openindiana.org/dlc/isos/hipster)


If you wish to purchase a ready made DVD or USB drive there is also [OSDISC.COM](https://www.osdisc.com/products/solaris/openindiana).

<!-- CAUTION: --> <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i> **CAUTION:**
<div class="well">
OpenIndiana Hipster does not yet support USB 3.0.

* When attaching backward compatible USB 3.0 devices to your system, please ensure they are *NOT* attached to a USB 3.0 port.
</div>

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
At this time, creating a bootable flash drive requires the use of a header file.

- There are 2 unique USB header files (1G and 2G).
- Please ensure you have selected the correct file.
    - The 1G.header is only suitable for use with the text installer (Command line console).
    - The 2G.header is only suitable for use with the live installer (Gnome desktop).
    - The files are *NOT* interchangeable.

Failure to use the correct USB header file can result in the USB drive either failing to boot, or only partially booting (and falling back to systems maintenance mode with KSH93 errors).
</div>

For further information about how to create a bootable OpenIndiana flash drive, consult the [OpenIndiana Handbook](../handbook/handbook.md#creating-a-bootable-openindiana-usb-flash-drive).

## What package manager does OpenIndiana use?

OpenIndiana uses the network based [Image Packaging System (IPS)](https://en.wikipedia.org/wiki/Image_Packaging_System).
For those coming to OpenIndiana from BSD or Linux, the IPS package manager will be an easy transition.
You may also continue to use the legacy `pkgadd/pkgrm` commands.

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
The OpenIndiana distribution provides a basic set of packages, along with some extras.
There are also 3rd party repositories which provide additional packages.
If you wish to contribute by helping to expand package availability, please read further down about how to get involved with the OpenIndiana project.
</div>

The following IPS repositories are available:

| Repository Name | Repository URL | Description
| --- | --- | ---
| openindiana.org | <http://pkg.openindiana.org/hipster> | Hipster primary package repository
| hipster-encumbered | <http://pkg.openindiana.org/hipster-encumbered>| Hipster encumbered license packages
| localhostoih | <http://sfe.opencsw.org/localhostoih> | 3rd party [Spec Files Extra (SFE)](http://sfe.opencsw.org) packages


### Adding a new publisher

`pkg set-publisher -g repository_url repository_name`

### Changing an existing publisher

```bash
pkg set-publisher \
-G http://pkg.openindiana.org/hipster-2015 \
-g http://pkg.openindiana.org/hipster openindiana.org
```

For further information consult the [OpenSolaris Image Packaging System Guide](http://www.linuxtopia.org/online_books/opensolaris_2008/IMGPACKAGESYS/html/docinfo.html) as well as the pkg(1) man page included with OpenIndiana Hipster.


## What books are available to help with learning OpenIndiana?

There are several resources which will assist you with learning to use OpenIndiana.
While somewhat dated now, these resources are largely still relevant.

* [Pro OpenSolaris](http://www.bookfinder.com/search/?keywords=1430218916&new=&used=&ebooks=&classic=&lang=en&st=sh&ac=qr&submit=)
    * A gentle and well written introduction to OpenSolaris. It weighs in at 250 pages.

* [OpenSolaris Bible](http://www.bookfinder.com/search/?keywords=0470385480&new=&used=&ebooks=&classic=&lang=en&st=sh&ac=qr&submit=)
    * A much larger and more comprehensive reference book of nearly 1000 Pages.

* [The illumos bookshelf](https://illumos.org/books/)
    * Updated for illumos, the illumos bookshelf consists of several original OpenSolaris advanced administration and development titles.

* [OpenSolaris 2008 Docs](http://www.linuxtopia.org/online_books/opensolaris_2008/index.html)
    * Originally released by the OpenSolaris project, this collection consists of over 40 titles ranging from development to systems administration.


<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
In late 2009, the OpenSolaris project released a newer version of the OpenSolaris book collection.

An effort currently exists within the OpenIndiana community to revise and condense these titles into a more streamlined collection which more closely follows the development state of OpenIndiana Hipster.

The documentation team is also working to produce an updated OpenIndiana handbook as well as task based tutorials.
If you wish to participate in this effort, please indicate your interest via the IRC channels or the mailing lists.
</div>


## How do I get involved with the OpenIndiana Project?

As a community supported open source software project, the success and future of OpenIndiana depends entirely on you.
While the most important thing is to download and begin using OpenIndiana, there are many different ways to contribute.
Tell your friends and coworkers about OpenIndiana as well, and don't forget to report all issues to our bug tracker.

Below is a list of OpenIndiana community resources you may find helpful:

| Resource | URL
| --- | ---
| User Support IRC channel | [#openindiana on irc.freenode.net](irc://irc.freenode.net/openindiana)
| Development IRC channel | [#oi-dev on irc.freenode.net](irc://irc.freenode.net/oi-dev)
| Documentation IRC channel | [#oi-documentation on irc.freenode.net](irc://irc.freenode.net/oi-documentation)
| OpenIndiana Mailing Lists | <http://openindiana.org/mailman>
| OpenIndiana Wiki | <http://wiki.openindiana.org>
| OpenIndiana Bug Tracker | <http://www.illumos.org/projects/openindiana/issues>

Here are just some of the many ways you may contribute:

* Artwork
* Development
* Documentation - Handbook, Tutorials, News articles, etc.
* Evangelism - blogging about OpenIndiana, attending conferences, etc.
* Packaging - oi-userland, 3rd party packaging (SFE, etc.)
* Release engineering
* Translation
* Utilities maintenance
* Website Maintenance

Just ask on the IRC channels or mailing lists about how you may contribute.

For additional details, including links to our GitHub source repositories, please see: <http://www.openindiana.org/community/getting-involved>


## Does OpenIndiana provide a SPARC release?

OpenIndiana Hipster is not currently available for the SPARC platform.

In regards to the creation of a SPARC port of OpenIndiana Hipster, there have been periodic discussions on the [OpenIndiana mailing lists](http://openindiana.org/mailman/listinfo).
If you would like to see SPARC become a supported platform, please help us by joining the [OpenIndiana community](http://www.openindiana.org/community/getting-involved).

### Historical SPARC releases

In 2009, the OpenSolaris project released an [OpenSolaris text install ISO](http://dlc.openindiana.org/isos/opensolaris), and much more recently, there was work done by Adam Glasgall who produced an [unofficial SPARC text install ISO](http://neutron-star.mit.edu/OpenIndiana_Text_SPARC.iso) based on oi-dev-151-a8.

### illumos distributions with SPARC releases

The following illumos based distributions are known to support the SPARC platform:

* [Dilos](http://www.dilos.org/download)
* [OpenSCXE](http://opensxce.org)
* [Tribblix](http://www.tribblix.org/download.html)

### Commercial distributions with SPARC releases

For production use on modern SPARC hardware, there is also commercial [Oracle Solaris](https://www.oracle.com/solaris/solaris11/index.html)


## What are the licensing terms for OpenIndiana?

OpenIndiana is composed of software from multiple different sources, each with its own licensing terms.

Here is a list of the most commonly used licenses:

* [Common Development and Distribution License (CDDL-1.0)](https://opensource.org/licenses/CDDL-1.0)
* [PUBLIC DOCUMENTATION LICENSE (PDL), Version 1.01](http://illumos.org/license/PDL)
* [The MIT License (MIT)](https://opensource.org/licenses/MIT)
* [The BSD 2-Clause License](https://opensource.org/licenses/BSD-2-Clause)
* [GNU licenses](http://www.gnu.org/licenses/licenses.en.html)

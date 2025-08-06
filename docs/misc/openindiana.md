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

# About OpenIndiana

## What is the OpenIndiana Operating System?

OpenIndiana is an advanced enterprise OS from the Sun branch of the Unix-like family tree, and as such it can sometimes seem quite complex (_Spending several decades running important servers can do that to an OS!_).
But with a little help and information, once you know the basics, you'll find it actually has some of the nicest and friendliest tools around.
As with most Unix-like operating systems it can be completely controlled via a Command Line Interface shell, but it also supports a windowing GUI system.

From the CLI, it supports a number of different shells, the two main ones being ksh93 and Bash.
It also supports the original [SunOS](http://en.wikipedia.org/wiki/SunOS) [SVR4](http://en.wikipedia.org/wiki/SVR4#SVR4) commands, Like the command and syntax familiar to BSD users, and a large portion of the GNU userland commands that most Linux users are familiar with.
You can select any or all of those different commands from your shell configuration, giving you the environment you are most happy with.

By default, the windowing GUI system is based on the popular Mate system.

OpenIndiana also has a powerful package manager, IPS, for updating and installing new software.
Although powerful, it may seem complicated at first; but, help is provided in these pages.

OpenIndiana supports a wide range of popular software, including the main open source Internet server software, databases, Internet client software, development languages and tools and more.
The Popular Software provides some links and notes about some of the community favorites, but many more are supported.
In addition to the Hipster IPS repositories, OpenIndiana can also use the [SFE](http://sfe.opencsw.org/) and [pkgsrc](https://pkgsrc.smartos.org/) package repositories which provide additional software options.


## What is OpenIndiana Project?

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

* Sun's OS/NET consolidation (closed by Oracle) has been replaced with [illumos-gate](https://github.com/OpenIndiana/illumos-gate).
* Many of the original OpenSolaris software consolidations have been reorganized into a single oi-userland consolidation.
* Oracle's Sun Studio has been replaced with the open source GNU GCC compiler.
* XVM (XEN) has been replaced with the illumos-kvm port.

<div class="note" markdown="1">
!!! note
    OpenIndiana Hipster's transition from Sun Studio to GCC has resulted in a discontinuance of C++ ABI compatibility with previous releases of OpenIndiana, Oracle Solaris, and OpenSolaris.
</div>

## How does OpenIndiana compare to BSD or Linux?

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
| Time-Slider | [Automated ZFS Snapshots and Rollbacks](https://web.archive.org/web/20160420090032/http://www.serverwatch.com/tutorials/article.php/3831881/Say-Cheese-OpenSolaris-Time-Slider.htm)
| RBAC | [Role-Based Access Control](http://www.c0t0d0s0.org/2008-02-04/less-known-solaris-features-rbac-and-privileges-part-1-introduction.c0t0d0s0)
| IPMP | [IP Network Multipathing](http://www.c0t0d0s0.org/2010-01-21/less-known-solaris-features-ip-multipathing-part-1-introduction.c0t0d0s0)
| DLMP | [Data Link Multipathing](http://www.c0t0d0s0.org/2013-03-21/less-known-solaris-features-data-link-multipathing.c0t0d0s0)


## What is the OpenIndiana release schedule?

Approximately every six months, the OpenIndiana project releases a snapshot of the Hipster rolling release branch.
Ideally suited for both workstations and servers, simply choose the installer type which best serves your needs.

| Workstation | Server
| --- | ---
| Live installer (Gnome desktop) | Text installer (command line console)

<div class="note" markdown="1">
!!! note
    * The legacy oi-dev-151x branch is no longer maintained.
    * While upgrades to Hipster are possible, the most trouble free method is to perform a clean install.
</div>

<div class="caution" markdown="1">
!!! danger "Caution"
    Hipster is a rapid development branch where software versions are frequently updated.
    While every package is tested to ensure stability, caution is nevertheless warranted when deploying Hipster into mission critical production environments.
</div>

## What are the recommended hardware specifications?

| CPU | Disk Space | Memory (RAM)
| --- | --- | ---
| 64 Bit | 20GB (or more) | 2GB (or more)

<div class="note" markdown="1">
!!! note
    * For the best performance (and to reduce the possibility of disk swapping), allocate 4GB RAM or more.
    * For desktops, ensure total system memory (RAM + swap) are at least 4GB or greater.
    * The default size of the OpenIndiana swap file is 50% of installed memory.
        * Minimum and maximum default swap allocations are 512MB and 32GB respectively.
</div>

## Does OpenIndiana support internationalization and localization?

Yes, when installing OpenIndiana, you may choose from 47 different keyboard layouts and 22 different languages.


## Does OpenIndiana provide security and bug fixes?

Yes, absolutely.
For the actively maintained Hipster rolling release, the OpenIndiana project seeks to ensure all known flaws are quickly mitigated.
For this effort to succeed, we ask our user base to diligently bring security and bugfix concerns to our attention by submitting a ticket with the [OpenIndiana Bug Tracker](https://www.illumos.org/projects/openindiana/issues).


## Where can I download OpenIndiana Hipster?

Primary download mirror (London, England):

* [ISO's and USB Images](http://dlc.openindiana.org/isos/hipster)
* [Torrents](http://dlc.openindiana.org/torrents)

Alternate mirrors (Asia, Europe, and North America)

* [OpenIndiana Mirrors](../handbook/openindiana-download-mirrors.md)


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="card card-body bg-light">
For detailed information about creating a bootable OpenIndiana DVD or USB flash drive, please consult the following sections of the OpenIndiana Handbook:

* [Creating a bootable OpenIndiana DVD](../handbook/getting-started.md#creating-a-bootable-openindiana-dvd)
* [Creating a bootable OpenIndiana USB flash drive](../handbook/getting-started.md#creating-a-bootable-openindiana-usb-flash-drive)
</div>


## What package manager does OpenIndiana use?

OpenIndiana uses the network based [Image Packaging System (IPS)](https://en.wikipedia.org/wiki/Image_Packaging_System).
For those coming to OpenIndiana from BSD or Linux, the IPS package manager will be an easy transition.
You may also continue to use the legacy `pkgadd/pkgrm` commands.

<div class="note" markdown="1">
!!! note
    The OpenIndiana distribution provides a basic set of packages, along with some extras.
    There are also 3rd party repositories which provide additional packages.
    If you wish to contribute by helping to expand package availability, please read further down about how to get involved with the OpenIndiana project.
</div>

The following IPS repositories are available:

| Repository Name | Repository URL | Description
| --- | --- | ---
| openindiana.org | <https://pkg.openindiana.org/hipster> | Hipster primary package repository
| hipster-encumbered | <https://pkg.openindiana.org/hipster-encumbered>| Hipster encumbered license packages
| localhostoih | <http://sfe.opencsw.org/localhostoih> | 3rd party [Spec Files Extra (SFE)](http://sfe.opencsw.org) packages


### Adding a new publisher

`pkg set-publisher -g repository_url repository_name`

### Changing an existing publisher

```bash
pkg set-publisher \
-G http://pkg.openindiana.org/hipster-2015 \
-g https://pkg.openindiana.org/hipster openindiana.org
```

For further information about using the IPS `pkg` command consult the [Getting Started](../handbook/getting-started.md#the-image-package-system-ips) section of the OpenIndiana Handbook as well as the pkg<sup>1</sup> man page included with OpenIndiana Hipster.


## What books are available to help with learning OpenIndiana?

There are several resources which will assist you with learning to use OpenIndiana.
While somewhat dated now, these resources are largely still relevant.

* [Pro OpenSolaris](http://www.bookfinder.com/search/?keywords=1430218916&new=&used=&ebooks=&classic=&lang=en&st=sh&ac=qr&submit=)
    * A gentle and well written introduction to OpenSolaris. It weighs in at 250 pages.

* [OpenSolaris Bible](http://www.bookfinder.com/search/?keywords=0470385480&new=&used=&ebooks=&classic=&lang=en&st=sh&ac=qr&submit=)
    * A much larger and more comprehensive reference book of nearly 1000 Pages.

* [The illumos bookshelf](https://illumos.org/books/)
    * Updated for illumos, the illumos bookshelf consists of several original OpenSolaris advanced administration and development titles.

* [OpenSolaris 2009.06 Docs](../books/about.md)
    * Originally released by the OpenSolaris project, this collection consists of over 40 titles ranging from development to systems administration.

<div class="note" markdown="1">
!!! note
    An effort currently exists within the OpenIndiana community to review these books and provide errata.
    A longer term goal is to use the errata to revise and condense these titles into a significantly smaller collection which more closely follows the current development state of OpenIndiana Hipster.

    The documentation team is also working to produce an updated OpenIndiana handbook as well as task based tutorials.
    If you wish to participate in this effort, please indicate your interest via the IRC channels or the mailing lists.
</div>

## How can I contact OpenIndiana community?

There are several IRC channels and mailing lists, where you can discuss OpenIndiana and ask your questions to the wider community.

Below is a list of OpenIndiana community resources you may find helpful:

| Resource | URL
| --- | ---
| General Discussion IRC channel | [#openindiana on irc.libera.chat](irc://irc.libera.chat/openindiana)
| Development IRC channel | [#oi-dev on irc.libera.chat](irc://irc.libera.chat/oi-dev)
| General OpenIndiana Discussion Mailing List | <https://openindiana.org/mailman/listinfo/openindiana-discuss>
| OpenIndiana Development Mailing List | <https://openindiana.org/mailman/listinfo/oi-dev>
| illumos Mailing Lists | <https://illumos.org/docs/community/lists/>
| OpenIndiana Bug Tracker | <https://www.illumos.org/projects/openindiana/issues>
| illumos Bug Tracker | <https://www.illumos.org/projects/illumos-gate/issues>

## How do I get involved with the OpenIndiana Project?

OpenIndiana is a community-based project, it relies on contributions from the community.
There are different aspects of the project and opportunities to contribute.

Below is a brief overview of different ways to get involved in the project.
In addition, there is a more specific [list of existing tasks](../dev/existing-tasks.md).
If you are interested in working in one of these areas or if you have further questions please do not hesitate to get in touch with us.

Our small community is always happy to welcome new users and contributors:

* present yourself so we get to know each other,
* ask all the questions you have in mind,
* report anything that seems unclear to you,
* share any project idea you would like to develop.

Overview of recurring technical tasks at the OpenIndiana Project

* Maintaining packages to [OpenIndiana itself](../dev/building-openindiana.md) or to additional software repositories, like [SFE](http://sfe.opencsw.org/).
* Release management and testing.
* Developing code specific to OpenIndiana.
* Bug fixing and bugs triage, QA
* Project infrastructure maintenance, coordination with mirrors.
* Operating mirrors.
* Monitoring and handling security issues.
* Website and wiki maintenance

There are also non-technical ways to contribute:

* [Reporting issues](https://www.illumos.org/projects/openindiana/issues) you find.
* Create artwork for OpenIndiana.
* [Writing documentation](../contrib/getting-started.md) or just blogging about OpenIndiana.
* Maintaining translations of OI-specific software and documentation.

Just ask on the [IRC channels or mailing lists](#how-can-i-contact-openindiana-community) about how you may contribute.

## Does OpenIndiana provide a SPARC release?

OpenIndiana Hipster is not currently available for the SPARC platform.

In regards to the creation of a SPARC port of OpenIndiana Hipster, there have been periodic discussions on the [OpenIndiana mailing lists](https://openindiana.org/mailman/listinfo).
If you would like to see SPARC become a supported platform, please help us by joining the [OpenIndiana community](https://www.openindiana.org/community/getting-involved).

### Historical SPARC releases

In 2009, the OpenSolaris project released an [OpenSolaris text install ISO](http://dlc.openindiana.org/isos/archive/opensolaris), and much more recently, there was work done by Adam Glasgall who produced an [unofficial SPARC text install ISO](http://neutron-star.mit.edu/OpenIndiana_Text_SPARC.iso) based on oi-dev-151-a8.

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

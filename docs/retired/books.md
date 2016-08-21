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

# The OpenSolaris Redistributable Books

The 2009.09.15 docs drop consists of 41 books organized into several different collections.
Obviously maintaining 41 different titles is no easy matter.
Therefore, the number one thing we can do to improve the books is to consolidate them into a more manageable set of fewer volumes.
In reviewing these books, there looks to be some crossover between titles.
For example, it might be possible to merge the Solaris Express collection into the Systems Administration collection, etc.


## Current Situation

The source code used for the redistributable books is Solbook XML 3.5 (and in some cases Solbook XML 3.6).

* Solbook is a creation of Sun Microsystems and is a simplified subset of Docbook.
* We have a conversion tool (written in JAVA) which can handle the conversion of Solbook XML 3.5 to HTML 4.5, but we do not have DTD's for any other XML versions (e.g 3.6).
* Assuming the differences between the XML versions are not too great, we might be able to trick the java conversion tool by simply changing the version number within the DTD.
    * This is speculative and not yet been tried.

Its unclear whether the books found in the 2009.09.15 drop are inclusive of all the 2008.11 books.

* Some of the titles are different.
* We have the source for the 2009.06 books, but not for the 2008.11 books.

## Challenges for working with the OpenSolaris Books

Solbook XML is difficult to work with.

* Hard to read
* Hard to edit
* Requires validation after editing
* Not supported by modern WYSIWIG XML editors
* The Solbook to html conversion tool is broken (indexing does not work).
* Conversion of the books is a manual process.
* We have no automated way to maintain these books (no automated continuous integration toolchain exists).

The OpenSolaris books are full of broken links.

* The books all reference each other (and other non-opensource books) using the original SUN hosted URL's.
* Even the books revised by the illumos project have broken links (thus also need some love).

There are additional challenges.

* The books have difficult to decipher folder and xml file names.
* Many of the books consist of dozens and dozens of separate xml files.
* The books are not particularly mobile friendly.
* In regard to the factual correctness of the documentation, do we ourselves even know what still works, doesn't work, has been deprecated, replaced, etc.?

## Future Direction

We should consider converting the OpenSolaris books to some kind of simple and easy to read text based markup (e.g. ASCIIDOC, Restructured Text, Markdown, etc.).

* Using a text based markup would greatly lower the bar for working on the books.
* For books for which we do not have the XML source, perhaps pandoc can be used to reconvert the HTML back to text markup.

We need to create a fully automated toolchain with the following features:

* Source code stored on GitHub.
* Commit hooks kick off an automated build (conversion to HTML5) and deployment of the books to their public location.
   * We need to determine where to host the books - (e.g. OI website, Github pages, readthedocs.com, etc.)
* The docs maintenance process needs to be documented itself.

Another consideration is printing.

* There should be printer friendly CSS used with the HTML pages.

We need to eat our own dog food.

* The entire editing and build process should be capable of being performed on multiple platforms, including OpenIndiana.

## What are Other Projects Doing?

In a nutshell, the trend is a move away from CMS systems.

* With recent advances in _mobile friendly_ dynamic CSS frameworks and static HTML website _baking_ tools, the future looks to be static HTML5.
* Some projects (such as Jenkins) make no distinction between documentation and the rest of their web content.
Everything is treated equally and managed using the very same tools.

### PC-PCD

* The PC-BSD project looks to be hosting their website on a CMS (Wordpress).
* The project uses the python based Sphinx documentation framework (which uses the Restructured Text markup language).
* Documentation is self hosted (though most projects using Sphinx host using [Read The Docs](https://readthedocs.org/)).

### Jenkins

* The Jenkins project is composed entirely of static HTML5 and uses Awestruct to _bake_ their website.
* Their CSS framework is either Bootstrap, Foundation, or possibly even custom fabricated (it's not clear how they're doing it).
* Asciidoctor is their markup language for all content (docs, blog posts, news, etc.).
* All content is hosted on GitHub and continuous integration (automated build and deploy) is presumably via their own Jenkins CI.

### FreeBSD

* It's unclear how the FreeBSD project is hosting their website.
Given the website's responsiveness, there is a good chance they're hosting static HTML.
* For documentation, the FreeBSD project uses Docbook 5 along with a semi-automated XML toolchain to validate and convert the source code to other formats.
* The FreeBSD project hosts their Docbook 5 XML source in a single subversion repository where you check out the entire project.
* Similar to the Jenkins project, there is a good chance the FreeBSD project makes no distinction between their docs and other content.
* For more details of the FreeBSD docs process, see: <https://www.freebsd.org/doc/en_US.ISO8859-1/books/fdp-primer/index.html>


## Book Titles - 2009.09.15 OpenSolaris Docs Consolidation

**NOTE**
Some of these titles may have newer versions than what shipped as part of this consolidation.
The OpenSolaris project had a development directory which contained a handful of the titles.
For more information, see: <https://web.archive.org/web/20090415234443/http://dlc.sun.com/osol/docs/content/dev/>


We have the XML source for these books.

* Application Packaging Developer's Guide
* Device Driver Tutorial
* Image Packaging System Guide
* Getting Started With OpenSolaris
* Managing Boot Environments
* Memory Thread Placement and Optimization Developer's Guide
* OpenSolaris Automated Installer Guide
* OpenSolaris Developer's Reference Guide
* OpenSolaris Distribution Constructor Guide
* Solaris CIFS Administration Guide
* Solaris Containers: Resource Management and Solaris Zones Developer's Guide
* Solaris Dynamic Tracing Guide
* Solaris Express Developer Edition Installation Guide: Laptop Installations
* Solaris Express Developer Edition Release Notes
* Solaris Express Developer Edition What's New
* Solaris Express Installation Guide: Solaris Flash Archives (Creation and Installation)
* Solaris Express Installation Guide: Basic Installations
* Solaris Express Installation Guide: Custom JumpStart and Advanced Installations
* Solaris Express Installation Guide: Network-Based Installations
* Solaris Express Installation Guide: Planning for Installation and Upgrade
* Solaris Express Installation Guide: Solaris Live Upgrade and Upgrade Planning
* Solaris Express Package List
* Solaris Modular Debugger Guide
* Solaris Trusted Extensions Administrator's Procedures
* Solaris Trusted Extensions Developer's Guide
* Solaris Trusted Extensions Installation and Configuration Guide
* Solaris Trusted Extensions Label Administration
* Solaris Trusted Extensions Transition Guide
* Solaris Trusted Extensions User's Guide
* Solaris Tunable Parameters Reference Manual
* Solaris Volume Manager System Administration Guide
* System Administration Guide: Advanced Administration
* System Administration Guide: Basic Administration
* System Administration Guide: Devices and File Systems
* System Administration Guide: IP Services
* System Administration Guide: Naming and Directory Services (DNS, NIS, and LDAP)
* System Administration Guide: Network Services
* System Administration Guide: Security Services
* System Administration Guide: Solaris Containers--Resource Management and Solaris Zones
* System Administration Guide: Solaris Printing
* Writing Device Drivers
* ZFS Administration Guide

## Book Titles - OpenSolaris 2008.11 Docs Consolidation

We do not have the xml source code, nor the HTML for these books.
Further information can be found on Archive.org (wayback machine).

* [2008.11 OpenSolaris Docs](https://web.archive.org/web/20110812020753/http://dlc.sun.com/osol/docs/content/2008.11/)

* Another link to the same 2008 books: <http://www.linuxtopia.org/online_books/opensolaris_2008/>


## A full list of the 2008.11 books with separate links to each directory:

* [OpenSolaris 2008.11 Automated Installer Guide](https://web.archive.org/web/20090711142146/http://dlc.sun.com/osol/docs/content/2008.11/AIinstall/docinfo.html)

* [OpenSolaris 2008.11 COMSTAR Administration Guide](https://web.archive.org/web/20090207062303/http://dlc.sun.com/osol/docs/content/2008.11/COMSTARADMIN/docinfo.html)

* [OpenSolaris 2008.11 Distribution Constructor Guide](https://web.archive.org/web/20101103075914/http://dlc.sun.com/osol/docs/content/2008.11/DistroConst/)

* [OpenSolaris 2008.11 Image Packaging System Guide](https://web.archive.org/web/20090530123921/http://dlc.sun.com/osol/docs/content/2008.11/IMGPACKAGESYS/docinfo.html)

* [OpenSolaris 2008.11 Media Management System Administration Guide](https://web.archive.org/web/20110814192736/http://dlc.sun.com/osol/docs/content/2008.11/MEDIACAG/)

* [OpenSolaris 2008.11 Development Environment Guide](https://web.archive.org/web/20090215194657/http://dlc.sun.com/osol/docs/content/2008.11/OSDEV/docinfo.html)

* [OpenSolaris 2008.11 System Administration Guide](https://web.archive.org/web/20090207094506/http://dlc.sun.com/osol/docs/content/2008.11/SYSADV0/)

* [OpenSolaris 2008.11 Managing Boot Environments](https://web.archive.org/web/20100207034244/http://dlc.sun.com/osol/docs/content/2008.11/snapupgrade/docinfo.html)

* [Introduction to the OpenSolaris 2008.11 Release](https://web.archive.org/web/20090429214954/http://dlc.sun.com/osol/docs/content/2008.11/getstart/docinfo.html)


## Other OpenSolaris Books

* [Open HA Cluster 2009.06 Collection](https://web.archive.org/web/20100123170801/http://docs.sun.com/app/docs/coll/2509.1)

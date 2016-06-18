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

# Content Management - The BSD Approach


Here we take a quick look at PC-BSD and FreeBSD projects and examine their approaches to content management.

## Examining the BSD Websites and Handbooks


### PCBSD

#### Website

* website: <http://www.pcbsd.org/>
* Well laid out, clutter free.
* Download buttons are present right on home page.
* Hosted on WordPress

#### Handbook

* handbook: <http://web.pcbsd.org/doc-archive/10.2/html/pcbsd.html>
* Nice intuitive navigation pane on left side - (Newer versions allow navigation pane to be toggled out of the way)
* Clutter free as it only shows one section at a time.
* Lots of color, bold text, large fonts, lots of screen shots, etc.
* Breadcrumbs on top, but not on bottom.
* example of their handbook page source: <http://web.pcbsd.org/doc-archive/10.2/html/_sources/install.txt>
* Very simple [reStructuredText markup](http://docutils.sourceforge.net/rst.html) - Similar to ASCIIDOC or Creole


### FreeBSD

#### Website

* website - <https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/>
* well defined and well organized navigational dropdowns
* Lots of color used to delineate one piece of information from another
* Very consistent style used throughout entire website

#### Handbook

* Handbook - <https://www.freebsd.org/doc/handbook/book.html>
* Red text used for hyperlinks
* gray boxes used to delineate columns of information from each other.
* Each page has it's own navigational breadcrumbs (top and bottom, left and right)


## What can we learn from this?

### The BSD Websites

* Both of the BSD websites are very fresh and modern.
* Navigation is very straightforward and intuitive.
* Information is clearly delineated.
* Clutter free.
* Neither project is using a wiki, rather all content is served from the same location.


### PCBSD Handbook

* The PCBSD Project is using [Sphinx](http://www.sphinx-doc.org/en/stable/index.html) for their handbook.
* Python Project also uses restructuredtext based Sphinx for their documentation (you'll notice the similarities).
* Skill level required for contributing to docs project is much lower than it would be for docbook
* The PCBSD handbook is searchable (Sphinx uses several javascripts to do this).
* The PCBSD Handbook is hosted as static HTML.

### FreeBSD Handbook

* The FreeBSD Project is using [Docbook](http://www.docbook.org/) for their handbook.
* Sun used solbook (derived from docbook).
Redhat most likely uses Docbook as well.
* Skill level required to contribute to docs project is somewhat higher than it would be for restructuredtext based Sphinx.
* The FreeBSD handbook is not searchable.
* The FreeBSD Handbook is hosted as static HTML.


### Handbook TOC Structure used by PC-BSD


* Introduction
* Pre-Installation Tasks
* Installing PC-BSD
* Post Installation Configuration and Installation Troubleshooting
* Advanced Installation Topics
* Desktops
* Installing Applications and Keeping PC-BSD® Updated
* Control-Panel
* Using PC-BSD®
* Finding Help
* Supporting PC-BSD®


### Handbook TOC Structure used by Free-BSD


#### Getting Started

* Introduction
* Installing FreeBSD
* Unix Basics
* Installing Applications - Packages and Ports
* The X-Window System


#### Common Tasks

* Desktop Applications
* Multimedia
* Configuring the FreeBSD Kernel
* Printing
* Linux Binary Compatibility


#### System Administration

* Configuration and Tuning
* FreeBSD Boot Process
* Security
* Jails
* Mandatory Access Control
* Security Event Auditing
* Storage
* GEOM
* The Z File system
* Virtualization
* Localization
* Updating and Upgrading
* Dtrace


#### Network Communications

* Serial communications
* PPP
* Electronic mail
* Network servers
* Firewalls
* Advanced networking



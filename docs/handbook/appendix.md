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

# Appendix

<div class="note" markdown="1">
!!! note
    This is a **DRAFT** document which may contain errors!

    Help us improve and expand this site.

    Please see the **Contrib** section for more details about joining the OpenIndiana Documentation Team.
</div>

< place holder for introduction content >

## Glossary

| Term | Definition
| --- | ---
| Boomer | The code name for the audio driver framework used by OpenIndiana. Its application interface is Open Sound System (OSS) 4 compatible.
| Consolidation | A collection of related software which has the scope of a project, historically developed by a dedicated team. OpenIndiana is composed of many consolidations.
| g11n | Internationalization and localization consolidation.
| illumos | A community maintained derivative of the OpenSolaris OS/NET (ON) source which contains core operating system components, including the kernel, drivers, and basic userland.
| oi-userland | A new OpenIndiana consolidation which pulls together many of the old legacy consolidations. This new consolidation greatly simplifies the development of OpenIndiana.
| SFE | Spec Files Extra - External 3rd party IPS repository
| XNV | The X-Windows consolidation.

## Finding Help and Support

< Place Holder for section Introduction Content >


### Local system command line help

* apropos - search the manual page names and descriptions
    * Used to find keywords in man pages
* find - search for files in a directory hierarchy
* info - read Info documents
    * A viewer for GNU info pages
* locate - find files by name
    * Uses the mlocate database to find files and folders
* man - an interface to the on-line reference manuals (man pages)
    * To pipe the output of a man page to a text file use the command: `man [manpage] | col -x -b > [filename].txt`.
    * For example: `man pkg | col -x -b > pkg.txt`

## IPS Command Matrix

| Task | IPS Command | apt Equivalent
| --- | --- | ---
| Install a package | `pkg install` | `apt install`
| Uninstall a package | `pkg uninstall` | `apt remove`
| Update all packages | `pkg update` | `apt upgrade`
| Search for a package | `pkg search` | `apt search`
| Display installed packages | `pkg list` | `apt list`
| Display package information | `pkg info` | `apt show`
| Display package contents | `pkg contents` | `dpkg-query -L`
| Display publisher information | `pkg publisher` | `cat /etc/apt/sources.list.d/*`
| Add or update a publisher | `pkg set-publisher` | edit `/etc/apt/sources.list.d/*` files
| Remove a publisher | `pkg unset-publisher` | edit `/etc/apt/sources.list.d/*` files


## Developing with OpenIndiana

<div class="info" markdown="1">
!!! info "Documentation Team"
    The book titled "Introduction to Operating Systems: A Hands-On Approach Using the OpenSolaris Project" may be a good resource for helping to complete this part of the handbook.

    Questions to ask:

    * How can OI be used as a development platform?
    * What programming tools, languages, etc., are available?
    * How can OI be used to further the development of OI itself?
</div>

## Software Development Testing

<div class="info" markdown="1">
!!! info "Documentation Team"
    Need to add some guidance about how to add a test repo to test specific packages, etc.

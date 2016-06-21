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

# Topics to write about

The goal of this page is to provide a TODO list of things which need to be documented.
Topics will be organized first by page and then by topic.

The second level headers will indicate the page.
Third level headers will indicate topics, etc.

It might be easier to first populate this page with 3rd level subject headers and then later come back and assign pages.

## FAQ

Have a look at the [OpenSolaris FAQ](https://web.archive.org/web/20091001032442/http://www.opensolaris.com/learn/faq/) to see if it contains anything which we could use to enhance the OI FAQ.


## Handbook - Getting Started

Import first section of Wiki page: <http://wiki.openindiana.org/oi/Using+OpenIndiana+-+Technical+FAQ>

Have a look at [OpenSolaris Automated Installer Guide](https://web.archive.org/web/20100401021842/http://www.opensolaris.com/use/Auto_Installer.pdf) to see if it contains anything still useful which we can use for the new handbook.


## Handbook - Common Tasks

< Place Holder >


## Handbook - Systems Administration

Have a look at [OpenSolaris CIFS guide](https://web.archive.org/web/20100215043517/http://www.opensolaris.com/use/CIFS.pdf) to see if it contains anything useful we can use for the new handbook.


## Handbook - Network Communications

< Place Holder >



### ABI support

* Write about the change from Sun Studio to GCC its implications for ABI from previous Solaris releases/OpenSolaris, etc.
    * For more details, see: [http://openindiana.org/pipermail/oi-dev/2014-December/003496.html](http://openindiana.org/pipermail/oi-dev/2014-December/003496.html)
    * We might also want to talk about what other effects (if any) have/will result from the move to OI-Userland


### Installing OI onto an ISCSI exposed SCSI target

A good tutorial might be to write about installing OpenIndiana Hipster on an ISCSI target.


```bash
[14:50:02] <alp> does someone have some links on "installing OI on ISCSI" ?
[14:57:40] <tsoome> alp get to illumos wiki, open projects loader -> ideas, from there you get link for jeffpc iscsi experiment
[14:57:46] <tsoome> I did use it to play with ipxe+iscsi+loader
```

Also can look at Oracle docs for reference: [https://docs.oracle.com/cd/E26502_01/html/E29008/iscsi-1.html](https://docs.oracle.com/cd/E26502_01/html/E29008/iscsi-1.html)


### Write some comparison tables

* Provide some contrast/comparisons between OI and other illumos distros.
* Provide some contrast/comparisons between OI and other BSD distros (PCBSD in relation to freebsd, etc.)
* Provide some contrast/comparisons between OI and Linux, etc. (Linux kernel and GNU userland, illumos kernel and GNU userland, etc.)
    * See: [https://web.archive.org/web/20090904201802/http://wikis.sun.com/display/SolarisDeveloper/Migrating+from+Linux+to+Solaris+or+OpenSolaris](https://web.archive.org/web/20090904201802/http://wikis.sun.com/display/SolarisDeveloper/Migrating+from+Linux+to+Solaris+or+OpenSolaris)
* Command comparison tables – e.g. if such and such command does something on Linux, Windows, BSD, etc., use such and such command to do same thing on OI.
    * For some inspiration, see the tables found on the SmartOS Wiki.
    * Oracle might have some inspiration as well - (just don't copy it verbatim)


### Write about Virtualization

* add a page about running OI as a virtual guest in Virtualbox, VMware, KVM, talk about which provides the best hardware support, guest tools compatibility, other caveats, etc.


### Potentially Useful Documentation References

* [OpenSolaris Documentation Style Guide](https://web.archive.org/web/20081207155129/http://opensolaris.org/os/community/documentation/files/OSOLDOCSG.pdf) - [Internet Archive - PDF]
* [docs from www.opensolaris.org](https://web.archive.org/web/20090823064740/http://www.opensolaris.org/os/community/documentation/) - [Internet Archive]
* [docs from hub.opensolaris.org](https://web.archive.org/web/20100909110451/http://hub.opensolaris.org/bin/view/Main/documentation) - [Internet Archive]
* [What's new for OSOL 2010.03](https://web.archive.org/web/20110702071619/http://cr.opensolaris.org/~gman/opensolaris-whats-new-2010-03) - [Internet Archive]
* link to illumos graphics files: [https://www.illumos.org/projects/site/files](https://www.illumos.org/projects/site/files)
* [Getting Started With OpenSolaris 2008.11](https://web.archive.org/web/20110904232819/http://dlc.sun.com/osol/docs/downloads/minibook/en/820-7102-10-Eng-doc.pdf) - [Internet Archive - PDF]
* [FreeBSD Documentation Project Primer for New Contributors](https://www.freebsd.org/doc/en_US.ISO8859-1/books/fdp-primer/)


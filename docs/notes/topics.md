# Topics to write about

The goal of this page is to provide a TODO list of things which need to be documented.
Topics will be organized first by page and then by topic.

The second level headers will indicate the page.
Third level headers will indicate topics, etc.

It might be easier to first populate this page with 3rd level subject headers and then later come back and assign pages.

## Code of Conduct page

### Helpful resources for writing this page

* [How to protect your open source project from poisonous people](https://www.youtube.com/watch?v=Q52kFL8zVoM) - Video
* [Assholes are ruining your project](http://www.slideshare.net/dberkholz/assholes-are-ruining-your-project) - Slideshare

Proposed rules:

* No filibustering - <https://en.wikipedia.org/wiki/Filibuster>
    * Filibustering occurs when someone replies to every post in a mailing list thread.
    * Gives the impression there is more opposition to a new idea or concept than there really is.
    * Monopolizes everyone's time, drains everyone's energy, and prevents decisions from moving forward.

* How to prevent filibustering -
    * Limit the number of replies in a thread.
    * Ask the filibusterer to compose their thought and reply with a single response (no extended discussion allowed).

* No open hostility.
* No repeated rehashing of closed (decided) issues.


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


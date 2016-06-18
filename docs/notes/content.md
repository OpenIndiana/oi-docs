<!--
The Original Documentation is _________________.

The Initial Writer of the Original Documentation is ___________ Copyright (C)_________[Insert year(s)]. All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): ______________________________________.

Portions created by ______ are Copyright (C)_________[Insert year(s)]. All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).
-->

# OpenIndiana Content Creation

This pages is a whiteboard for ideas and inspirations to get out there and write some content.
Contributing to the OpenIndiana project by helping with content creation doesn't mean you need to get involved in anything major.
Start small and only later consider taking on something larger.

## Why Fresh Website Content is so Important

Good docs and a steady stream of fresh website content inspires confidence in the project.
These things also help show the project is alive and thriving.
Here are a couple of end user quotes which serve as a reminder.


### A User Comment Posted to the OI Wiki in 2011

>Documentation such as a manual is essential in not just learning from, it tells everyone where the product is in the scheme of things.
>Referring to Oracle for documentation relating to OI just makes one have less confidence with OI itself.
>Look at the FreeBSD site documentation levels are really good and gives people confidence to try FreeBSD and its derivatives.

### A User Comment Posted to the FreeBSD Forum in 2013

>FreeBSD has been around almost as long as Unix itself existed (not entirely true, but you get the idea) and same can be said for Solaris as it was.
>Yet the OpenSolaris group basically still has to prove themselves.
>For all I know (from a commercial point of view) they could be gone next month.
>That makes it a liability, especially in comparison to Sun being out of the picture and the love/hate relationship with Oracle.


#### Suggestions For How to Approach Content Creation for Larger Works

While it's true there are some major projects that need love, helping out with one doesn't necessarily mean you have to write the entire thing yourself.
* Pick a doc and tackle a single section.
* Pick a doc and add in some TODO's where they are obviously needed.
* Add new sectional placeholders where they are needed.

#### Larger Works

* FAQ
* User Handbook
* Developer Handbook
* Updating the OpenSolaris books

#### Smaller Works

* Writing a news story
* Writing a blog post
* Writing a tutorial
* Writing an episode of Hipster news
* Documenting the documentation process


### Suggested Subjects to Write About (Tutorials, etc.)

This is just a short list of some suggested subjects to write about.
But don't limit yourself to this small list.
Write about anything you want.
Most importantly, write about what interests you.


#### ABI support

* Write about the change from Sun Studio to GCC its implications for ABI from previous Solaris releases/OpenSolaris, etc.
    * For more details, see: <http://openindiana.org/pipermail/oi-dev/2014-December/003496.html>
    * We might also want to talk about what other effects (if any) have/will result from the move to OI-Userland


#### Installing OI onto an ISCSI exposed SCSI target

A good tutorial might be to write about installing OpenIndiana Hipster on a SCSI target

```bash
[14:50:02] <alp> does someone have some links on "installing OI on ISCSI" ?
[14:57:40] <tsoome> alp get to illumos wiki, open projects loader -> ideas, from there you get link for jeffpc iscsi experiment
[14:57:46] <tsoome> I did use it to play with ipxe+iscsi+loader
```

Also can look at Oracle docs for reference: <https://docs.oracle.com/cd/E26502_01/html/E29008/iscsi-1.html>


#### Write some comparison tables

* Provide some contrast/comparisons between OI and other illumos distros.
* Provide some contrast/comparisons between OI and other BSD distros (PCBSD in relation to freebsd, etc.)
* Provide some contrast/comparisons between OI and Linux, etc. (Linux kernel and GNU userland, illumos kernel and GNU userland, etc.)
    * See: [example from old OSOL website](https://web.archive.org/web/20090904201802/http://wikis.sun.com/display/SolarisDeveloper/Migrating+from+Linux+to+Solaris+or+OpenSolaris)
* Command comparison tables – e.g. if such and such command does something on Linux, Windows, BSD, etc., use such and such command to do same thing on OI.
    * For some inspiration, see the tables found on the SmartOS Wiki.
    * Oracle might have some inspiration as well - (just don't copy it verbatim)

#### Write about Virtualization

* add a page about running OI as a virtual guest in Virtualbox, vmware, KVM, talk about which provides the best hardware support, guest tools compatibility, other caveats, etc.

### Potentially Useful Documentation References

* [OpenSolaris Documentation Style Guide](https://web.archive.org/web/20081207155129/http://opensolaris.org/os/community/documentation/files/OSOLDOCSG.pdf)
* [docs from www.opensolaris.org](https://web.archive.org/web/20090823064740/http://www.opensolaris.org/os/community/documentation/)
* [docs from hub.opensolaris.org](https://web.archive.org/web/20100909110451/http://hub.opensolaris.org/bin/view/Main/documentation)
* [What's new for OSOL 2010.03](https://web.archive.org/web/20110702071619/http://cr.opensolaris.org/~gman/opensolaris-whats-new-2010-03)
* link to illumos graphics files: <https://www.illumos.org/projects/site/files>
* [Getting Started With OpenSolaris 2008.11 - PDF minibook](https://web.archive.org/web/20110904232819/http://dlc.sun.com/osol/docs/downloads/minibook/en/820-7102-10-Eng-doc.pdf)
* [FreeBSD Documentation Project Primer for New Contributors](https://www.freebsd.org/doc/en_US.ISO8859-1/books/fdp-primer/)


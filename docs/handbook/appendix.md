# OpenIndiana Handbook - Appendix

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
This document is a work in progress (draft).
</div>

< place holder for introduction content >


## Finding help and support

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

### Web based support resources

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
The content for this section was originally pulled from the OpenIndiana FAQ and since has been expanded here.
We may want to revisit the FAQ and pull these changes over.
</div>

| Resource | URL
| --- | ---
| User Support IRC channel | <ul><li>[#openindiana (irc.freenode.net)](irc://irc.freenode.net/openindiana)</li><li>[channel logs (echelog)](http://echelog.com/logs/browse/openindiana/)</li></ul>
| Development IRC channel | <ul><li>[#oi-dev (irc.freenode.net)](irc://irc.freenode.net/oi-dev)</li><li>[channel logs (echelog)](http://echelog.com/logs/browse/oi-dev/)</li></ul>
| Documentation IRC channel | [#oi-documentation (irc.freenode.net)](irc://irc.freenode.net/oi-documentation)
| User Support Mailing List | <ul><li>[openindiana-discuss](https://openindiana.org/mailman/listinfo/openindiana-discuss)</li><li>[openindiana-discuss archives](https://openindiana.org/pipermail/openindiana-discuss/)</li></ul>
| Development Mailing List | <ul><li>[oi-dev](https://openindiana.org/mailman/listinfo/oi-dev)</li><li>[oi-dev archives](https://openindiana.org/pipermail/oi-dev/)</li></ul>
| OpenIndiana Wiki | <https://wiki.openindiana.org>
| OpenIndiana Bug Tracker | <https://www.illumos.org/projects/openindiana/issues>


## Developing with OpenIndiana

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
The book titled "Introduction to Operating Systems: A Hands-On Approach Using the OpenSolaris Project" may be a good resource for helping to complete this part of the handbook.

Questions to ask:

* How can OI be used as a development platform?
* What programming tools, languages, etc., are available?
* How can OI be used to further the development of OI itself?
</div>

## Software Development Testing

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
Need to add some guidance about how to add a test repo to test specific packages, etc.
</div>



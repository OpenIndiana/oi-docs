# Contributing to OpenIndiana Docs


The process for contributing to OpenIndiana Docs is simple and follows the very same practices used in the creation of the OpenIndiana distribution.


## Prerequisites

* Sign up for a [Github](https://github.com) account.
* Install and configure Git
    * See: <https://help.github.com/articles/set-up-git/>
* Install MkDocs 
    * `pip install mkdocs`


## Getting Started


### Fork the OpenIndiana Docs repository

* Open your web browser and sign into [Github](https://www.github.com)
* Browse to <https://github.com/makruger/website-2.0>
* Click the **Fork** button found in the upper right hand corner of the page.
    * Forking creates a server side clone of the upstream repository.


### Create a local clone of your fork

```bash
git clone https://github.com/your-user-name/website-2.0.git
```


### Add the upstream repository

```bash
cd website-2.0
git remote add upstream https://github.com/makruger/website-2.0.git
```
Verify things with `git remote -v`

You should now see:

```bash
remote -v
origin    https://github.com/YOUR_USERNAME/website-2.0.git(fetch)
origin    https://github.com/YOUR_USERNAME/website-2.0.git (push)
upstream  https://github.com/makruger/website-2.0.git(fetch)
upstream  https://github.com/makruger/website-2.0.git (push)
```


### Sync and merge changes from the upstream repository

Periodically you will want to _rebase_ your local copy by bringing in changes from the upstream repository.

```bash
git fetch upstream
git checkout master
git merge upstream/master
```


### Make some changes.

Open your favorite text editor and begin authoring content.

For example: `vim somefile.md`

Some text editors (Atom, VIM, etc.) natively include Markdown syntax highlighting (or offer it as a plugin).


### Visualize your changes using live preview

To assist with the content authoring process, it may be helpful to visualize your changes using a live preview.

* From the root of the website-2.0 folder:
    * Type: `mkdocs serve`
    * Open your web browser to 127.0.0.1:8000.

To shut down the live preview web server, use [CTRL] + [C].

### Running Markdown Lint (locally)

To check your changes for spelling and syntax errors, you may wish to run Markdown Lint locally on your computer.

```bash
$ mdl -c markdownlint-rules.rb <somefile.md>
Syntax OK
```


### Commit and push your changes.

```bash
git status
git add some-file-you-just-edited
git commit -m 'your commit message'
git push
```


### Send a pull request.

* Open your web browser to your forked copy of the OpenIndiana Docs repository.

For example: <https://github.com/your-user-name/website-2.0>

* Click the button for _New pull request_.
* Add some notes about your change.
* Submit your PR (pull request).


### What happens next?

At this point someone with commit rights to the upstream repository will examine your changes.
If no corrections are required, your changes will be accepted and merged into the upstream repository.

Upon commit, travis-ci will automatically deploy the changes to GitHub pages.



## Documentation Team Roles

There are multiple ways community members can contribute to the OpenIndiana Documentation revitalization effort.
These contributions fall into several different roles.
Each role requires a different skill level.

### Prerequisite skills

Basic familiarity with:

* Text editors
* The Markdown text markup syntax
* GIT distributed version control
* The MkDocs documentation framework

Pages are written in Markdown text markup.
The skill level required to work with these pages is minimal.
If you can use a text editor, you can write docs with Markdown.


### Content Author

The easiest way to help the docs revitalization effort is by authoring content.
The content author would (as the title suggests) write content to be hosted on the OpenIndiana Docs website.
Content can include just about anything, news posts, tutorials, Howto's, or larger efforts such as the handbook or updating the OSOL books.

The nice thing about helping the project as a content author is the level of commitment is entirely up to you the individual.
In other words, there is no requirement to get involved in anything major.
In fact, it would be better to start small and only later consider taking on something larger.
Helpful skills include a willingness to write and work as a team with content reviewers.

As needed, the content author consults with community members performing other roles.

### Content Reviewer

The content reviewer effectively performs the roles of editorial reviewer, configuration manager, release manager, and as needed, doc team leader/trainer.
This person (or persons) would review pull request and provide editorial feedback to content creators.
Helpful skills include good organization and people skills, as well as a knack for performing editorial reviews.



## Documentation Team Tools


The OpenIndiana Docs website uses 2 principal technologies:

* The MkDocs content authoring framework.
* The Markdown text markup language.

Both technologies leverage the Python programming language.


### What is MkDocs?

MkDocs is a modern, flexible, and feature rich content authoring framework and static website generator.
The python based MkDocs framework publishes content as HTML5.
In conjunction with the MkDocs-Pandoc module, content may also be published in the PDF and EPUB formats.

Unlike a CMS system where you are restricted to the confines of an integral editor, the OpenIndiana Docs website has no such restriction.
Here content is authored using a simple text based markup.
Because you are working with plain text files, content may be authored using Atom, EMACS, Gedit, Nano, VIM, or any other text editor.
The choice is yours; Use your favorite text editor.


### MkDocs System Characteristics

* Easy to use Markdown syntax.
* Produces professional quality output.
* Extensible - accepts plugins.


### Why a Text Markup Based Docs Framework?

The primary advantage of using a text markup language is readability and flexibility.
The raw code for your authored content is simple plain text.
No need work with special tools such as WYSIWYG XML editors, etc.


### MkDocs and Markdown Informational Links


| URL | Description
|---|---
| <http://www.mkdocs.org/> | MkDocs Content Authoring Framework
| <https://pythonhosted.org/Markdown/> | Python implementation of Markdown
| <http://spec.commonmark.org/0.25/> | The CommonMark Markdown Spec
| <https://github.com/mivok/markdownlint> | Markdown Lint
| <https://travis-ci.org/> | Continuous Integration (similar to Jenkins, etc.)
| <https://pages.github.com/> | Publish from your github repo





### The Content Review Process

Upon receipt of a pull request, the content reviewer performs the following steps:

. Determines whether the changes are suitable as they are or require additional modifications (providing feedback to the originator as necessary).
. Performs QA testing by running Awestruct in development mode (generally applies only for changes to HAML pages).
. Upon acceptance, merges the pull request into the mainline branch.
. Using the Awestruct framework, manually publishes the changes to the live website.

#### NOTE:

At this time the content reviewer performs the role of release manager, manually publishing approved changes.
In the future OpenIndiana Docs will adopt a continuous integration model, where merging changes will automatically trigger a deployment of the website and all of it's contents.



## Documentation Team Topics


### Introduction

This is just a short list of some suggested subjects to write about.
Please don't limit yourself to this small list.
Write about anything you want.
Most importantly, write about what interests you or what you think may interest others.
Look through the existing docs for TODO's and tackle one of them.
Write some new TODO's.

### Translations

Consider helping to translate important documents and website pages.
For example, the primary OpenIndiana.org site now has a translation menu which needs populating.


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


## Potentially Useful Documentation References

* [OpenSolaris Documentation Style Guide](https://web.archive.org/web/20081207155129/http://opensolaris.org/os/community/documentation/files/OSOLDOCSG.pdf) - [Internet Archive - PDF]
* [docs from www.opensolaris.org](https://web.archive.org/web/20090823064740/http://www.opensolaris.org/os/community/documentation/) - [Internet Archive]
* [docs from hub.opensolaris.org](https://web.archive.org/web/20100909110451/http://hub.opensolaris.org/bin/view/Main/documentation) - [Internet Archive]
* [What's new for OSOL 2010.03](https://web.archive.org/web/20110702071619/http://cr.opensolaris.org/~gman/opensolaris-whats-new-2010-03) - [Internet Archive]
* link to illumos graphics files: [https://www.illumos.org/projects/site/files](https://www.illumos.org/projects/site/files)
* [Getting Started With OpenSolaris 2008.11](https://web.archive.org/web/20110904232819/http://dlc.sun.com/osol/docs/downloads/minibook/en/820-7102-10-Eng-doc.pdf) - [Internet Archive - PDF]
* [FreeBSD Documentation Project Primer for New Contributors](https://www.freebsd.org/doc/en_US.ISO8859-1/books/fdp-primer/)


## Documentation Team Style Guide


### Introduction

The OpenIndiana Style Guide is at this time a blank page.
Consider helping to create this important document.

Until then, the OpenSolaris Style Guide may be a helpful reference.

* [OpenSolaris Documentation Style Guide](https://web.archive.org/web/20081207155129/http://opensolaris.org/os/community/documentation/files/OSOLDOCSG.pdf) - [Internet Archive - PDF]
* [Rules for mdl(markdown linter](https://github.com/mivok/markdownlint/blob/master/docs/RULES.md)


## OpenIndiana Docs GitHub Repository


### Introduction

As the OpenIndiana Docs website is still a proof of concept technology demonstration, its Github repository remains under the private control of the original author.
If the concept is approved for inclusion under OpenIndiana GitHub organizational umbrella, then it will have an official repository.

Meanwhile, you can find the OpenIndiana Docs repository here: [https://github.com/makruger/website](https://github.com/makruger/website)

The repository consists of 2 branches:

* master
* gh-pages

Development occurs in the master branch and the site is published to the gh-pages branch, where the content becomes available via GitHub Pages.


## Docs Site Build Environment


### Introduction

< Place Holder >


## Docs Site Theming and Design


The OpenIndiana Docs website is built using the MkDocs static site generator framework.
CSS styling is managed through the use of a bootstrap derived CSS theming template.
Bootstrap is a popular CSS framework which makes it easier to develop static websites using predefined HTML elements.
This site uses the [bootwatch spacelab](https://bootswatch.com/spacelab/) theme.


## Docs Site Publishing



< Place Holder for content >


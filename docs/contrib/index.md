## Contributing to the OpenIndiana Documentation Project.

<!-- start roles.md -->

## Documentation Team Roles


There are multiple ways community members can contribute to the OpenIndiana Documentation revitalization effort.
These contributions fall into several different roles.
Each role requires a different skill level.

### Prerequisite skills

Basic familiarity with:

* Text editors
* The Asciidoc text markup syntax (in particular the Asciidoctor version of it)
* GIT distributed version control
* The Awestruct framework

Most pages are written in Asciidoc text markup.
The skill level required to work with these pages is minimal.
Other pages (indexes, layouts, etc.) are composed in HAML.
Modifying HAML pages requires basic front end web development skills.

### Content Creator

The easiest way to help the docs revitalization effort is by writing content.
The content creator would (as the title suggests) develop content to be hosted on the docs website.
Content could include just about anything, news posts, tutorials, Howto's, or larger efforts such as the handbook or updating the OSOL books.

The nice thing about helping with content creation is the level of commitment is entirely up to the individual.
In other words, there is no requirement to get involved in anything major.
In contrast, it would probably be better to start small and only later consider taking on something larger.
Helpful skills would include a willingness to write and work as a team with content reviewers.

As needed, the content writer consults with community members performing other roles.

### Content Reviewer

The content reviewer would effectively perform the roles of editorial reviewer, configuration manager, release manager, and as needed, coaching others in their roles.
This person would review pull request and provide editorial feedback to content creators.
This role would also engage with the website developer to help place content appropriately as well as assist the website developer with site organization.
As needed the content reviewer may also perform the role of quality assurance, by running the site in development mode to changes to HAML pages, menus, etc.
Helpful skills would include good organization, people skills, as well as a knack for performing editorial reviews.


### Website Developer

The docs website developer would work with content creators and content reviewers helping to improve and extend site functionality and organization.
This role requires front end web development skills and would be working directly with the Awestruct framework and its components.
The website developer would also be working with Awestruct extensions, helpers, and  may also include working directly with the Awestruct API.
Helpful skills would include experience with Ruby, HAML, HTML, CSS, Compass, SASS, etc.

<!-- end roles.md  -->

<!-- start tools.md -->
## Documentation Team Tools

### Introduction

Unlike a CMS system where you are restricted to the confines of an integral editor, the OpenIndiana Docs website has no such restriction.
Instead, content is authored using a simple text based markup.
Because you are working with plain text files, content may be authored using Atom, EMACS, Gedit, Nano, VIM, or any other text editor.
The choice is yours; Use your favorite text editor.

The OpenIndiana Docs website uses 2 principal technologies:

* The Asciidoctor content authoring framework.
* The Awestruct static site generator framework.

Both technologies leverage the Ruby programming language.

**NOTE**
To assist with the content development process, it may be helpful to visualize your changes using a live preview.
Asciidoctor live preview plugins are available for both Firefox and Chrome/Chromium.
The AsciidocFX IDE also contains a live preview.
Some text editors (Atom, VIM, etc.) also include Asciidoc syntax highlighting.
If your changes involve modifications to HAML pages, you'll likely want to preview your changes by running Awestruct in development mode.
Running Awestruct in development mode requires a locally installed Ruby development environment.
For a complete list of Asciidoctor related content authoring tools, consult the table at the bottom of this page.


### What is Asciidoctor?

Asciidoctor is a modern, flexible, and feature rich content authoring framework inspired by Asciidoc.
The Ruby based Asciidoctor can be used to author and publish content as HTML5, PDF, EPUB, Docbook5, slide shows, etc.


### Asciidoctor System Characteristics

* Easy to use syntax.
* Produces professional quality output.
* Extensible - accepts plugins and can itself be used as plugin within other frameworks.
* Does not yet support chunked html, however authored content can be exported to Docbook5, where XSLT tools may be used to perform this task.


### Why a Text Markup Based Docs Framework?

The primary advantage of using a text markup language is readability and flexibility.
The raw code for your authored content is simple plain text.
No need for special tools such as WYSIWYG XML editors, etc.


### Asciidoctor Authoring Tools and Informational Links


| URL | Description
|---|---|
| http://www.methods.co.nz/asciidoc/ | Asciidoc Language (the syntax)
| http://asciidoctor.org/ | Ruby based parser and tools
| http://discuss.asciidoctor.org/ | Asciidoctor support forum
| http://www.asciibinder.org/index.html | Asciibinder - (allows the construction of documents using _includes_).
| https://github.com/asciidoctor/asciidoctor-pdf | New Asciidoctor PDF generator (Alpha software)
| http://asciidocfx.com/ | Java based Asciidoc IDE
| https://github.com/dagwieers/asciidoc-vim | Asciidoc Syntax highlighting for VIM
| https://github.com/asciidoc/vim-asciidoc | Possibly newer version of VIM Syntax highlighting plugin
| https://chrome.google.com/webstore/detail/asciidoctorjs-live-previe/iaalpfgpbocpdfblpnhhgllgbdbchmia |Asciidoctor.js Live Preview plugin for Google Chrome Web Browser
| https://addons.mozilla.org/en-US/firefox/addon/asciidoctorjs-live-preview/ | Asciidoctor.js Live Preview plugin for Firefox Web Browser
| https://github.com/asciidoctor/asciidoctor-confluence | Confluence plugin for Asciidoctor - (uploads to Confluence site)
| http://gist.asciidoctor.org/ | Asciidoctor page renderer for GitHub Gist URL's
| https://travis-ci.org/ | Continuous Integration (similar to Jenkins, etc.)
| https://pages.github.com/ | Publish from your github repo
| http://hubpress.io/ | Blog from your github repo - built in Asciidoctor support 

**NOTE**
In order to use the Asciidoctor Chrome extension with local files, you must enable the plugin option "Allow access to file URLs".

<!-- end tools.md -->

<!-- start process.md  -->

## Documentation Team Processes


### Introduction

The basic workflow process for OpenIndiana Docs is simple:

* Fork the OpenIndiana Docs repository.
* Make some changes.
* Send a pull request.


### General Content Contributor Process

* [Sign up for a GitHub account](https://github.com/).
* [Install and configure Git](https://help.github.com/articles/set-up-git/).
* [Fork the OpenIndiana Docs repository](https://help.github.com/articles/fork-a-repo/).
* [Clone your forked version of the OpenIndiana Docs repository](https://help.github.com/articles/fork-a-repo/#step-2-create-a-local-clone-of-your-fork).
* [Add the OpenIndiana Docs repository as an _upstream_ repository](https://help.github.com/articles/syncing-a-fork/).
* Locate a document to change or decide where in the file hierarchy a new document should be created.
* Implement your changes (e.g. create a new document or modify and existing document).
* Implement or note any menu changes required to support your changes.
* `git fetch` to pull in any available upstream changes.
* Check to see whether upstream changes have affected your proposed changes.
* `git add` and `git commit` commit your changes.
* `git push` your changes to your forked repository.
* [Send a pull request](https://help.github.com/articles/using-pull-requests/) to a content reviewer so your changes may be reviewed for inclusion into the OpenIndiana Docs master repository.

**NOTE**

To assist with the content development process, it may be helpful to visualize your changes using a live preview.
Asciidoctor live preview plugins are available for both Firefox and Chrome/Chromium.
The AsciidocFX IDE also contains a live preview.
If your changes involve modifications to HAML pages, you'll likely want to preview your changes by running Awestruct in development mode.
Running Awestruct in development mode requires a locally installed Ruby development environment.

.HAML syntax checking
You can use the `--check` flag on the HAML executable to check for proper HAML syntax without evaluating the Ruby code.

[source, console]
```bash
$ haml --check index.html.haml
Syntax OK
```


### The Content Review Process

Upon receipt of a pull request, the content reviewer performs the following steps:

. Determines whether the changes are suitable as they are or require additional modifications (providing feedback to the originator as necessary).
. Performs QA testing by running Awestruct in development mode (generally applies only for changes to HAML pages).
. Upon acceptance, merges the pull request into the mainline branch.
. Using the Awestruct framework, manually publishes the changes to the live website.

**NOTE**

At this time the content reviewer performs the role of release manager, manually publishing approved changes.
In the future OpenIndiana Docs will adopt a continuous integration model, where merging changes will automatically trigger a deployment of the website and all of it's contents.


### Website Development Processes

Community members performing the role of Website Developer work directly with the Awestruct framework to extend the capabilities and visual aspects of the OpenIndiana Docs website.
Naturally most of their time will be spent running Awestruct in development mode.
Aside from this, the website development workflow follows the very same contributor process.

<!-- end process.md   -->

<!-- start topics.md  -->

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
    * For more details, see: http://openindiana.org/pipermail/oi-dev/2014-December/003496.html
    * We might also want to talk about what other effects (if any) have/will result from the move to OI-Userland


### Installing OI onto an ISCSI exposed SCSI target

A good tutorial might be to write about installing OpenIndiana Hipster on an ISCSI target.


```bash
[14:50:02] <alp> does someone have some links on "installing OI on ISCSI" ?
[14:57:40] <tsoome> alp get to illumos wiki, open projects loader -> ideas, from there you get link for jeffpc iscsi experiment
[14:57:46] <tsoome> I did use it to play with ipxe+iscsi+loader
```

Also can look at Oracle docs for reference: https://docs.oracle.com/cd/E26502_01/html/E29008/iscsi-1.html


### Write some comparison tables

* Provide some contrast/comparisons between OI and other illumos distros.
* Provide some contrast/comparisons between OI and other BSD distros (PCBSD in relation to freebsd, etc.)
* Provide some contrast/comparisons between OI and Linux, etc. (Linux kernel and GNU userland, illumos kernel and GNU userland, etc.)
    * See: https://web.archive.org/web/20090904201802/http://wikis.sun.com/display/SolarisDeveloper/Migrating+from+Linux+to+Solaris+or+OpenSolaris
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
* link to illumos graphics files: https://www.illumos.org/projects/site/files
* [Getting Started With OpenSolaris 2008.11](https://web.archive.org/web/20110904232819/http://dlc.sun.com/osol/docs/downloads/minibook/en/820-7102-10-Eng-doc.pdf) - [Internet Archive - PDF]
* [FreeBSD Documentation Project Primer for New Contributors](https://www.freebsd.org/doc/en_US.ISO8859-1/books/fdp-primer/)

<!-- end topics.md -->

<!-- start style.md  -->

## Documentation Team Style Guide


### Introduction

The OpenIndiana Style Guide is at this time a blank page.
Consider helping to create this important document.

Until then, the OpenSolaris Style Guide may be a helpful reference.

* [OpenSolaris Documentation Style Guide](https://web.archive.org/web/20081207155129/http://opensolaris.org/os/community/documentation/files/OSOLDOCSG.pdf) - [Internet Archive - PDF]
* [Rules for mdl(markdown linter](https://github.com/mivok/markdownlint/blob/master/docs/RULES.md)
<!-- end style.md  -->

<!-- start github.md  -->

## OpenIndiana Docs GitHub Repository


### Introduction

As the OpenIndiana Docs website is still a proof of concept technology demonstration, its Github repository remains under the private control of the original author.
If the concept is approved for inclusion under OpenIndiana GitHub organizational umbrella, then it will have an official repository.

Meanwhile, you can find the OpenIndiana Docs repository here: [https://github.com/makruger/website](https://github.com/makruger/website)

The repository consists of 2 branches:

* master
* gh-pages

Development occurs in the master branch and the site is published to the gh-pages branch, where the content becomes available via GitHub Pages.

<!-- end github.md -->

<!-- start build.md  -->

## Docs Site Build Environment


### Introduction

< Place Holder >

<!-- end build.md -->

<!-- start theme.md  -->

## Docs Site Theming and Design

### Introduction

The OpenIndiana Docs website is built using the Awestruct static site generator framework.
CSS styling is managed through the use of a bootstrap derived CSS theming template.
Bootstrap is a popular CSS framework which makes it easier to develop static websites using predefined HTML elements.
This site uses the https://bootswatch.com/spacelab/[bootwatch spacelab] theme.

<!-- end theme.md -->

<!-- start publish.md  -->

## Docs Site Publishing


### Introduction

< Place Holder for content >

<!-- end publish.md -->

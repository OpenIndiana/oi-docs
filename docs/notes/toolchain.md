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

# Continuous Integration Content Management


## Introduction

This document is a whiteboard for the development of ideas to begin the transition to a continuous integration toolchain for documentation.
The ideal model would be where all informational content (docs, blog posts, news, etc.) lives in github.
This way, working with informational content is simply a matter of working with familiar tools and concepts.

The continuous integration content management process might go something like this:

* Clone the repository.
* Add or edit some content.
* Commit your changes.
* Send a pull request so your changes can be reviewed for inclusion into the master repository.
* Upon commit to the master repository, a repo hook kicks off a build and deploy of the updated content.

This process can be as big or small as you like;
You may wish to keep things limited to systems documentation, or the concept can be expanded to include the project's entire web presence.

For the later, static website _baking_ frameworks such as [Awestruct](http://awestruct.org/) or [Jekyll](https://jekyllrb.com/) along with dynamic _mobile first_ CSS frameworks such as [Bootstrap](http://getbootstrap.com/) or [Foundation](http://foundation.zurb.com/), the entire OpenIndiana website, and all it's content, can be continuously integrated in a fully automated fashion.

### No Mess, No Fuss.

* No more databases to maintain.
* No more patching security holes in CMS systems.
* No more backups (remember the whole website lives on github, and everyone has their cloned copy of it).
* Everything is version controlled.

For a working example of what this might look like in production, have a look at the newly updated [Jenkins website](https://jenkins.io/index.html).

## Docs are Code

The most important thing to keep in mind is that docs are code.
So, we treat the docs (and all other content) just as we would treat code (and use the very same tools to manage it all).

* Write 1 sentence per line.
* Use comments in your code.
* Use version control - fork and fix (just as you would anything else).
* Use TODO's.

## General Writing Tips

* Write your docs by asking a question and then answering it.
    * Later turn the questions into sectional headings, etc.
* Use a thesaurus - e.g. [https://www.powerthesaurus.org/](https://www.powerthesaurus.org/)
* Couch read - via a phone or tablet, proof read what you previously wrote. - (puts you into the reader's shoes)

## What is Asciidoctor?

Asciidoc is a text markdown language using a Python based interpreter.
Asciidoctor is a more modern and more powerful Ruby based implementation of Asciidoc.
Asciidoctor also includes some of features found in documentation frameworks such as Sphinx (which is used by the Python and PC-BSD projects).
The Asciidoctor framework can be used for docs as well as for the production of other types of content (news stories, blog posts, etc.).

### System Characteristics

* Easy to use (even easier than Sphinx)
* TOC is easy to navigate (but not quite as clean as Sphinx)
* Like Sphinx, produces a very professional looking end product.
* Does not yet support chunked html, but can export to docbook and use docbook tools to perform this task.
* Supports the pulling together of several small documents using the concept of "includes".
* More flexible than Sphinx in that it can be used as part of a larger web content framework.

### Asciidoctor compared to Sphinx

Both systems have their relative merits with advantages and disadvantages.
For example if all you want to do is write and publish some docs, then Sphinx is a good choice.
However, if you want to do a little more (like the Jenkins project is doing), then Asciidoctor is likely the better choice.


## Why a Text Markup Based Docs Framework?

The primary advantage of using a text markup language is readability and flexibility.
The raw code for your content is simply text.
This is something you can make sense of without special tools (e.g. Docbook based WYSIWYG XML editors, etc.).


## Tips for Working with Asciidoctor

* Use "Attributes" and name space them - e.g. `:uri-project: <url>` -(place these attributes at top of document)
    * Call your attributes in your docs like this: `{uri-project} [Project name]`
* Use "Includes" - e.g. `include:: {uri-macros}/doc_to_import.asciidoc[]` - (allows you to pull in other docs into your docs)

## Asciidoctor Tools and Informational Links

| URL | Description |
|------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| <http://www.methods.co.nz/asciidoc/> | Asciidoc Language (the syntax) |
| <http://asciidoctor.org/> | Ruby based parser and tools |
| <http://discuss.asciidoctor.org/> | Asciidoctor support forum |
| <http://www.asciibinder.org/index.html> | Asciibinder - (allows the construction of documents using _includes_) |
| <https://github.com/asciidoctor/asciidoctor-pdf> | New Asciidoctor PDF generator (Alpha software) |
| <http://asciidocfx.com/> | Java based Asciidoc IDE |
| <https://github.com/dagwieers/asciidoc-vim> | Asciidoc Syntax highlighting for VIM |
| <https://chrome.google.com/webstore/detail/asciidoctorjs-live-previe/iaalpfgpbocpdfblpnhhgllgbdbchmia> | Asciidoctor.js Live Preview plugin for Google Chrome Web Browser |
| <https://addons.mozilla.org/en-US/firefox/addon/asciidoctorjs-live-preview/> | Asciidoctor.js Live Preview plugin for Firefox Web Browser |
| <https://github.com/asciidoctor/asciidoctor-confluence> | Confluence plugin for Asciidoctor - (uploads to Confluence site) |
| <http://gist.asciidoctor.org/> | Asciidoctor page renderer for GitHub Gist URL's |
| <https://travis-ci.org/> | Continuous Integration (similar to Jenkins, etc.) |
| <https://pages.github.com/> | Publish from your github repo |
| <http://hubpress.io/> | Blog from your github repo - built in Asciidoctor support |

#### NOTE:

In order to use the Asciidoctor Chrome extension with local files, you must enable the plugin option "Allow access to file URLs".

The Travis-CI build engine can even post the results of the build to IRC (as shown below from the Asciidoctor IRC channel).

    <travis-ci> asciidoctor/asciidoctor#2068 (master - cbf2ab0 : Dan Allen): The build passed.
    <travis-ci> Change view : https://github.com/asciidoctor/asciidoctor/compare/6e41bee5dc42...cbf2ab0a9b78
    <travis-ci> Build details : https://travis-ci.org/asciidoctor/asciidoctor/builds/114132261

### Videos

| URL | Description |
|---------------------------------------------|---------------------------------------------|
| <https://www.youtube.com/watch?v=kyGJEVEjfAs> | Write in AsciiDoc, Publish Everywhere! |
| <https://www.youtube.com/watch?v=r6RXRi5pBXg> | 7 Ways to Hack Your Brain to Write Fluently |

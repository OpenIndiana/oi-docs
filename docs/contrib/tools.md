# Documentation Team Tools

## Introduction

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


## What is Asciidoctor?

Asciidoctor is a modern, flexible, and feature rich content authoring framework inspired by Asciidoc.
The Ruby based Asciidoctor can be used to author and publish content as HTML5, PDF, EPUB, Docbook5, slide shows, etc.


## Asciidoctor System Characteristics

* Easy to use syntax.
* Produces professional quality output.
* Extensible - accepts plugins and can itself be used as plugin within other frameworks.
* Does not yet support chunked html, however authored content can be exported to Docbook5, where XSLT tools may be used to perform this task.


## Why a Text Markup Based Docs Framework?

The primary advantage of using a text markup language is readability and flexibility.
The raw code for your authored content is simple plain text.
No need for special tools such as WYSIWYG XML editors, etc.


## Asciidoctor Authoring Tools and Informational Links


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

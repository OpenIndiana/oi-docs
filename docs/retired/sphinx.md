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

# Building a Document Management Toolchain using Sphinx

## Introduction

This article looks at the Sphinx documentation management framework and how it could be used as part of a document management toolchain.
Sphinx is a python based docs framework and uses RestructuredText as it's text markup language.

### System Characteristics

* Easy to use
* TOC is easy to navigate.
* Produces a very professional looking end product.
* Processes text markup into highly polished, searchable and indexed HTML docs (as well as PDF and EPUB).
* Produces chunked HTML by means of pulling together several smaller documents into one larger document.

### Editing tools

* As a text markup any text editor can be used.
* There is a VIM plugin for RestructuredTEXT named RIV, which provides text folding, syntax highlighting, etc., but it's rather buggy.
* Another available plugin is InstantRST which provides a realtime text parsing webserver to provide you realtime feedback for your edits.


## Tool chain installation

You can install Sphinx on OpenIndiana Hipster, but latex is required for converting documents to PDF.
I'm not sure whether latex is available on Hipster.

### Linux Mint 17.2

* `sudo apt-get install git`
* `sudo apt-get install python-sphinx`
* `pip install https://github.com/Rykka/instant-rst.py/archive/master.zip`

### OpenIndiana Hipster

* `pkg install git`
* `pkg install pip`
* `pip install sphinx`
* `pip install https://github.com/Rykka/instant-rst.py/archive/master.zip`

### Setup VIM for using Sphinx

* Configure Vundle for VIM (Vundle is used to manage VIM plugins)
    * backup your VIM configuration by renaming your existing .vimrc and .vim folder
    * `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    * Configure .vimrc for vundle per: [https://github.com/VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)
* Add plugins to .vimrc and use vundle to install the plugins
    * Configure .vimrc for `Plugin 'Rykka/riv.vim'`
    * Configure .vimrc for `Plugin 'Rykka/InstantRst'`
    * From within VIM, run `:PluginInstall` to process/install the plugins

## Using Sphinx

### Getting Started

* Create a new repository on GitHub.
* Clone your repository to your local machine.
* cd into the directory creating by `git clone`.
* Configure Sphinx
    * `sphinx-quickstart`  (Note: For help on this, see the Sphinx website, which explains all the options.)

### Writing your docs

* Write your docs using RestructuredTEXT - (See the Sphinx website for guidance)
    * Sphinx docs use the .rst file name extension.
* Add finished doc file names to the _Table of Contents_ (TOC) which is located in `Index.rst`.

### Add work products to GIT

* Create and configure a `.gitignore` as appropriate.
* `git status`
* `git add <file(s)>`
* `git commit`
* `git push`

### Process your docs into HTML

* Generate html output by executing the command `make html` from within the Sphinx `_build` directory.
    * Finished docs are found in the `_build/html` directory.
    * Images, css, javascript, etc., are found in `_build/html/_static`
    * Source RestructuredTEXT files are copied to `_build/html/_source`

### Share your work

* When satisfied with HTML output, submit git pull requests to other members of the doc team.
* When doc team is satisfied with state of GitHub repository, a member of the doc team would clone the repository and generate the final HTML for display on the OI website.


## References:

* [http://www.sphinx-doc.org/en/stable/tutorial.html](http://www.sphinx-doc.org/en/stable/tutorial.html)
* [https://github.com/VundleVim/Vundle.vim](http://www.sphinx-doc.org/en/stable/tutorial.html)
* [https://github.com/Rykka/riv.vim](http://www.sphinx-doc.org/en/stable/tutorial.html)
* [https://github.com/Rykka/InstantRst](http://www.sphinx-doc.org/en/stable/tutorial.html)

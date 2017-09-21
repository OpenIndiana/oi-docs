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

<img src = "../../Openindiana.png">

# Getting Started with OpenIndiana Docs

The process for contributing to OpenIndiana Docs is simple and follows the same best practices used in the development of the OpenIndiana distribution.


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
First and foremost, we understand using development tools and techniques to write end user documentation is not for everyone.
For this reason, we're happy to accept your contribution in any format you wish to provide.

After receiving your submission, we will review the document for conversion to markdown and subsequent incorporation into OpenIndiana Docs.
Contributions may be submitted in plain text, .doc, .docx, .odt, html, xml, latex, pdf, GitHub Gist, etc.

In summary, if you believe your contribution would be helpful to the greater OpenIndiana community, we'll be willing to review it.
For further information, please contact us via one of the methods provided below.

To make a suggestion or report a problem with a document, please make your request by submitting a [Github issue](https://github.com/OpenIndiana/oi-docs/issues).

The docs team can be reached via email: _**docs at openindiana.org**_.

You may also inquire via IRC:

* [#openindiana (freenode)](irc://irc.freenode.net/openindiana)
* [#oi-dev (freenode)](irc://irc.freenode.net/oi-dev)
</div>


## Prerequisites

If you would like to make a contribution using the development tools, you must
have a GitHub account. If you do not already have a GitHub account, sign up for
a [Github](https://github.com) account.


#### Install and configure Git

| Operating System | Command
| --- | ---
| Arch | `pacman -S git`
| Centos/RHEL | `yum install git`
| Debian/Mint/Ubuntu | `apt-get install git`
| Fedora | `dnf install git`
| OpenIndiana | `pkg install git`

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
After GIT is installed, be sure to configure your name and email address.

For further details about configuring GIT, see: <https://help.github.com/articles/set-up-git/>

Also, if you need a good tutorial for quickly getting up to speed with GIT, see here: <http://rypress.com/tutorials/git/index>

Fear not though, only basic git commands are required for working with OI-DOCS.
</div>


#### Install python-pip

| Operating System | Command
| --- | ---
| Arch | `pacman -S python-pip`
| Centos/RHEL | `yum install python-pip`
| Debian/Mint/Ubuntu | `apt-get install python-pip`
| Fedora | N/A - (Included with Fedora 25)
| OpenIndiana | N/A - (Use MkDocs IPS package)


#### Install rubygems

| Operating System | Command
| --- | ---
| Arch | `pacman -S ruby`
| Centos/RHEL | `yum install rubygems`
| Debian/Mint/Ubuntu | `apt-get install rubgems-integration`
| Fedora | `dnf install rubygems`
| OpenIndiana | `pkg install ruby`


#### Install mkdocs

For OpenIndiana Hipster, MKDocs and all of it's dependencies have been packaged and are available in the OI Hipster repository.
So, if you're already running Hipster, installing MKDocs is as simple as: `pkg install mkdocs`

* Most other operating systems: `pip install mkdocs mkdocs-bootswatch`

After MKDocs has been installed, be sure to verify your installation with `mkdocs --version`

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
If you experience difficulties installing mkdocs, try using the python 3 version of `pip`.

For example:

* For Linux Mint 18, the python 3 version of `pip` would be `pip3`.
</div>


#### Install Markdown Lint (mdl)

For most operating systems:

* `gem install mdl`

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">

For OpenIndiana, you will need to add the Ruby Gem directory path to your $PATH variable.
To do so, add the following to your `.bashrc` (or similar file if you use a
different shell):

```
PATH=$PATH:/usr/ruby/2.3/bin/
export PATH
```

To immediately effect this change, source your `.bashrc` as follows:

```bash
source ~/.bashrc
```

To verify `mdl` is now accessible, test using the command: `which mdl` or alternately: `mdl --version`.

</div>

#### Install Markdown plugin for VIM or Emacs(optional)

* <https://github.com/plasticboy/vim-markdown/>
* <https://www.emacswiki.org/emacs/MarkdownMode>

## Fork the OpenIndiana Docs repository

* Open your web browser to the [OpenIndiana Docs GitHub Repository](https://github.com/OpenIndiana/oi-docs).
* Click the **Fork** button found in the upper right hand corner of the page.
    * Forking creates a server side clone of the upstream repository.
    * This clone is your own personal copy of the OpenIndiana Docs repository.


## Create a local clone of your fork

```bash
git clone https://github.com/YOUR-USER-NAME/oi-docs.git
```

The local clone is where you will perform your work.
Think of your local clone as your working copy of the repository.
The local clone is also where you will commit your changes.
Periodically you will push these local changes to your fork residing on Github.


## Add the upstream repository

```bash
cd oi-docs
git remote add upstream https://github.com/OpenIndiana/oi-docs.git
```

Verify things with `git remote -v`

You should now see:

```bash
origin  https://github.com/YOUR-USER-NAME/oi-docs.git (fetch)
origin  https://github.com/YOUR-USER-NAME/oi-docs.git (push)
upstream        https://github.com/OpenIndiana/oi-docs.git (fetch)
upstream        https://github.com/OpenIndiana/oi-docs.git (push)
```


## Sync and merge changes from the upstream repository

Periodically you will want to _rebase_ your local copy by bringing in changes from the upstream repository.
In plain English, this means the upstream repository is locally registered so you can periodically _pull down_ changes from the upstream master repository and merge them into your local clone.
This way your local clone remains in synchronization with the master upstream repository.
It is always a good idea to perform a pull from the upstream master repository prior to making changes to your local clone (working copy).

```bash
git pull upstream master
```

## OpenIndiana Docs site structure (master branch)

All site development occurs within the master branch.

```markdown
oi-docs/
├── docs/
├── link_validator.py
├── markdownlint-rules.rb
├── mkdocs.yml
├── README.md
├── site/
```

| Resource | Description
| --- | ---
| oi-docs/ | site root folder
| docs/ | documentation root folder
| link_validator.py | URL validation script
| markdownlint-rules.rb | Markdown Lint configuration
| mkdocs.yml | Site and menu configuration
| README.md | Git readme
| site/ | Live preview folder (no edits)

<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> **WARNING:**
<div class="well">

* Please do **NOT** perform any work within the `site/` folder.
    * This is a temporary folder created by MkDocs when the site is run locally in preview mode.
* Also, please do **NOT** perform any work within the gh-pages branch.
    * The gh-branch is destroyed and rebuilt each time the site is deployed to GitHub pages.
</div>

```markdown
docs/
├── books/
├── contrib/
├── dev/
├── favicon.ico
├── handbook/
├── index.md
├── misc/
├── Openindiana.png
└── retired/
```

| Resource | Description
| --- | ---
| books/ | Legacy OpenSolaris Books
| contrib/ | Contributor guidance docs
| dev/ | Development oriented docs
| favicon.ico | Site favicon icon
| handbook/ | OpenIndiana handbook docs
| index.md | Site front page
| misc/ | Miscellaneous docs
| Openindiana.pgn | OpenIndiana project graphic
| retired | Deprecated docs, etc.


## Make some changes

Open your favorite text editor and begin authoring content.

For example: `vim somefile.md` or `emacs somefile.md`

Some text editors (Atom, VIM, etc.) natively include Markdown syntax highlighting (or offer it as a plugin).


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Major changes should be performed within a separate branch, appropriately named to reflect the changes being made.
</div>

For a list of subject to write about:

* See the site TODO list.
* Have a look at the site Github issues list.
* See the [Topics](topics.md) page for a list of suggestions and TODO's.
* Write a new tutorial, or complete a small section of the handbook, etc.
* Consult with other doc team contributors for even more ideas.

## Adding new pages to the site menu

Site configuration settings and menus are located in `mkdocs.yml`.
To add a page to the menu, simply add a line to this file.
See the code snippet below for examples.

```markdown
- Docs:
        - 'OpenIndiana Code of Conduct': misc/conduct.md
        - 'OpenIndiana FAQ': misc/faq.md
        - 'OpenIndiana Handbook': handbook/handbook.md
        - OpenSolaris Books:
                - 'Book Index': books/index.md
                - 'Basic Administration': books/basic.md
                - 'Advanced Administration': books/advanced.md
                - 'Solaris Express Administration': books/express.md
                - 'Trusted Extensions Administration': books/trusted.md
                - 'Development Titles': books/develop.md
```

## Visualize your changes using live preview

To assist with the content authoring process, it may be helpful to visualize your changes using a live preview.

* From the root of the `oi-docs/` directory:
    * Type: `mkdocs serve` and press enter.
    * Open your web browser to 127.0.0.1:8000.

Each time you save your changes, the site page is automatically reloaded within your web browser.

To shut down the live preview web server, use `CTRL` + `C`.

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
If you wish to preview your changes on a remotely networked system or on a networked mobile device such as a tablet, the site can also be served on your LAN IP address.

To do so, issue the following command: `mkdocs serve --dev-addr=0.0.0.0:8000`
</div>


## Running Markdown Lint (locally)

Markdown Lint is used to check your changes for Markdown syntax errors.
Prior to submitting a pull request (PR), please consider running Markdown Lint locally on your computer.

From the root of the `oi-docs/` directory, execute the following command:

```bash
mdl -s markdownlint-rules.rb .
```

Markdown Lint will automatically traverse the entire folder structure looking for problems.
Alternately you may also run `mdl` on a specific file.
Simply replace the period (.) with the path to the file.

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Before you can run `mdl`, it may be necessary to modify your `$PATH` variable:
see “[Install Markdown Lint](#install-markdown-lint-mdl)” above.
</div>


## Enabling spell checking in vim

You can invoke spell checking in your current session by inputting the command:

`:set spell spelllang=en_us`

If you would like a more permanent solution, enable spell checking in your `.vimrc` by adding the line:

`set spelllang=en_us`


Misspelled words will now be highlighted (color varies dependent on your .Xresources file)

### Keyboard shortcuts for spell checking in vim

* `]s` to find the previously misspelled word.
* `[s` to find the next misspelled word.
* With the cursor at the beginning of a word, use `z=` to bring up a list of suggested replacements.
* `zg` will add a word to the local dictionary exception file.
* `zw` is used to mark a word as incorrect.


## Commit and push your changes.

```bash
git status
git add some-file-you-just-edited
git commit -m 'your commit message'
git push
```

When you make a commit, you are committing those changes locally to your clone.
When you perform a push, your are pushing your commits from your local clone to your fork residing on Github.


## Send a pull request.

* Open your web browser to _**your forked copy**_ of the OpenIndiana Docs repository.

For example: `https://github.com/your-user-name/oi-docs`

* Click the button for _New pull request_.
* Add some notes about your change.
* Submit your PR (pull request).

Pull requests are used to request a _pull in_ of changes from your fork to the master repository.

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
After a pull request has been submitted, and for the duration of time your pull request remains open and uncommitted to the OI-DOCS master repository, any additional commits you make to your own fork of the oi-docs repository will automatically be included in your open pull request.
</div>


## What happens next?

At this point a member of the OpenIndiana Project docs team will review your changes.
If no corrections are required, your changes will be accepted and merged into the upstream repository.

Upon commit, publishing occurs automatically using Travis-CI.


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

# Getting Started with OpenIndiana Docs

The process for contributing to OpenIndiana Docs is simple and follows the same best practices used in the development of the OpenIndiana distribution.


<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
First and foremost, we understand using development tools and techniques to write end user documentation is not for everyone.
For this reason, we're happy to accept your contribution in any format you wish to provide.

We'll happy accept contributions in plain text, .doc, .docx, .odt, html, xml, latex, pdf, GitHub Gist, etc.
From there, we will review the document for conversion to markdown and subsequent incorporation into OpenIndiana Docs.

In a nutshell, if you think your contribution can be helpful to the greater OpenIndiana community, we'll be happy to review it.

To make a suggestion or report a problem with a document, please make your request by submitting a [Github issue](https://github.com/OpenIndiana/oi-docs/issues).

The docs team can be reached via email: _**docs at openindiana.org**_.

You may also inquire via IRC:

* [#openindiana (freenode)](irc://irc.freenode.net/openindiana)
* [#oi-dev (freenode)](irc://irc.freenode.net/oi-dev)


</div>


## Prerequisites

If you haven't already, sign up for a [Github](https://github.com) account.


#### Install and configure Git

| Operating System | Command
| --- | ---
| Arch | `pacman -S git`
| Centos/RHEL | `yum install git`
| Debian/Mint/Ubuntu | `apt-get install git`
| Fedora | `dnf install git`
| OpenIndiana | `pkg install git`

After GIT is installed, be sure to configure your name and email address.
For further details, see: <https://help.github.com/articles/set-up-git/>


#### Install python-pip

| Operating System | Command
| --- | ---
| Arch | `pacman -S python-pip`
| Centos/RHEL | `yum install python-pip`
| Debian/Mint/Ubuntu | `apt-get install python-pip`
| Fedora | `dnf install pythop-pip`
| OpenIndiana | `pkg install pip`


#### Install rubygems

| Operating System | Command
| --- | ---
| Arch | `pacman -S ruby`
| Centos/RHEL | `yum install rubygems`
| Debian/Mint/Ubuntu | `apt-get install rubgems-integration`
| Fedora | `dnf install rubygem-rails`
| OpenIndiana | Installed by default as part of Ruby


#### Install mkdocs

* Most operating systems (including OpenIndiana): `pip install mkdocs`
* Verify your installation with `mkdocs --version`

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
If you experience difficulties installing mkdocs, try using the python 3 version of `pip`.

For example:

* For Linux Mint 18, the python 3 version of `pip` would be `pip3`.
</div>


#### Install Markdown Lint (mdl)

* `gem install mdl`


#### Install VIM Markdown plugin (optional)

* <https://github.com/plasticboy/vim-markdown/>


## Fork the OpenIndiana Docs repository

* Open your web browser to the [OpenIndiana Docs GitHub Repository](https://github.com/OpenIndiana/oi-docs).
* Click the **Fork** button found in the upper right hand corner of the page.
    * Forking creates a server side clone of the upstream repository.


## Create a local clone of your fork

```bash
git clone https://github.com/YOUR-USER-NAME/oi-docs.git
```


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

<!-- WARNING: --> <i class="fa fa-exclamation-triangle" aria-hidden="true"></i> **WARNING:**
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


## Make some changes.

Open your favorite text editor and begin authoring content.

For example: `vim somefile.md`

Some text editors (Atom, VIM, etc.) natively include Markdown syntax highlighting (or offer it as a plugin).


<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
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

* From the root of the website-2.0 folder:
    * Type: `mkdocs serve`
    * Open your web browser to 127.0.0.1:8000.

To shut down the live preview web server, use [CTRL] + [C].

## Running Markdown Lint (locally)

Markdown Lint is used to check your changes for Markdown syntax errors.
Prior to submitting a pull request (PR), please consider running Markdown Lint locally on your computer.

From the root site folder (website-2.0) execute the following command:

```bash
mdl -s markdownlint-rules.rb .
```

Markdown Lint will automatically traverse the entire folder structure looking for problems.
Alternately you may also run `mdl` on a specific file.
Simply replace the period (.) with the path to the file.

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">

Before you can run `mdl`, it may be necessary to add the path to your `$PATH` variable.

For example:

On OpenIndiana, markdown lint (mdl) resides in `/usr/ruby/1.9/bin/` which is not normally part of the search path.
To run this command without having to specify the complete path each time, add the following to your `.bashrc`

```bash
PATH=$PATH:/usr/ruby/1.9/bin/
export PATH
```

To immediately effect this change, source your `.bashrc` as follows:

```bash
source ~/.bashrc
```

</div>


## Running Markdown spell check (locally)

Markdown spell check or ``mdspell`` is used to check for spelling errors.
Prior to submitting a PR, please consider running ``mdspell`` locally on your computer.

```bash
mdspell --en-us -x -n -ran "**/*.md"
```

`mdspell` will automatically crawl the entire folder structure looking for spelling mistakes.
Alternatively you may also run `mdspell` on a specific file. Simply replace `"**/*.md"` with the path to the file.

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


## Send a pull request.

* Open your web browser to your forked copy of the OpenIndiana Docs repository.

For example: `https://github.com/your-user-name/oi-docs`

* Click the button for _New pull request_.
* Add some notes about your change.
* Submit your PR (pull request).

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
After a pull request has been submitted, and for the duration of time your pull request remains open and uncommitted to the OI-DOCS master repository, any additional commits you make to your own fork of the oi-docs repository will automatically be included in your open pull request.
</div>


## What happens next?

At this point a member of the OpenIndiana Project docs team will review your changes.
If no corrections are required, your changes will be accepted and merged into the upstream repository.

Upon commit, publishing occurs automatically using Travis-CI.


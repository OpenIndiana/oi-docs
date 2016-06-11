# Getting Started with OpenIndiana Docs


The process for contributing to OpenIndiana Docs is simple and follows the very same practices used in the creation of the OpenIndiana distribution.


## Prerequisites

### Sign up for a [Github](https://github.com) account.

#### Install and configure Git

* See: <https://help.github.com/articles/set-up-git/>

or

* Arch: `pacman -S git`
* Centos/RHEL: `yum install git`
* Debian/Ubuntu: `apt-get install git`
* Fedora: `dnf install git`


### Install pip

* Arch: `pacman -S python-pip`
* Centos/RHEL: `yum install python-pip`
* Debian/Ubuntu: `apt-get install python-pip`
* Fedora: `dnf install pythop-pip`

### Install gem

* Arch: `pacman -S ruby`
* Centos/RHEL: `yum install rubygems`
* Debian/Ubuntu `apt-get install rubgems-integration`
* Fedora `dnf install rubygem-rails`

### Install npm

* Arch: `pacman -S nodejs npm`
* Centos/RHEL: `yum install nodejs npm`
* Debian/Ubuntu: `apt-get install npm`
* Fedora: `dnf instal npm`

### Install MkDocs (mkdocs)

* `pip install mkdocs`

### Install Markdown Lint (mdl)

* `gem install mdl`

### Optionally install Markdown-spellcheck (mdspell)

* `npm install markdown-spellcheck`


## Fork the OpenIndiana Docs repository

* Open your web browser and sign into [Github](https://www.github.com)
* Browse to <https://github.com/makruger/website-2.0>
* Click the **Fork** button found in the upper right hand corner of the page.
    * Forking creates a server side clone of the upstream repository.


## Create a local clone of your fork

```bash
git clone https://github.com/your-user-name/website-2.0.git
```


## Add the upstream repository

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


## Sync and merge changes from the upstream repository

Periodically you will want to _rebase_ your local copy by bringing in changes from the upstream repository.

```bash
git fetch upstream
git checkout master
git merge upstream/master
```


## Make some changes.

Open your favorite text editor and begin authoring content.

For example: `vim somefile.md`

Some text editors (Atom, VIM, etc.) natively include Markdown syntax highlighting (or offer it as a plugin).


## Visualize your changes using live preview

To assist with the content authoring process, it may be helpful to visualize your changes using a live preview.

* From the root of the website-2.0 folder:
    * Type: `mkdocs serve`
    * Open your web browser to 127.0.0.1:8000.

To shut down the live preview web server, use [CTRL] + [C].

## Running Markdown Lint (locally)

To check your changes for spelling and syntax errors, you may wish to run Markdown Lint locally on your computer.

```bash
$ mdl -c markdownlint-rules.rb <somefile.md>
Syntax OK
```


## Commit and push your changes.

```bash
git status
git add some-file-you-just-edited
git commit -m 'your commit message'
git push
```


## Send a pull request.

* Open your web browser to your forked copy of the OpenIndiana Docs repository.

For example: <https://github.com/your-user-name/website-2.0>

* Click the button for _New pull request_.
* Add some notes about your change.
* Submit your PR (pull request).


## What happens next?

At this point someone with commit rights to the upstream repository will examine your changes.
If no corrections are required, your changes will be accepted and merged into the upstream repository.

Upon commit, travis-ci will automatically deploy the changes to GitHub pages.


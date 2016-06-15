# Getting Started with OpenIndiana Docs

The process for contributing to OpenIndiana Docs is simple and follows the same best practices used in the development of the OpenIndiana distribution.

## Prerequisites

#### Sign up for a [Github](https://github.com) account.

#### Install and configure Git

* Arch: `pacman -S git`
* Centos/RHEL: `yum install git`
* Debian/Ubuntu: `apt-get install git`
* Fedora: `dnf install git`
* OpenIndiana: `pkg install git`

or see: <https://help.github.com/articles/set-up-git/>

#### Install pip

* Arch: `pacman -S python-pip`
* Centos/RHEL: `yum install python-pip`
* Debian/Ubuntu: `apt-get install python-pip`
* Fedora: `dnf install pythop-pip`
* OpenIndiana: `pkg install pip`

#### Install gem

* Arch: `pacman -S ruby`
* Centos/RHEL: `yum install rubygems`
* Debian/Ubuntu `apt-get install rubgems-integration`
* Fedora `dnf install rubygem-rails`
* OpenIndiana: Installed by default as part of Ruby

#### Install npm

* Arch: `pacman -S nodejs npm`
* Centos/RHEL: `yum install nodejs npm`
* Debian/Ubuntu: `apt-get install npm`
* Fedora: `dnf install npm`
* OpenIndiana: `pkg install nodejs`

#### Install MkDocs (mkdocs)

* `pip install mkdocs`

Verify your installation with `mkdocs --version`

#### Install Markdown Lint (mdl)

* `gem install mdl`

#### Optionally install Markdown-spellcheck (mdspell)

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
origin    https://github.com/your-user-name/website-2.0.git(fetch)
origin    https://github.com/your-user-name/website-2.0.git (push)
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

## OpenIndiana Docs site structure (master branch)

All site development occurs within the master branch.

```markdown
website-2.0/
├── deploy.sh
├── docs/
├── link_validator.py
├── markdownlint-rules.rb
├── mkdocs.yml
├── README.md
├── site/
└── TODO.md
```

| Resource | Description
| --- | ---
| website-2.0/ | site root folder
| deploy.sh | site deployment script
| docs/ | documentation root folder
| link_validator.py | URL validation script
| markdownlint-rules.rb | Markdown Lint configuration
| mkdocs.yml | Site and menu configuration
| README.md | Git readme
| site/ | Live preview folder (no edits)

<!-- NOTE: --> <i class="fa fa-exclamation-triangle" aria-hidden="true"></i> **WARNING:**
<div class="well">

* Please do **NOT** perform any work within the master branch site folder.
    * This is a temporary folder created by MkDocs when the site is run locally in preview mode.
* Also, please do **NOT** perform any work within the gh-pages branch.
    * The gh-branch is destroyed and rebuild each time the site is deployed to GitHub pages.
</div>

```markdown
docs/
├── contrib/
├── dev/
├── favicon.ico
├── handbook/
├── index.md
├── misc/
└── notes/
```

| Resource | Description
| --- | ---
| contrib/ | Contributor guidance docs
| dev/ | Development oriented docs
| favicon.ico | Site favicon icon
| handbook/ | OpenIndiana handbook docs
| index.md | Site front page
| misc/ | Miscellaneous docs
| notes | Doc team reference notes


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
* See the [Topics](../notes/topics.md) for a list of suggestions.
* Write a new tutorial, or complete a small section of the handbook, etc.
* Consult with other doc team contributors for even more ideas.


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


## Commit and push your changes.

```bash
git status
git add some-file-you-just-edited
git commit -m 'your commit message'
git push
```


## Send a pull request.

* Open your web browser to your forked copy of the OpenIndiana Docs repository.

For example: `https://github.com/your-user-name/website-2.0`

* Click the button for _New pull request_.
* Add some notes about your change.
* Submit your PR (pull request).


## What happens next?

At this point someone with commit rights to the upstream repository will examine your changes.
If no corrections are required, your changes will be accepted and merged into the upstream repository.

Upon commit, publishing occurs automatically using Travis-CI.

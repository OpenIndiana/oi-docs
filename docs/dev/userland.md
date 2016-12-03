<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Aurelien Larcher Copyright (C) 2016 [Insert year(s)].
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): Johnathan Jenkins, Michael Kruger, Theodore Seán Tubbs

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

<img src = "../../Openindiana.png">

# Quick start for oi-userland

### Clone the repository from OpenIndiana's Github, it is set as origin:

```bash
git clone https://github.com/OpenIndiana/oi-userland.git
cd oi-userland
```

### Add your Github repository as remote:

```bash
git remote add my_name https://github.com/my_name/oi-userland.git
```

### Print for checking:

```bash
git remote -v
```

### Initial setup including creation of local on-disk repository and check:

```bash
gmake setup
gmake check-environment
```

### Every time you add or modify a component, create a new branch:

```bash
git checkout -b my_feature
```

### Keep this branch synchronized with origin/oi/hipster:

```bash
git pull --rebase origin oi/hipster
```

Your local branch is forwarded to the last commit of oi/hipster and your additional commits are kept on top of the stack.

### A component consists of several files:

* `Makefile`: the recipe to build the software (in the `build/$MARCH` directory) and install it locally (to the `build/proto` directory)
* `patches/`: directory containing patches applied before the configuration
* `*.p5m`: manifests used to generate the IPS package
* `$(COMPONENT_NAME).license`: file containing the licenses applicable to the software

### Here is a list of important targets for `gmake`

| Target | Description |
|---|---|
| `clobber` | cleans up the component directory completely, including deleting source |
| `download` | fetches the source archive and verify its `SHA256` sum |
| `prep` | extract and apply patches |
| `build` | configure and build |
| `install` | install locally |
| `sample-manifest` | generate an IPS manifest based on the files installed locally |
| `publish` | generate dependencies and publish the package to the local repository |

### First you need to make sure that `gmake prep` passes, so you can start by changing the component's metadata:

Example with `components/libjpeg6-ijg/Makefile`:

```bash
COMPONENT_NAME# libjpeg6-ijg
COMPONENT_VERSION# 6.0.2
LIBJPEG_API_VERSION# 6b
COMPONENT_FMRI# image/library/libjpeg6-ijg
COMPONENT_CLASSIFICATION# System/Multimedia Libraries
COMPONENT_PROJECT_URL# http://www.ijg.org/
COMPONENT_SUMMARY# libjpeg - Independent JPEG Group library version 6b
COMPONENT_SRC# jpeg-$(LIBJPEG_API_VERSION)
COMPONENT_ARCHIVE# $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz
COMPONENT_ARCHIVE_HASH# \
 sha256:75c3ec241e9996504fe02a9ed4d12f16b74ade713972f3db9e65ce95cd27e35d
COMPONENT_ARCHIVE_URL# http://www.ijg.org/files/jpegsrc.v$(LIBJPEG_API_VERSION).tar.gz
COMPONENT_LICENSE# IJG,GPLv2.0
COMPONENT_LICENSE_FILE# $(COMPONENT_NAME).license
```

| Variable | Value | Comment |
|---|---|---|
| COMPONENT_NAME | libjpeg6-ijg | Use the same name as in SFE or other Illumos userlands if applicable, otherwise follow Debian |
| COMPONENT_VERSION | 6.0.2 | Should be numerical only, not letters |
| LIBJPEG_API_VERSION | 6b | Local variable declared in the Makefile should be prefixed with the component's name |
| COMPONENT_FMRI | image/library/libjpeg6-ijg | Follow the convention for the FMRI, check a similar component |
| COMPONENT_CLASSIFICATION | System/Multimedia Libraries | This entry should be in the [OpenSolaris IPS Classification 2008](http://hub.openindiana.ninja/?q#content/opensolaris-ips-classification-2008) |
| COMPONENT_PROJECT_URL | http://www.ijg.org/ | Upstream project website |
| COMPONENT_SUMMARY | libjpeg - Independent JPEG Group library version 6b | Short description, one-liner |
| COMPONENT_SRC | jpeg-$(LIBJPEG_API_VERSION) |  |
| COMPONENT_ARCHIVE | $(COMPONENT_NAME)-$(COMPONENT_VERSION).tar.gz | Only change the extension |
| COMPONENT_ARCHIVE_HASH | sha256:75c3ec241e9996504fe02a9ed4d12f16b74ade713972f3db9e65ce95cd27e35d | To be generated |
| COMPONENT_ARCHIVE_URL | http://www.ijg.org/files/jpegsrc.v$(LIBJPEG_API_VERSION).tar.gz | Full path with archive filename if not equal to COMPONENT_ARCHIVE |
| COMPONENT_LICENSE | IJG,GPLv2.0 | Comma separated list of licenses |
| COMPONENT_LICENSE_FILE | $(COMPONENT_NAME).license | Do not change |

Run the first targets:

* `gmake download`: if the checksum fails, replace `COMPONENT_ARCHIVE_HASH` with the actual hash.
* `gmake unpack`: once the sources are extracted, concatenate the license files to $(COMPONENT_NAME).license, here "libjpeg6-ijg.license".
* `gmake patch`: to apply patches.

If you do not have any patches, you can as well run `gmake prep` directly.


### Patch, Build and install

The included .mk file depends on the build system, example:


```bash
include $(WS_TOP)/make-rules/configure.mk
```

Look in the `make-rules` directory for more

| File | Build |
|---|---|
| `ant.mk` | Ant |
| `attpackagemake.mk` | AT&T package tools |
| `cmake.mk` | CMake |
| `configure.mk` | Autotools |
| `gem.mk` | Ruby |
| `justmake.mk` | plain Makefile |
| `makemaker.mk` | Perl |
| `setup.py` | Python distutils |

Read the `.mk` file to see which variables you can modify, in general you can find variables such as:

* `*_ENV`
* `*_OPTIONS`
* `PRE_*_ACTION`
* `POST_*_ACTION`

For example, you may add this line for an Autotools-based component:


```bash
CONFIGURE_OPTIONS+# --enable-shared
```

It is now up to you to: patch, play with the configuration flags and such...
Do not hesitate to look around to see how it is done in other components !


### Prepare the IPS manifest

When the `install` target passes, you can run:


```bash
gmake sample-manifest
```

to generate a manifest from the list of installed files.

Copy the file `build/manifest-generated.p5m` to `$(COMPONENT_NAME).p5m` and edit it:

* Add you name as contributor
* Remove unused entries from the manifest:
    * directories: `:%g/^dir/d` (Vim)
    * static libs: `:%g/.a$/d` (Vim)
    * libtool files:: `:%g/.la$/d` (Vim)
    * Python *.pyc: `:%g/.pyc$/d` (Vim)

For some components, specific rules need to be applied: they can be implemented with *transforms*.
Some example can be found in the directory with the same name at the root directory of oi-userland.


### Publish the package

Run `gmake publish`: if the dependencies are resolved and the manifest is valid, your package is published to the local repository.
You can then install your package locally and test it.

To be able to search for the new packages in the local repository you need to rebuild search indexes:


```bash
pkgrepo refresh -s /path/to/my_repo
```

You can even rebuild the entire metadata:


```bash
pkgrepo rebuild -s /path/to/my_repo
```

### Submit your component

Run `gmake clobber` then `gmake publish` to check that the component is publishing correctly.

If it is the case, you can cleanup your branch then submit a pull-request.

First you need to *squash* all your commits into one, check how many commits are to be considered:


```bash
git log
```

then


```bash
git rebase -i HEAD~N
```

with N the number of commits to be squashed, and follow the instructions: the letter 's' should be put in place of 'pick' for the N - 1 commits before the last.

If you made a mistake with the commit message or author, use:


```bash
git commit --amend
```

with the relevant option.

Then you are ready to push:


```bash
git push my_name my_feature
```

or


```bash
git push -f my_name my_feature
```

if the branch you just rebased had already been pushed: since the history is rewritten you need to force the push, be careful.

Go to your Github profile and open a pull request.

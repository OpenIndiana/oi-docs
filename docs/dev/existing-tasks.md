<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Alexander Pyhalov Copyright (C) 2014-2019.
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): Adam Števko, Tim Mooney

Portions created by Adam Števko  are Copyright (C) 2017.
Portions created by Tim Mooney are Copyright (C) 2019.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

# Existing tasks

This page contains some ideas how to enhance OpenIndiana.

## Long term projects

**illumos-gate**

* Help Joyent and OmniOS CE dev teams with upstreaming LX changes
* Help Joyent and OmniOS CE dev teams with upstreaming bhyve changes
* Create a service for generic FMA event handler. Some early work can be found [here](https://github.com/pyhalov/illumos-gate/tree/fma).

**gfx-drm**

* Try to import new changes from upstream Linux DRM

**oi-userland**

* Move components to using [common.mk](https://github.com/OpenIndiana/oi-userland/blob/oi/hipster/make-rules/common.mk)

**Infrastructure**

* Implement package signing on pkg.openindiana.org

## Operative plan

**IPS/PKG**

* Import new changes from <https://github.com/Omniosorg/pkg5>

**slim-source**

* Port GUI installer to GTK3 (or better, rewrite in Python)

**oi-userland**

* Remove dependencies on Python 2.7
* Replace perl-524 with perl-530
* Investigate porting sun-solaris Perl module to more recent perl

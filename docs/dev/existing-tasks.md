<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Alexander Pyhalov Copyright (C) 2014-2019.
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): Adam Števko

Portions created by Adam Števko  are Copyright (C) 2017.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

<img src = "../../Openindiana.png">

# Existing tasks

This page contains some ideas how to enhance OpenIndiana.

## Long term projects

**illumos-gate**

* Help Joyent and OmniOS CE dev teams with upstreaming LX changes
* Create service for generic FMA event handler. Some early work can be found [here](https://github.com/pyhalov/illumos-gate/tree/fma).

**gfx-drm**

* Try to import new changes from upstream Linux DRM

**oi-userland**

* Finish moving components to category layout
* Automatically install dependencies when building packages
* Move components to using [common.mk](https://github.com/OpenIndiana/oi-userland/blob/oi/hipster/make-rules/common.mk)

**Infrastructure**

* Implement package signing on pkg.openindiana.org

## Operative plan

**IPS/PKG**

* Import new changes from <https://github.com/Omniosorg/pkg5>
* Switch IPS to Python 3

**slim-source**

* Port slim-source to Python 3

**oi-userland**

* Port build system to Python 3
* Remove dependencies on Python 2.7
* Try to create open source replacement for DDU's libddudev

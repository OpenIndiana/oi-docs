<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is  Aurelien Larcher Copyright (C) 2017.
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): Alexander Pyhalov

Portions created by Alexander Pyhalov are Copyright (C) 2019.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

<img src = "../../Openindiana.png">

# Building OpenIndiana

## Source repositories

OpenIndiana is built from several source repositories which are available on [Github](https://github.com/OpenIndiana).

 Repository  |  Description  | Build instructions | Comments
 ---------   | ------------- | ------------------ | --------
 [oi-userland](https://github.com/OpenIndiana/oi-userland) | Unified build system for OpenIndiana | [Building oi-userland](./userland.md)
 [illumos-gate](https://github.com/illumos/illumos-gate) | Kernel and core userland components | Use [openindiana/illumos-gate](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/illumos-gate) component | When preparing change for integration use official [Building illumos](https://illumos.org/docs/developers/build/) instructions
 [pkg5](https://github.com/OpenIndiana/pkg5)| Image Packaging System package manager | Use [openindiana/pkg](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/pkg) component
 [slim_source](https://github.com/OpenIndiana/slim_source)| Installers and Distribution Constructor | Use [openindiana/slim_source](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/slim_source) component | Also known as Caiman
 [time-slider](https://github.com/OpenIndiana/time-slider) | Graphical ZFS snapshot manager | Use [openindiana/time-slider](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/time-slider) component
 [nwam-manager](https://github.com/OpenIndiana/nwam-manager) | Network auto-magic GUI | Use [openindiana/nwam-manager](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/nwam-manager) component
 [nimbus](https://github.com/OpenIndiana/nimbus) | Nimbus GTK theme | Use [desktop/nimbus](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/desktop/nimbus) component
 [openindina-completions](https://github.com/OpenIndiana/openindiana-completions) | OpenIndiana bash completions | Use [shell/bash-completion](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/shell/bash-completion) component
 [openindina-welcome](https://github.com/OpenIndiana/openindiana-welcome) | openindiana-about tool | Use [openindiana/openindiana-welcome](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/openindiana-welcome) component
 [openindina-backgrounds](https://github.com/OpenIndiana/openindiana-backgrounds) | OpenIndiana desktop backgrounds | Use [openindiana/openindiana-backgrounds](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/openindiana-backgrounds) component
 [sysding](https://github.com/OpenIndiana/sysding) | Sysding initial configuration system | Use [openindiana/sysding](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/sysding) component
 [oi-docs](https://github.com/OpenIndiana/oi-docs) | User documentation site | [Getting Started with OpenIndiana Docs](../contrib/getting-started.md)

## Build process

OpenIndiana Hipster build process is rather simple.

Once a pull request has been merged to [oi-userland](https://github.com/OpenIndiana/oi-userland), [Jenkins](https://hipster.openindiana.org/jenkins/) starts incremental oi-userland build.
For components coming from other source repositories manual intervention can be necessary to start the build.
[illumos-gate](https://github.com/illumos/illumos-gate) is rebuilt daily in separate [Jenkins job](https://hipster.openindiana.org/jenkins/job/illumos-gate/).

If packages are built succesfully, they are published to the [main Openindiana package repository](http://pkg.openindiana.org/hipster/) or [package repository for patent-encumbered software](http://pkg.openindiana.org/hipster-encumbered/).

Note, that main OpenIndiana package repository also contains packages, inherited from now discontinued OpenIndiana /dev distribution.
Such packages are available only in binary form and can be identified by `2013.0.0.0` branch number.

Twice per year OpenIndiana developers create ISO images based on this repository using [Distribution Constructor](./distribution-constructor.md).

If you want to build customized ISO image, you can publish necessary additional packages to your own repository and use [Distribution Constructor](./distribution-constructor.md) to create images with additional publishers and/or packages.

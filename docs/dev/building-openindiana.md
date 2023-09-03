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
 [openindiana-completions](https://github.com/OpenIndiana/openindiana-completions) | OpenIndiana bash completions | Use [shell/bash-completion](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/shell/bash-completion) component
 [openindiana-welcome](https://github.com/OpenIndiana/openindiana-welcome) | openindiana-about tool | Use [openindiana/openindiana-welcome](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/openindiana-welcome) component
 [openindiana-backgrounds](https://github.com/OpenIndiana/openindiana-backgrounds) | OpenIndiana desktop backgrounds | Use [openindiana/openindiana-backgrounds](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/openindiana-backgrounds) component
 [sysding](https://github.com/OpenIndiana/sysding) | Sysding initial configuration system | Use [openindiana/sysding](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/sysding) component
 [oi-docs](https://github.com/OpenIndiana/oi-docs) | User documentation site | [Getting Started with OpenIndiana Docs](../contrib/getting-started.md)

## Build process

The OpenIndiana Hipster build process is rather simple.

Once a pull request has been merged to [oi-userland](https://github.com/OpenIndiana/oi-userland) [Jenkins](https://hipster.openindiana.org/jenkins/) starts an incremental oi-userland build.
For components coming from other source repositories manual intervention can be necessary to start the build.
[illumos-gate](https://github.com/illumos/illumos-gate) is rebuilt daily in a separate [Jenkins job](https://hipster.openindiana.org/jenkins/job/illumos-gate/).

If packages are built successfully they are either published to the [main Openindiana package repository](http://pkg.openindiana.org/hipster/) or to the [package repository for patent-encumbered software](http://pkg.openindiana.org/hipster-encumbered/).

Note that the main OpenIndiana package repository also contains packages inherited from the now discontinued OpenIndiana /dev distribution.
Such packages are available only in binary form and can be identified by a `2013.0.0.0` branch number.

Twice per year the OpenIndiana developers create ISO images based on this repository using the [Distribution Constructor](./distribution-constructor.md).

If you want to build a customized ISO image you can publish necessary additional packages to your own repository and use [Distribution Constructor](./distribution-constructor.md) to create images with additional publishers and/or packages.

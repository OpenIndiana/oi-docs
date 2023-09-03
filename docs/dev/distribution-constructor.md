<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Alasdair Lumsden 2011.
All Rights Reserved.

Portions created by Alexander Pyhalov are Copyright (C) 2019.

-->

# Using distribution constructor

Distribution constructor allows you to build OpenIndiana installation images (iso and usb).

Creating images is straight forward.
To create an image install the distribution-constructor. Then create a distribution constructor manifest based on an existing one.


```bash
mkdir distro-const
cd distro-const
pfexec pkg install install/distribution-constructor
cp /usr/share/distro_const/slim_cd/slim_cd_x86.xml .
pfexec distro_const build slim_cd_x86.xml
```

The distribution constructor will create an image with the packages specified in the ``<packages>`` attribute using ``<build_area>`` for storing files.
Final images will be located in the ``media`` directory under ``<build_area>``.
Distribution constructor logs will be available in the ``logs`` directory.

OpenIndiana ships three variants of images: an image for desktops with Mate-based GUI, an image with a set of packages for a typical server with the text installer and an image with a minimal set of packages with the text installer.
Each image is described by its own distribution constructor manifest.

Image type | Manifest location
-----------|------------------------------------------------
Desktop    | /usr/share/distro_const/slim_cd/slim_cd_x86.xml
Server     | /usr/share/distro_const/text_install/text_mode_x86.xml
Minimal    | /usr/share/distro_const/text_install/text_mode_x86_minimal.xml

Images with the text installer and the GUI live image differ by the sets of installed packages, preparation steps required to build the image and final post install steps made by installer to prepare a system.
The installer behavior is controlled by a distribution constructor manifest.

If you want to add packages from your own publisher to the image uncomment ``<post_install_repo_addl_authority>`` and ``<pkg_repo_addl_authority>`` sections and add your publisher there. For example:

```xml

<pkg_repo_addl_authority>
        <main
                url="http://buildzone.oi-build.r61.net:1000/"
                authname="userland"/>
</pkg_repo_addl_authority>
...
<post_install_repo_addl_authority>
        <main
                url="http://buildzone.oi-build.r61.net:1000/"
                authname="userland"/>
</post_install_repo_addl_authority>
```

A repository specified as ``<pkg_repo_addl_authority>`` will be used as an additional repository while constructing an image. A repository specified as ``<post_install_repo_addl_authority>`` will be set as an additional repository on the installed system.

To actually use packages from your package repository you should add full FMRIs of necessary packages to the ``<packages>`` section.

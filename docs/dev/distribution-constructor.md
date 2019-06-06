<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Alasdair Lumsden 2011.
All Rights Reserved.

Portions created by Alexander Pyhalov are Copyright (C) 2019.

-->

<img src = "../../Openindiana.png">

# Using distribution constructor

Distribution constructor allows you to build OpenIndiana installation images (iso and usb).

Creating images is straight forward.
To create image, install distribution-constructor, then create distribution constructor mainfest based on existing one.


```bash
mkdir distro-const
cd distro-const
pfexec pkg install install/distribution-constructor
cp /usr/share/distro_const/slim_cd/slim_cd_x86.xml .
pfexec distro_const build slim_cd_x86.xml
```

Distribution constructor will create image with packages, specified in ``<packages>`` attribute, using ``<build_area>`` for storing files.
Final images will be located in ``media`` directory under ``<build_area>``.
Distribution constructor logs will be available in ``logs`` directory.

OpenIndiana ships three variant of images: image for desktops with Mate-based GUI, image with set of packages for typical server with text installer and image with minimal set of packages with text installer.
Each image is described by it's own distribution constructor manifest.

Image type | Manifest location
-----------|------------------------------------------------
Desktop    | /usr/share/distro_const/slim_cd/slim_cd_x86.xml
Server     | /usr/share/distro_const/text_install/text_mode_x86.xml
Minimal    | /usr/share/distro_const/text_install/text_mode_x86_minimal.xml

Images with text installer and GUI live image differ by set of installed packages, preparation steps required to build the image and final post install steps made by installer to prepare system.
Installer behavior is controlled by distribution constructor manifest.

If you want to add packages from your own publisher to the image, uncomment ``<post_install_repo_addl_authority>`` and ``<pkg_repo_addl_authority>`` sections and add your publisher there, for example:

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

Repository, specified as ``<pkg_repo_addl_authority>``, will be used as additional repository while constructing image, the repository, specified as ``<post_install_repo_addl_authority>``, will be set as additional repository on installed system.

To actually use packages from your package repository, you should add full FMRIs of necessary packages to ``<packages>`` section.

<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Aurelien Larcher 2017.
All Rights Reserved.

Portions created by Ken Mays are Copyright (C) 2017.
Portions created by Alexander Pyhalov are Copyright (C) 2019.

-->

# Graphics stack

Like most UNIX/Linux operating systems, OpenIndiana's GUI environment is based on
the X Window System bundled with libraries and applications developed by
the [freedesktop.org](https://www.freedesktop.org/) community.

Therefore the Graphic Stack is comprised of:
* the opensource X11 display server Xorg, client libraries and utilities developed by the [X.org Project](https://www.x.org/),
* an OpenGL implementation in the form of the opensource [Mesa](https://www.mesa3d.org/) library,
* and illumos kernel drivers for different graphics adapters provided by the [gfx-drm](https://github.com/illumos/gfx-drm) gate,
* together with the [libdrm](https://gitlab.freedesktop.org/mesa/drm) implementing communication between kernel drivers and user-space components through the Direct Rendering Infrastructure (DRI) protocol.

All these components can be installed using the unified build system [oi-userland](https://github.com/OpenIndiana/oi-userland) or simply installed from the package repositories.

Notes concerning different components are provided:

 Component             | Scope
 --------------------- | ----------------
   [Xorg](#Xorg)       | Building the Xorg display server, protocol headers, client libraries and applications.
   [Mesa](#Mesa)       | Building the Mesa library and testing OpenGL capabilities.
   [Fonts](#Fonts)     | Packaging new fonts for OpenIndiana.
   [Nvidia](#Nvidia)   | Installation of Nvidia's proprietary graphics driver for Solaris.
   [gfx-drm](#gfx-drm) | Building the illumos KMS drivers and libdrm from the gfx-drm gate.

## Xorg

All the Xorg components are build in oi-userland and located in the x11 directory:

<https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/x11>

A bogus component is provided to rebuild the X11 gate:
<https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/x11/x11-gate>

The upstream Solaris code is located at:

<https://github.com/oracle/solaris-userland/tree/master/components/x11>

## Mesa

To build Mesa use the [x11/mesa](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/x11/mesa) component.

## Fonts

Font components in oi-userland are located in the [components/fonts](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/fonts) directory.

## Nvidia

Nvidia provides Solaris x86-64/x86 packages of their proprietary driver for different families of graphic adapters.

The Nvidia driver shipped with OpenIndiana is built using openindiana/nvidia-XXX [e.g. openindiana/nvidia-470](https://github.com/OpenIndiana/oi-userland/tree/oi/hipster/components/openindiana/nvidia-470) component.

The list of currently supported and legacy drivers is updated on the [Unix Drivers](https://www.nvidia.com/object/unix.html) page.

Series   | Label                        | Models                           | Notes
-------- | ---------------------------- | -------------------------------- | ------------------
430.xx   | Current long lived branch    | Quadro RTX 4000-8000, Quadro, Quadro Blade, Quadro NVS, NVS
415.xx   | Current short lived branch   | Quadro RTX 4000-6000, Quadro, Quadro Blade, Quadro NVS, NVS
396.xx   | Legacy GPU                   | GeForce 400 to Geforce GTX 10    | Driver 396.24
340.xx   | Legacy GPU                   | GeForce 8 to GeForce 700 series  | Driver 340.106 ; Delivers libvdpau as part of the package.
304.xx   | Legacy GPU                   | GeForce 6 to GeForce 600 series  | Driver 304.137

The drivers series 340.xx, 390.xx, and 490.xx are currently part of oi-userland, others may be installed manually following Nvidia's instructions.

The 390.xx drivers are current default.

Note on switching driver versions

```
# beadm create nvidia-460
# beadm mount nvidia-460 /tmp/nvidia-460
# pkg -R /tmp/nvidia-460 uninstall xorg-video nvidia nvidia-390
# pkg -R /tmp/nvidia-460 install nvidia-460
# beadm activate nvidia-460
# init 6
```

Note on manual driver installations:

```
# beadm create oi-nvidia
# beadm mount oi-nvidia /mnt
# pkg -R /mnt uninstall x11/server/xorg/driver/xorg-video driver/graphics/nvidia
# /bin/sh NVIDIA-Solaris-x86-390.48.run --extract-only
# cd NVIDIA-Solaris-x86-390.48
# pkgadd -R /mnt -d . NVDAgraphics NVDAgraphicsr
# bootadm update-archive -R /mnt
# beadm unmount -f oi-nvidia
# beadm activate oi-nvidia
# init 6
```

## gfx-drm

The gfx-drm gate consists of different kernel components for support of various graphic adapters in the illumos and the Direct Rendering Infrastructure (DRI) library, libdrm.

Component  | Description
---------  | ------------
libdrm     | The library enables communication between kernel components and user-space libraries through the DRI protocol.
agpart     | Kernel driver for the Graphics Address Remapping Table (GART) / Graphics Translation Table (GTT) support.
header-drm | System headers for DRM/KMS kernel drivers and user-space libraries.
i915       | Intel KMS driver for Intel Graphics Media Accelerator (GMA) and Intel HD Graphics adapters.

### Intel KMS driver

The xorg-video-intel package is the open-source 2D graphics driver for the X Window System as implemented by X.org. It supports a variety of Intel graphics chipsets including:

* i810/i810e/i810-dc100,i815,
* i830M,845G,852GM,855GM,865G,
* 915G/GM,945G/GM/GME,946GZ
* G/GM/GME/Q965,
* G/Q33,G/Q35,G41,G/Q43,G/GM/Q45
* PineView-M (Atom N400 series)
* PineView-D (Atom D400/D500 series)
* Intel(R) HD Graphics,
* Intel(R) Iris(TM) Graphics,
* Intel(R) Iris(TM) Pro Graphics.

Open source kernel driver(s) by Oracle:

<https://github.com/oracle/solaris-userland/tree/master/components/x11/kernel/sun-src>

The relevant kernel code is located in drm and i915 subfolders.

An illumos port of Oracle code is available here:

<https://github.com/illumos/gfx-drm>

Martin Bochnig, creator of OpenSXCE, initially backported the S12 driver to illumos available in oi-userland until December 20, 2016.

It was then superseeded by the new gate providing improvements to the gfx_private interface and agpgart driver, as well as containing userland libraries used by graphics, like libdrm.

#### References

Alan Coopersmith pointed to the following documents regarding DRI/KMS:

* <http://www.phoronix.com/scan.php?page=news_item&px=Solaris-DRM-KMS-2015>
* <http://www.x.org/wiki/Events/XDC2015/Program/#Fishel_status_drm_i915_solaris>
* <https://en.wikipedia.org/wiki/Direct_Rendering_Manager>
* <http://dri.freedesktop.org/wiki/>
* <https://wiki.archlinux.org/index.php/kernel_mode_setting>
* <https://web.archive.org/web/20170711030533/http://lanyrd.com/topics/x-window-system/>

Additionally, information about driver development:

* <https://01.org/linuxgraphics>
* <http://dri.freedesktop.org/docs/drm/>
* <http://blog.ffwll.ch/2013/01/i915gem-crashcourse-overview.html>
* blog posts from the i915 Linux maintainer <http://blog.ffwll.ch/>

#### Known Issues

##### SNA

SNA may cause segmentation faults if enabled. If so, just disable SNA and you can copy the attached 20-intel-uxa.conf to /etc/X11/xorg.conf.d/.

For now UXA mode is set by default.

#### Sandy Bridge GT1

A hardware bug required implementing a workaround in the Intel ringbuffer implementation, occasional 1-2 second hangs may occur.

#### Gen >= 8

Generation 8 (and later) devices are not supported at all.
They require Intel ringbuffer support, which is not implemented.

### Hardware Matrix

Reference:

* <https://github.com/torvalds/linux/blob/master/include/drm/i915_pciids.h>
* <https://en.wikipedia.org/wiki/List_of_Intel_graphics_processing_units>
* <http://src.illumos.org/source/xref/gfx-drm/usr/src/uts/intel/io/i915/i915_drv.c#294>

 Generation | Family         | Codename             | PCI id  | Model                 | i915 support | xf86-video-intel support
 ---------- | -------------- | -------------------- | ------- | --------------------- | ------------ | ------------------------
        2nd | I830           | Almador              | 0x3577  | I830M, I830MG         |              |
        2nd | I845G          | Brookdale            | 0x2562  | I845G, I845GL, I845GV |              |
        2nd | I85X           | Montara              | 0x3582  | I855GM                |              |
        2nd | I85X           | Montara              | 0x358e  | I855GM                |              |
        2nd | I865G          | Springdale           | 0x2572  | I865G                 |              |
        3rd | I915G          | Grantsdale           | 0x2582  | I915G                 |              |
        3rd | I915G          | Grantsdale           | 0x258a  | E7221G                |              |
        3rd | I915GM         | Alviso               | 0x2592  | I915GM                |              |
        3rd | I945G          | Lakeport             | 0x2772  | I945G                 |              |
        3rd | I945GM         | Calistoga            | 0x27a2  | I945GM                |              |
        3rd | I945GM         | Calistoga            | 0x27ae  | I945GME               |              |
        3rd | G33            | Bearlake             | 0x29b2  | Q35G                  |              |
        3rd | G33            | Bearlake             | 0x29c2  | G33G                  |              |
        3rd | G33            | Bearlake             | 0x29d2  | Q33G                  |              |
        3rd | PINEVIEW       | Pineview             | 0xa001  |                       |              |
        3rd | PINEVIEW       | Pineview             | 0xa011  |                       |              |
        4th | I965G          | Lakeport             | 0x2972  | I946GZ                |              |
        4th | I965G          | Bearlake             | 0x2982  | G35G                  |              |
        4th | I965G          | Broadwater           | 0x2992  | I965Q                 |              |
        4th | I965G          | Broadwater           | 0x29a2  | I965G                 |              |
        4th | I965GM         | Crestline            | 0x2a02  | I965GM                |              |
        4th | I965GM         | Crestline            | 0x2a12  | I965GME               |              |
        4th | GM45           | Cantiga              | 0x2a42  | GM45G                 |              |
        4th | G45            | Eaglelake            | 0x2e02  | IGDEG                 |              |
        4th | G45            | Eaglelake            | 0x2e12  | Q45G                  |              |
        4th | G45            | Eaglelake            | 0x2e22  | G45G                  |              |
        4th | G45            | Eaglelake            | 0x2e32  | G41G                  |              |
        4th | G45            | Eaglelake            | 0x2e42  | B43G                  |              |
        4th | G45            | Eaglelake            | 0x2e92  | B43G.1                |              |
        5th | IRONLAKE D     | Ironlake (Clarkdale) | 0x0042  |                       |              |
        5th | IRONLAKE M     | Ironlake (Arrandale) | 0x0046  |                       |              |
        6th | SANDY BRIDGE D | Sandy Bridge         | 0x0102  |                       |              |
        6th | SANDY BRIDGE D | Sandy Bridge         | 0x0112  |                       |              |
        6th | SANDY BRIDGE D | Sandy Bridge         | 0x0122  |                       |              |
        6th | SANDY BRIDGE D | Sandy Bridge         | 0x010A  |                       |              |
        6th | SANDY BRIDGE M | Sandy Bridge         | 0x0106  |                       | HW bug causes GPU hangs. Work-around in place, but one may see brief render delays.             |
        6th | SANDY BRIDGE M | Sandy Bridge         | 0x0116  |                       | HW bug causes GPU hangs. Work-around in place, but one may see brief render delays.             |
        6th | SANDY BRIDGE M | Sandy Bridge         | 0x0126  |                       | HW bug causes GPU hangs. Work-around in place, but one may see brief render delays.             |
        7th | IVY BRIDGE M   | Ivy Bridge           | 0x0156  | GT1 mobile            |              |
        7th | IVY BRIDGE M   | Ivy Bridge           | 0x0166  | GT2 mobile            |              |
        7th | IVY BRIDGE D   | Ivy Bridge           | 0x0152  | GT1 desktop           |              |
        7th | IVY BRIDGE D   | Ivy Bridge           | 0x0162  | GT2 desktop           |              |
        7th | IVY BRIDGE D   | Ivy Bridge           | 0x015a  | GT1 server            |              |
        7th | IVY BRIDGE D   | Ivy Bridge           | 0x016a  | GT2 server            |              |
        7th | HASWELL D      | Haswell              | 0x0402  | GT1 desktop           |              |
        7th | HASWELL D      | Haswell              | 0x0412  | GT2 desktop           |              |
        7th | HASWELL D      | Haswell              | 0x0422  | GT3 desktop           |              |
        7th | HASWELL D      | Haswell              | 0x040a  | GT1 server            |              |
        7th | HASWELL D      | Haswell              | 0x041a  | GT2 server            |              |
        7th | HASWELL D      | Haswell              | 0x042a  | GT3 server            |              |
        7th | HASWELL D      | Haswell              | 0x040B  | GT1 reserved          |              |
        7th | HASWELL D      | Haswell              | 0x041B  | GT2 reserved          |              |
        7th | HASWELL D      | Haswell              | 0x042B  | GT3 reserved          |              |
        7th | HASWELL D      | Haswell              | 0x040E  | GT1 reserved          |              |
        7th | HASWELL D      | Haswell              | 0x041E  | GT2 reserved          |              |
        7th | HASWELL D      | Haswell              | 0x042E  | GT3 reserved          |              |
        7th | HASWELL D      | Haswell              | 0x0C02  | SDV GT1 desktop       |              |
        7th | HASWELL D      | Haswell              | 0x0C12  | SDV GT2 desktop       |              |
        7th | HASWELL D      | Haswell              | 0x0C22  | SDV GT3 desktop       |              |
        7th | HASWELL D      | Haswell              | 0x0C0A  | SDV GT1 server        |              |
        7th | HASWELL D      | Haswell              | 0x0C1A  | SDV GT2 server        |              |
        7th | HASWELL D      | Haswell              | 0x0C2A  | SDV GT3 server        |              |
        7th | HASWELL D      | Haswell              | 0x0C0B  | SDV GT1 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0C1B  | SDV GT2 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0C2B  | SDV GT3 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0C0E  | SDV GT1 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0C1E  | SDV GT2 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0C2E  | SDV GT3 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0A02  | ULT GT1 desktop       |              |
        7th | HASWELL D      | Haswell              | 0x0A12  | ULT GT2 desktop       |              |
        7th | HASWELL D      | Haswell              | 0x0A22  | ULT GT3 desktop       |              |
        7th | HASWELL D      | Haswell              | 0x0A0A  | ULT GT1 server        |              |
        7th | HASWELL D      | Haswell              | 0x0A1A  | ULT GT2 server        |              |
        7th | HASWELL D      | Haswell              | 0x0A2A  | ULT GT3 server        |              |
        7th | HASWELL D      | Haswell              | 0x0A0B  | ULT GT1 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0A1B  | ULT GT2 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0A2B  | ULT GT3 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0D02  | CRW GT1 desktop       |              |
        7th | HASWELL D      | Haswell              | 0x0D12  | CRW GT2 desktop       |              |
        7th | HASWELL D      | Haswell              | 0x0D22  | CRW GT3 desktop       |              |
        7th | HASWELL D      | Haswell              | 0x0D0A  | CRW GT1 server        |              |
        7th | HASWELL D      | Haswell              | 0x0D1A  | CRW GT2 server        |              |
        7th | HASWELL D      | Haswell              | 0x0D2A  | CRW GT3 server        |              |
        7th | HASWELL D      | Haswell              | 0x0D0B  | CRW GT1 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0D1B  | CRW GT2 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0D2B  | CRW GT3 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0D0E  | CRW GT1 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0D1E  | CRW GT2 reserved      |              |
        7th | HASWELL D      | Haswell              | 0x0D2E  | CRW GT3 reserved      |              |
        7th | HASWELL M      | Haswell              | 0x0406  | GT1 mobile            |              |
        7th | HASWELL M      | Haswell              | 0x0416  |GT2 mobile             |              |
        7th | HASWELL M      | Haswell              | 0x0426  |GT2 mobile             |              |
        7th | HASWELL M      | Haswell              | 0x0C06  |SDV GT1 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0C16  |SDV GT2 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0C26  |SDV GT3 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0A06  |ULT GT1 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0A16  |ULT GT2 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0A26  |ULT GT3 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0A0E  |ULX GT1 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0A1E  |ULX GT2 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0A2E  |ULT GT3 reserved       |              |
        7th | HASWELL M      | Haswell              | 0x0D06  |CRW GT1 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0D16  |CRW GT2 mobile         |              |
        7th | HASWELL M      | Haswell              | 0x0D26  |CRW GT3 mobile         |              |
        7th | VALLEY VIEW M  | Valley View (Bay Trail) | 0x0f30|                      |              |
        7th | VALLEY VIEW M  | Valley View (Bay Trail) | 0x0f31|                      |              |
        7th | VALLEY VIEW M  | Valley View (Bay Trail) | 0x0f32|                      |              |
        7th | VALLEY VIEW M  | Valley View (Bay Trail) | 0x0f33|                      |              |
        7th | VALLEY VIEW M  | Valley View (Bay Trail) | 0x0157|                      |              |
        7th | VALLEY VIEW D  | Valley View (Bay Trail) | 0x0155|                      |              |
        8th | BROADWELL GT12M| Broadwell            | 0x1602  | GT1 ULT               |Gen >=8 **NOT** supported at all.|
        8th | BROADWELL GT12M| Broadwell            | 0x1606  | GT1 ULT               |              |
        8th | BROADWELL GT12M| Broadwell            | 0x160B  | GT1 Iris              |              |
        8th | BROADWELL GT12M| Broadwell            | 0x160E  | GT1 ULX               |              |
        8th | BROADWELL GT12M| Broadwell            | 0x1612  | GT2 Halo              |              |
        8th | BROADWELL GT12M| Broadwell            | 0x1616  | GT2 ULT               |              |
        8th | BROADWELL GT12M| Broadwell            | 0x161B  | GT2 ULT               |              |
        8th | BROADWELL GT12M| Broadwell            | 0x161E  | GT2 ULX               |              |
        8th | BROADWELL GT12D| Broadwell            | 0x160A  | GT1 Server            |              |
        8th | BROADWELL GT12D| Broadwell            | 0x160D  | GT1 Workstation       |              |
        8th | BROADWELL GT12D| Broadwell            | 0x161A  | GT2 Server            |              |
        8th | BROADWELL GT12D| Broadwell            | 0x161D  | GT2 Workstation       |              |
        8th | BROADWELL GT3M | Broadwell            | 0x1622  | GT3 ULT               |              |
        8th | BROADWELL GT3M | Broadwell            | 0x1626  | GT3 ULT               |              |
        8th | BROADWELL GT3M | Broadwell            | 0x162B  | GT3 Iris              |              |
        8th | BROADWELL GT3M | Broadwell            | 0x162E  | GT3 ULX               |              |
        8th | BROADWELL GT3D | Broadwell            | 0x162A  | GT3 Server            |              |
        8th | BROADWELL GT3D | Broadwell            | 0x162D  | GT3 Workstation       |              |
        8th | BROADWELL RSVDM| Broadwell            | 0x1632  | ULT                   |              |
        8th | BROADWELL RSVDM| Broadwell            | 0x1636  | ULT                   |              |
        8th | BROADWELL RSVDM| Broadwell            | 0x163B  | Iris                  |              |
        8th | BROADWELL RSVDM| Broadwell            | 0x163E  | ULX                   |              |
        8th | BROADWELL RSVDD| Broadwell            | 0x163A  | Server                |              |
        8th | BROADWELL RSVDD| Broadwell            | 0x163D  | Workstation           |              |
        8th | CHERRY VIEW    | Cherry View (Braswell, Cherry Trail) | 0x22b0 |        |              |
        8th | CHERRY VIEW    | Cherry View (Braswell, Cherry Trail) | 0x22b1 |        |              |
        8th | CHERRY VIEW    | Cherry View (Braswell, Cherry Trail) | 0x22b2 |        |              |
        8th | CHERRY VIEW    | Cherry View (Braswell, Cherry Trail) | 0x22b3 |        |              |
        9th | SKYLAKE GT1    | Skylake              | 0x1906  | ULT GT1               |              |
        9th | SKYLAKE GT1    | Skylake              | 0x190E  | ULX GT1               |              |
        9th | SKYLAKE GT1    | Skylake              | 0x1902  | DT  GT1               |              |
        9th | SKYLAKE GT1    | Skylake              | 0x190B  | Halo GT1              |              |
        9th | SKYLAKE GT1    | Skylake              | 0x190A  | SRV GT1               |              |
        9th | SKYLAKE GT2    | Skylake              | 0x1916  | ULT GT2               |              |
        9th | SKYLAKE GT2    | Skylake              | 0x1921  | ULT GT2F              |              |
        9th | SKYLAKE GT2    | Skylake              | 0x191E  | ULX GT2               |              |
        9th | SKYLAKE GT2    | Skylake              | 0x1912  | DT  GT2               |              |
        9th | SKYLAKE GT2    | Skylake              | 0x191B  | Halo GT2              |              |
        9th | SKYLAKE GT2    | Skylake              | 0x191A  | SRV GT2               |              |
        9th | SKYLAKE GT2    | Skylake              | 0x191D  | WKS GT2               |              |
        9th | SKYLAKE GT3    | Skylake              | 0x1923  | ULT GT3               |              |
        9th | SKYLAKE GT3    | Skylake              | 0x1926  | ULT GT3               |              |
        9th | SKYLAKE GT3    | Skylake              | 0x1927  | ULT GT3               |              |
        9th | SKYLAKE GT3    | Skylake              | 0x192B  | Halo GT3              |              |
        9th | SKYLAKE GT3    | Skylake              | 0x192A  | SRV GT3               |              |
        9th | SKYLAKE GT4    | Skylake              | 0x1932  | DT GT4                |              |
        9th | SKYLAKE GT4    | Skylake              | 0x193B  | Halo GT4              |              |
        9th | SKYLAKE GT4    | Skylake              | 0x193D  | WKS GT4               |              |
        9th | SKYLAKE GT4    | Skylake              | 0x193A  | SRV GT4               |              |
        9th | BROXTON        | Goldmont (Apollo Lake) |0x0A84 |                       |              |
        9th | BROXTON        | Goldmont (Apollo Lake) |0x1A84 |                       |              |
        9th | BROXTON        | Goldmont (Apollo Lake) |0x1A85 |                       |              |
        9th | BROXTON        | Goldmont (Apollo Lake) |0x5A84 | APL HD Graphics 505   |              |
        9th | BROXTON        | Goldmont (Apollo Lake) |0x5A85 | APL HD Graphics 500   |              |
        9th | KABY LAKE GT1  | Kaby Lake            | 0x5913  | ULT GT1.5             |              |
        9th | KABY LAKE GT1  | Kaby Lake            | 0x5915  | ULX GT1.5             |              |
        9th | KABY LAKE GT1  | Kaby Lake            | 0x5917  | DT  GT1.5             |              |
        9th | KABY LAKE GT1  | Kaby Lake            | 0x5906  | ULT GT1               |              |
        9th | KABY LAKE GT1  | Kaby Lake            | 0x590E  | ULX GT1               |              |
        9th | KABY LAKE GT1  | Kaby Lake            | 0x5902  | DT  GT1               |              |
        9th | KABY LAKE GT1  | Kaby Lake            | 0x5908  | Halo GT1              |              |
        9th | KABY LAKE GT1  | Kaby Lake            | 0x590B  | Halo GT1              |              |
        9th | KABY LAKE GT1  | Kaby Lake            | 0x590A  | SRV GT1               |              |
        9th | KABY LAKE GT2  | Kaby Lake            | 0x5916  | ULT GT2               |              |
        9th | KABY LAKE GT2  | Kaby Lake            | 0x5921  | ULT GT2F              |              |
        9th | KABY LAKE GT2  | Kaby Lake            | 0x591E  | ULX GT2               |              |
        9th | KABY LAKE GT2  | Kaby Lake            | 0x5912  | DT  GT2               |              |
        9th | KABY LAKE GT2  | Kaby Lake            | 0x591B  | Halo GT2              |              |
        9th | KABY LAKE GT2  | Kaby Lake            | 0x591A  | SRV GT2               |              |
        9th | KABY LAKE GT2  | Kaby Lake            | 0x591D  | WKS GT2               |              |
        9th | KABY LAKE GT3  | Kaby Lake            | 0x5923  | ULT GT3               |              |
        9th | KABY LAKE GT3  | Kaby Lake            | 0x5926  | ULT GT3               |              |
        9th | KABY LAKE GT3  | Kaby Lake            | 0x5927  | ULT GT3               |              |
        9th | KABY LAKE GT4  | Kaby Lake            | 0x593B  | Halo GT4              |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3E90  | GT1                   |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3E91  | DT GT2                |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3E92  | DT GT2                |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3E93  | GT1                   |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3E94  | GT2                   |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3E95  | GT3                   |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3E96  | GT2                   |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3E9B  | GT2                   |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3EA6  | GT3                   |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3EA7  | GT3                   |              |
        9th | COFFEE LAKE    | Coffee Lake          | 0x3EA8  | GT3                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A52  | GT2                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A5A  | GT2                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A42  | GT2                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A4A  | GT2                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A51  | GT2                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A59  | GT2                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A41  | GT2                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A49  | GT2                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A71  | GT2                   |              |
        9th | CANNON LAKE    | Cannon Lake          | 0x5A79  | GT2                   |              |

### How to checkout Linux drm code only

```bash
$ mkdir linux-drm
$ cd linux-drm/
$ git init
$ git remote add origin https://github.com/freedesktop/drm-intel.git
$ git config core.sparsecheckout true
$ echo "drivers/gpu/drm/*" >> .git/info/sparse-checkout
$ echo "include/drm/*" >> .git/info/sparse-checkout
$ git pull --depth=1 origin drm-intel-fixes
```

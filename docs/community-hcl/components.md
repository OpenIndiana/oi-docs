<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Matt Wilby Copyright (C) 2011.
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s):  Alexander Pyhalov, Aurelien Larcher, Deano Calver, Nikola M., David Stes

Portions created by Deano Calver are Copyright (C) 2011.
Portions created by Aurelien Larcher are Copyright (C) 2017.
Portions created by Nikola M. are Copyright (C) 2017.
Portions created by Alexander Pyhalov are Copyright (C) 2019.
Portions created by David Stes are Copyright (C) 2021, 2025.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

# Components

1. [Audio](#audio)
2. [Drives (HDD, CD, DVD or Tape)](#drives)
3. [Network interface controllers](#network-interface-controllers)
4. [External disk arrays](#external-disk-arrays)
5. [Graphics Adapters](#graphics-adapters)
6. [Motherboards](#motherboards)
7. [Peripheral Devices (Printers, keyboards, mice)](#peripheral-devices)
8. [Serial Controllers](#serial-controllers)
9. [Storage Controllers (HBA, Raid etc)](#storage-controllers)
10. [Webcams](#webcams)
11. [WiFi adapters](#wifi-adapters)

## Audio

These soundcards are compatible and 'known to work' with OpenIndiana.

  Soundcard                                           | Notes and/or specific usage instructions          | Driver  | Contributor
 ---------------------------------------------------- | ------------------------------------------------  | ------- | -----------
 ALI M5451/M5455                                      |                                                   |         |
 AMD 786 / AMD 8111                                   |                                                   |         |
 ASUS Xonar D1 / D2 / DG / DGX / DS / DSX / DX        | Use driver/audio/audiocmihd                       | audiocmihd | Erik Irsch
 ASUS Xonar Essence STX II / STX II 7.1               | Use driver/audio/audiocmihd                       | audiocmihd |
 ASUS Xonar U3/U5/U7 (USB)                            |                                                   |         |
 ASUS ROG Xonar Phoebus (PCI-E)                       |                                                   |         |
 ATI High Definition Audio (SB450/SB600/SB710)        |                                                   |         |
 ATI IXP200 / IXP300 / IXP400                         |                                                   |         |
 Audiotrak Prodigy 7.1 HiFi                           |                                                   |         |
 Audiotrak Prodigy HD2                                |                                                   |         |
 C-Media CMI8788 PCI audio controllers                | Use driver/audio/audiocmihd, Oxygen HD Audio      |         | Ken Mays
 Creative Sound Blaster Audigy series                 | Audigy RX, PCIe soundcard, oss_sblive             |         | Ken Mays
 Creative Sound Blaster Live! series                  | oss_sblive                                        |         | Ken Mays
 Creative Sound Blaster X-Fi series                   | oss_sbxfi                                         |         | Ken Mays
 Crystal CS4280 / CS4281 / CS4610 / CS4615            |                                                   |         |
 Ego Systems Juli@ XTE soundcard                      |                                                   |         |
 Envy24HT PCIe                                        |                                                   |         |
 ESS Solo-1                                           |                                                   |         |
 ForteMedia FM 801                                    |                                                   |         |
 Generic ENVY24 / ENVY24HT devices                    |                                                   |         |
 Generic M Audio USB MIDI interface (BETA)            |                                                   |         |
 Generic USB audio/MIDI device (BETA)                 |                                                   |         |
 Genius Sound Maker Value 5.1                         |                                                   |         |
 Guillemot Maxi Sound MUSE                            |                                                   |         |
 Hercules Game Theater XP / XP+                       |                                                   |         |
 Hercules Gamesurround MUSE Pocket (BETA)             |                                                   |         |
 HT OMEGA eCLARO 7.1 Channel PCI Express Sound Card   | Use driver/audio/audiocmihd                       | audiocmihd | Ken Mays
 HT Omega CLARO II                                    | Use driver/audio/audiocmihd                       | audiocmihd | Ken Mays
 HT Omega Claro halo XT                               | Use driver/audio/audiocmihd                       | audiocmihd | Ken Mays
 HT Omega Claro halo                                  | Use driver/audio/audiocmihd                       | audiocmihd | Ken Mays
 HT Omega Claro plus+                                 | Use driver/audio/audiocmihd                       | audiocmihd | Ken Mays
 HT Omega Claro                                       | Use driver/audio/audiocmihd                       | audiocmihd | Ken Mays
 HT Omega STRIKER 7.1                                 | Use driver/audio/audiocmihd                       | audiocmihd | Ken Mays
 Intel 440MX (440MX)                                  |                                                   |         |
 Intel AC97 series                                    |                                                   |         |
 Intel High Definition Audio series                   |                                                   | audiohd |
 Intel Comet Lake PCH cAVS                            | Dell Precision 3640 with i3-10100 CPU             | audiohd | David Stes
 LynxTWO AES16e                                       |                                                   |         |
 M-Audio Audiophile 192                               |                                                   |         |
 M-Audio Audiophile 2496                              |                                                   |         |
 M-Audio Delta 44/66/410/1010/1010LT series           |                                                   |         |
 M-Audio Delta DiO 2496                               |                                                   |         |
 M-Audio Delta TDIF                                   |                                                   |         |
 M-Audio OmniStudio USB (BETA)                        |                                                   |         |
 M-Audio Oygen8 MIDI keyboard                         |                                                   |         |
 M-Audio Revolution series                            |                                                   |         |
 M-Audio Sonica Theater USB (BETA)                    |                                                   |         |
 M-Audio USB AudioSport                               |                                                   |         |
 M-Audio USB MIDISPORT series                         |                                                   |         |
 MIDIMan DiO 2448                                     |                                                   |         |
 Microsoft LifeChat LX-6000 (USB)                     |                                                   |         |
 MSI K7T266                                           |                                                   |         |
 MSI KT3 Ultra                                        |                                                   |         |
 National Semiconductor Geode LX/NX/GX/GX1/GX2        | aka AMD Geode                                     |         |
 Nvidia CK8/CK8S                                      |                                                   |         |
 Nvidia High Definition Audio (MCP4/MCP51->MCP79)     |                                                   |         |
 Nvidia nForce motherboard chipsets                   |                                                   |         |
 Philips ToUcam Pro (mic) (BETA)                      |                                                   |         |
 Plantronics C510 / C520 (P/N: 88861-01)              |                                                   |         | Erik Irsch
 RealTek ALC1xx/ALC2xx/ALC6xx/ALC8xx                  |                                                   |         |
 RME Digi96/8 series                                  |                                                   |         |
 SiS 7012/7018                                        |                                                   |         |
 SiS High Definition Audio                            |                                                   |         |
 Terratec Aureon 7.1 (PCIe/USB/Dual USB)              |                                                   |         |
 Terratec DMX 6Fire USB                               |                                                   |         |
 Terratec EWS88D / EWS88MT / EWX 24/96 / PHASE 28     |                                                   |         |
 Trident 4DWave-CX/DX/NX                              |                                                   |         |
 TurtleBeach SantaCruz 6-speaker sound card           |                                                   |         |
 TurtleBeach Amigo II USB sound card/headset adapter  |                                                   |         |
 TurtleBeach Micro II USB sound card/digital adapter  |                                                   |         |
 ULI High Definition Audio                            |                                                   |         |
 VIA High Definition Audio                            |                                                   |         |
 VIA VT82C686/VT8233/VT8233A/8235/8237/VT82C686       |                                                   |         |
 Yamaha DS-XG YMF724/YMF734/YMF74x/YMF754             |                                                   |         |
 Yamaha PSR-1K USB MIDI Keyboard (BETA)               |                                                   |         |
 Yamaha UX16 USB MIDI interface (BETA)                |                                                   |         |

## Drives

 Type           | Manufacturer |  Model   | Works (yes/no)  | Notes and/or specific usage instructions | Contributor
 -------------- | ------------ | -------- | --------------- | ---------------------------------------- | ------------
 HDD 2.5 SATA-3 | Crucial      | M4-128GB | yes             | 25nm MLC SSD                             | Jason Matthews
 PCIe           | DDRdrive     | X1       | yes             | Intended as ZIL. Works flawlessly        | Jason Matthews
 HDD 3.5 SATA-3 | Hitachi      | HDS72404 | yes             | 4TB of "Spinning Rust" properly recognized on LSI Falcon|Jason Matthews
 HDD 2.5        | Intel        | 520      | yes             |                                          | Jason Matthews
 HDD 2.5        | Intel        | 710      | yes             |                                          | Jason Matthews
 PCIe           | Intel        | 910      | yes             | Works out of the box                     | Jason Matthews
 HDD 2.5 SATA-3 | Intel        | DC S3500 480GB | yes       | six drives configured in mirrors yields 50k+ random reads/sec on ZFS, reports as ashift=9|Jason Matthews
 HDD 2.5 SATA-3 | Intel        | DC S3700 800GB | yes       | Works as advertised, bench marking indicates 10% higher performance on 8k writes. Drives are 4K may or may not advertise 512bytes varies on firmware revision. Beware, you cannot mix 4K/512B drives within a VDEV | Jason Matthews
 HDD 3.5 SAS    | Seagate      | ST4000NM0023 | yes         | 4TB SAS spinning rust. Just works. 4K Advanced Sector  130MB/s seq writes | Jason Matthews
 HDD 3.5 SAS    | Seagate      | ST6000NM0014 | yes         | 6TB 7200-rpm 12Gb/s SAS HDD (4KN model, 512E model is ST6000NM0034) | Ken Mays
 SCSI           | Sun Microsystems |C5683A | yes            | SUN C5683A (HP Rebrand) DDS4 DAT Tape drive | Jon Green
 SATA           | Seagate/Dell|ST1000NM0001|yes|Disks not powered on (Dell Firmware problem), the trick is: in `/kernel/drv/sd.conf` set `sd-config-list="SEAGATE ST1000NM0001","power-condition: false";` | Jorge Palma Escobar
 HDD 3.5" SATA-2| Samsung      |F4EG HD204UI/Z4 | yes       | SATA - Advanced Format and 4K Sector drives | Deano Calver
 HDD 3.5" SATA-2| Seagate      |ST2000DL003-9VT1| yes       | Barracuda Green. 4kB sectors with 512-byte emulation | Matt Connolly
 HDD 2.5 SAS    | Seagate      |ST9146852SS     | yes       | 146GB 15k RPM Savvio                     | Jason Matthews
 HDD 2.5 SATA-3 | Western Digital | WD20NPVT-00Z | yes      | 2 TB SATA disk, reports as ashift=12 (adv format), recognized on LSI 9207-8i | Jason Matthews

## Network interface controllers

<div class="note" markdown="1">
!!! note
    For a number of NICs, which are not currently supported "out of the box" by the illumos kernel or OpenIndiana distribution, over 30 open-sourced drivers covering many more chipsets and NIC models are available as part of the separate "Free NIC drivers for OpenSolaris" project by Masayuki Murayama and generally do just work on OpenIndiana (binaries are available as part of the source code tarballs, but you're encouraged to recompile them with GLDv3 Makefile's on OpenIndiana, see details on [the project's web page](http://freenicdrivers.la.coocan.jp/)).
</div>

NIC                                                  | Works (yes/no)  | Notes                  | Driver | Contributor
---------------------------------------------------- | --------------- | ---------------------- | ------ | -----------
Asix AX88772A                                        | yes             |                        | axf    | Michal Nowak
Asix AX88772B                                        | no              |                        |        | Michal Nowak
Atheros AR8132 Fast Ethernet                         | yes             |                        | atge   | Gary Mills
Atheros AR8131 Gigabit Ethernet                      | yes             |                        | atge   | Gary Mills
Atheros AR8151 v1.0 Gigabit Ethernet                 | yes             |                        | atge   | Gary Mills
Atheros AR8151 v2.0 Gigabit Ethernet                 | yes             |                        | atge   | Gary Mills
Atheros AR8152 v1.1 Fast Ethernet                    | yes             |                        | atge   | Gary Mills
Atheros AR8152 v2.0 Fast Ethernet                    | yes             |                        | atge   | Gary Mills
AR8161 Gigabit                                       | no              | Toshiba Satellite L855 |        | Michal Nowak
Broadcom NetLink & NetXtreme I 57xx Gigabit adapters | yes             | BCM5700/5701/5703/5704/5705/5705M/5714/5721/5751/5751M/5782/5788 | bge | Ken Mays
Broadcom NetXtreme II Gigabit Ethernet               | yes             | Tested BCM5709         | bnx    | Jason Matthews
Broadcom NetXtreme II Gigabit Ethernet               | yes             | BCM5706, 5708, 5709, 5716 | bnx | Ken Mays
Broadcom NetXtreme II 10GbE controllers              | yes             | BCM57710, 57711, 57711E, 57712, 57800, 57810 | bnxe | Ken Mays
Intel 82540EM Gigabit Ethernet Controller            | yes             | PCI-ID: 8086:1000e     | e1000g | Ancoron Luciferis
Intel 82575, 82576, 82580, I210, I211, I340, I350, I354 | yes          |                        | igb    | Ken Mays
Intel 82563/6/7, 82571/2/3/4/8/9, 82583, I217-LM, I217-VM, I218-LM, I218-VM ethernet controllers | yes | Intel S1200 & Supermicro X10SAE motherboards. Added new PCI IDs. | e1000g | Ken Mays
Intel 82597EX 10GbE Ethernet Controller              | yes             |                        | ixgb   | Ken Mays
Intel 82574L                                         | yes             | `scanpci: pci bus 0x0003 cardnum 0x00 function 0x00: vendor 0x8086 device 0x10d3` Intel Corporation 82574L Gigabit Network Connection| e1000g | Gary Mills
Intel 82575EB                                        | yes             | pci bus 0x0001 cardnum 0x00 function 0x01: vendor 0x8086 device 0x10a7 | igb | Jason Matthews
Intel 82576                                          | yes             | pci bus 0x0002 cardnum 0x00 function 0x00: vendor 0x8086 device 0x10c9 | igb | Jason Matthews
Intel 82579LM                                        | yes             | In Dell Optiplex 9010 workstation. | e1000g | Michal Nowak
Intel Ethernet Connection (11) I219-LM               | yes             | In Dell Precision 3640 workstation. | e1000g | David Stes
Intel 82599EB 10-Gigabit SFI/SFP+                    | yes             | Tested on 151a8, could work on older releases. Performance moderately sucks on a dell r720. RX is good, TX is poor. On an r820 TX performance is less than that of 1g ethernet most of the time. | ixgbe | Jason Matthews
Intel I210 Gigabit Network                           | no             | Partly works with the igb driver but DHCP fails on this card for me | igb | David Stes
Intel I350 Gigabit Network                           | yes             |                         |       | Christof Haemmerle
Intel X520, Intel X540, Intel 82598, 82599 series (10Gb) | yes         |                         | ixgbe | Ken Mays
Realtek RTL8101/RTL8110/RTL8168/RTL8169              | yes             | Supercedes rge driver for most Realtek 81xx/816x PCI-E ethernet adapters as of gani-2.6.10. See: RTL8111B/RTL8168B/RTL8111/RTL8168/RTL8111C/RTL8111CP/RTL8111D(L)/RTL8168C/RTL8111DP/RTL8111E/RTL8168E/RTL8111F/RTL8411 | gani  | Ken Mays
Realtek RTL8101E/8102E PCI Express Fast Ethernet controller | yes      | Onboard controller for MSI G31TM-P21 motherboard | rge | Philip Robar
Realtek RTL8139/8139C/8139C+ PCI Express Fast Ethernet controller | yes | PCI-ID: 10ec:8139      | rtls  | Ancoron Luciferis
Realtek RTL8111/8168B PCI Express Gigabit Ethernet controller (rev 03) | yes | PCI-ID: 10ec:8168 | rge | Ancoron Luciferis
Realtek RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet controller | yes | Onboard ASUS PRIME B550-PLUS | rge | David Stes
Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller | yes | PCI-ID: 10ec:8168 | rge | Predrag Zečević
Realtek RTL-8169 Gigabit Ethernet (rev 10)           | yes             | PCI-ID: 10ec:8169       | rge | Ancoron Luciferis

## External disk arrays

Manufacturer | Model           | Works (yes/no) | Notes and/or specific usage instructions | Contributor
-----------  | --------------- | -------------- | ---------------------------------------- | ------------
3PAR         | F200            | yes            | Fabric/FC with MPxIO                     | Matt Wilby
3PAR         | F400            | yes            | Fabric/FC with MPxIO                     | Matt Wilby
EMC          | Clariion CX700  | yes            | Fabric/FC with MPxIO                     | Matt Wilby
Newisys/Sanmina-SC | NDS2241   | yes            | SAS with MPxIO                           | Jason Matthews
Nexsan       | SATABeast2      | yes            | Fabric/FC with MPxIO                     | Matt Wilby
NetApp       | FAS6040         | no             | Sees targets but refuses to see LUNs.  Possibly HBA FW issue. | Matt Wilby
EMC          | Symmetrix DMX-4 | yes            | Fabric/FC with MPxIO                     | Tom Kranz
HDS          | UPS-V           | yes            | Fabric/FC with MPxIO                     | Tom Kranz
HDS          | AMS-500         | yes            | Fabric/FC with MPxIO                     | Tom Kranz
Sun          | A5000 (Photon)  | yes            | FC-AL with MPxIO                         | Tom Kranz
Sun          | T3              | yes            | Fabric/FC with MPxIO                     | Tom Kranz

## Graphics Adapters

<div class="note" markdown="1">
!!! note
    For most video cards, which are not explicitly supported, vgatext driver will work, but will not provide any DRI capabilities.
    Systems with combined discrete graphics and Intel integrated adapter (like Nvidia Optimus) are likely to be unusable with Xorg.
</div>

Video adapter                            | Works (yes/no/vgatext) | Notes and/or specific usage instructions | Driver |  Contributor
---------------------------------------- | ---------------------- | ---------------------------------------- | ------ | ------------
Intel 945GM Express                      | yes                    |                                          | i915   | Michal Nowak
Intel 945GM Graphics                     | no                     | Dell Latitude D620. Tested at 1280x800 resolution (crashes, seems problematic in NVIDIA Optimus configurations) | |
Intel GMA 950                            | yes                    |                                          | i915   | nikolam
Intel HD Graphics 520                    | yes                    | HP 15t Laptop (Part#: V1Z72AV_1). Tested at 1920x1080. | i915 |
Intel HD Graphics 530                    | no                     | HP ZBook Studio G3. Crashes, system has both discrete graphics and Intel graphics | |
Intel CometLake-S GT2 [UHD Graphics 630] | no                     | Dell Precision 3640 with i3-10100 CPU, does NOT work for X11/MATE, only text console | vgatext | David Stes
Intel HD Graphics 2000                   | yes                    | ThinkCentre M91p. Working, tested from 1024x768 to 1920x1080, GPU hangs and wrong screen adjustment. | i915 |
Intel HD Graphics 3000                   | yes                    | Lenovo ThinkPad X220. Has a [glitch](https://www.illumos.org/issues/8757) on embedded display ([workaround](https://www.illumos.org/issues/8049#note-7)). Display Port & VGA D-Sub work. | i915 | Michal Nowak
Intel HD Graphics 4000                   | yes                    |                                          | i915   | Aurélien Larcher
Intel HD Graphics 4600                   | yes                    | Dell Precision M2800. Tested at 1920x1080. | i915 |
Intel Iris Pro Graphics                  | yes                    |                                          | i915   | Martin Bochnig
Intel Iris Pro Graphics P6300            | yes                    | Tested at 1920x1080 (Intel Xeon E3-1285V4 w/Supermicro X10SLH-F motherboard) | i915 |
Intel Iris Pro Graphics 580              | yes                    | Tested at 1920x1080. (Intel Core i7-6785R, BGA1364 socket) | i915 |
Intel UHD Graphics 620                   | yes                    | Thinkpad T580. OI-Hipster MATE 2017.10, 2D (UXA)/3D Visual Effects works - Xserver 1.19.5, 3840x2160 resolution | i915 |
NVIDIA GeForce GT 710                    | yes                    | nvidia-390 package (390.157)             | nvidia | David Stes
NVIDIA GeForce GT 730                    | yes                    | Nvidia 340.107                           | nvidia | Gary Mills
NVIDIA GeForce 210                       | yes                    | PCI-ID: 10de:0a23, Nvidia 340.107        | nvidia | Alex Viskovatoff
NVIDIA GeForce 220                       | yes                    | Nvidia 340.107                           | nvidia | Guy
NVIDIA GeForce 8400 GS                   | yes                    | PCI-ID: 10de:06e4, Nvidia 340.107        | nvidia | Ancoron Luciferis
NVIDIA GeForce GT 430                    | yes                    | Nvidia 340.107                           | nvidia | openbabel
NVIDIA GeForce GT 440                    | yes                    | Nvidia 390.143                           | nvidia | David Stes
NVIDIA GeForce GT 620                    | yes                    | PCI-ID 10de:0f01, Nvidia 340.107         | nvidia | Michael Kruger
NVIDIA GeForce GTX 480                   | yes                    | PCI-ID: 10de:06c0, Nvidia 340.107        | nvidia | catable
NVIDIA GeForce GTX 580                   | yes                    | Nvidia 340.107                           | nvidia | Vladimir Smirnov
NVIDIA GeForce GTX 780 Ti                | yes                    | PCI-ID: 10de:100a, Nvidia 340.107        | nvidia | Yoweri Museveni
NVIDIA GeForce GTX 765M                  | yes                    | PCI-ID: 10de:11e2, Nvidia 340.107        | nvidia | WarGrey Ju
NVIDIA GeForce GTX 780M                  | yes                    | PCI-ID: 10de:119f, Nvidia 340.107        | nvidia | Jim Gorzelany
NVIDIA GeForce GTX 880M                  | yes                    | PCI-ID: 10de:1198 - Tested on Asus ROG G750JZ with hipster-070114 ISO | nvidia | Mike Kelley
NVIDIA GeForce TITAN X                   | yes                    | Nvidia 340.107                           | nvidia | John Hahnua
NVIDIA Titan Xp                          | yes                    | [Nvidia 390.67](http://http.download.nvidia.com/solaris/390.67/NVIDIA-Solaris-x86-390.67.run) | nvidia | Ken Mays
AMD/ATI Radeon HD 4770 [RV740] PCI-e     | vgatext                | PCI-ID: 1002:94b3 - DVI ports work (but trying to rotate broke X) - overall resolution limited to 2560x2560 | vgatext | Ancoron Luciferis
AMD/ATI Radeon HD 5770 PCI-e             | vgatext                | PCI-ID: 1002:68b8 - DVI ports work (but trying to rotate broke X) - overall resolution limited to 2560x2560 | vgatext | Ancoron Luciferis
ASUS EAH4350 (ATI RV710 - Radeon HD 4350)| vgatext                | Have only tried the DVI port             | vgatext | Philip Robar
ATI Radeon VT7000 (VisionTek VTKRad7K64P)| vgatext                | PCI-ID: 1002:4c59, DVI port works (only port tested) | vgatext | Eduardo Sanchez
AMD Mobility Radeon 5730/6570M           | vgatext                | Not 3D HW-accelerated                    | vgatext | gweiss
AMD Radeon HD 7670M                      | vgatext                | PCI-ID: 1002:6840 - nor HDMI nor VGA output (D-Sub) work | vgatext | Michal Nowak

## Motherboards

Manufacturer |  Model                             | Drivers     | Notes                                                 | Contributor
------------ | ---------------------------------- | ----------- | ----------------------------------------------------- | --------------
ASRock       | 939Dual-VSTA/                      |             | works correctly                                       | Johan Sanchez
ASRock       | 870iCafe                           |             | Test System: AMD Phenom II X6 1055T                   | Dave Koelmeyer
ASRock       | B150M-ITX                          |             |                                                       |  
ASRock       | H170M-ITX/DL                       |             |                                                       |  
ASRock       | M3A770DE                           |             | Test System: AMD Phenom II X6 1090T, 4x 4GB DDR3      | Marc D. Williams
ASRock       | N68C-GS FX                         |             | Test System: AMD Phenom X4 9550, 2x4GB DDR2<br/>needed to  `# update_drv -a -i '"pci10de,3d6"' nvidia` <br/> and   `# update_drv -a -i "pci10de,3f6" nv_sata` and manually update ogl-select to NVIDIA using NVIDIA driver 173.14.32 | Richard PALO
ASRock       | B150M Pro4S                        |             | Works (with USB Legacy set to ""auto""); Added:<ul><li>NVIDIA graphics (no onborad "Intel" is supported)</li><li>Network card (onborad "Intel Corporation Ethernet Connection (2) I219-V" not supported)</li><li>PCIe USB 2.0 card (no USB 3.0 support yet; Internal USB 2.0 is not recognized)</li></ul> | Predrag Zečević
ASUS         | C60M1-I                            |             | Test System: 2x 2GB, Passively cooled with 4 of 6 SATA ports in use | Justin Warwick
ASUS         | H97I-PLUS                          |             |                                                       |  
ASUS         | H110I-PLUS/CSM                     |             |                                                       |  
ASUS         | P7H55-M Pro                        |             |                                                       | Apostolos Syropoulos
ASUS         | M2N                                |             | Everything OK including sound                         | Johan Sanchez
ASUS         | M2NPV-VM                           |             |                                                       | Gary Mills
ASUS         | A8N-SLI Deluxe                     |             |                                                       | Alex Viskovatoff
ASUS         | A8V-XE                             | vr audio hd | boots from pata and sata everything works perfectly   | Johan Sanchez
ASUS         | KPGE-D16                           |             |                                                       |
ASUS         | M2N-SLI Deluxe                     |             |                                                       | Alex Viskovatoff
ASUS         | M4N68T-M V2                        |             | NVIDIA GeForce 7025 / nForce 630a motherboard         |  
ASUS         | M4A77D                             | rge         | Works correctly                                       | Quentin Sanchez
ASUS         | P5N-D                              |             | Works perfectly including sound                       | Johan Sanchez
ASUS         | P5N-T Deluxe                       | nv_sata, nge, mpt-sas, e1000g | Intel Q9550, 8 GB RAM, NVIDIA nForce 780i SLI chipset, LSI 9201-16i, Intel PRO/1000 Dual Port Ethernet. | Chris Kurlinski
ASUS         | P5B-Plus Vista Edition             |             | Intel QX6800, 4 GB RAM, NVIDIA 9400 GT. Running with 8 HDD (1 from JMicron Internal SATA and 1 from JMicron eSATA as OS boot, mirrored in OI. Running AHCI on remaining 6 HDD on Intel ICH8R and RAIDZ1 in OI.  Take note: The board has 2 SATA controllers, Intel ICH8R and JMicron JMB363. OpenIndiana can only see drives in AHCI mode for JMicron. RAID mode will not work. Intel controller works fine. | Dedy Johan
ASUS         | P5Q3                               | rge         | Everything works ok                                   | Johan Sanchez
ASUS         | P5SQPL-AM                          |             | Everything works ok                                   | Johan Sanchez
ASUS         | P8H77-I                            |             | Intel Celeron G1610, 8GB RAM, onboard video. Using ASMedia ASM1061-based 2-port SATA /eSATA card. Total 7 HDDs (6 data disks on onboard connectors, 1 OS disk on add-on card).  Realtek RTL8111F SUPPORTED. All other components SUPPORTED except onboard Intel USB 3.0 controller. | Dedy Johan
ASUS         | PRIME B350M-A CPU: AMD Ryzen 3 1200 Quad-Core    | All devices have drivers except for the Platform Security Processor | Had to set Power supply idle in BIOS setup to Typical in order to ensure stability. | Gary Mills
ASUS         | PRIME B550-PLUS CPU: AMD Ryzen 7 5800X    | Disabled AMD IOMMU in Advanced AMD CBS (Common Bios Specification) | ASUS UEFI BIOS Ver 3405 (American Megatrends 12/13/2023) | David Stes
CLEVO        | L287                               |             | Everything works                                      | Johan Sanchez
DELL         | OPTIPLEX GX520                     |             | Everything works and system shutdown is ok            | Johan Sanchez
DELL         | OPTIPLEX 330                       |             | Works ok X ok                                         | Johan Sanchez
Gigabyte     | GA-990FXA-UD3                      |             | Etron Technology USB3.0 controllers are unsupported, otherwise the motherboard is compatible. | Dave Koelmeyer
Gigabyte     | K8NUSLI                            |             | 151_a9 : All except audio works (ALC850 ) boots from pata and sata. hipster crashes after boot -r | Johan Sanchez
Gigabyte     | GA-770TA-UD3                       | rge, audiohd, ahci | Test System: AMD Phenom II X6 1090T, 4x 2GB DDR3, AMD/ATI Radeon HD 5770 PCI-e<ul><li>Marvell 88SE9128 SATA-3 controller: UNSUPPORTED (should be disabled, otherwise expect kernel panic at boot)</li><li>NEC USB-3 controller: UNSUPPORTED</li><li>Everything else seems to work quite well</li></ul> | Ancoron Luciferis
Gigabyte     | GA-MA785GMT-UD2H                   | rge, ahci   | Test System: AMD 240e<ul><li>No issues (rge not extensively tested, was not reliable in earlier opensolaris builds).</li><li>ECC RAM: UNSUPPORTED (although accepts ECC unbuffered RAM)</li></ul> | James D. Brenton
Gigabyte     | GA-790XTA-UD4                      | audiohd, rge, ahci, pci-ide, ohci, ehci, hci1394 | Test System: AMD Phenom II X4 955, 4x 2GB DDR3, AMD/ATI Radeon HD 4770 PCI-e<ul><li>Marvell 88SE9128 SATA-3 controller : UNSUPPORTED (should be disabled, otherwise expect kernel panic at boot)</li><li>NEC USB-3 controller: UNSUPPORTED</li><li>Everything else seems to work quite well</li></ul> | Ancoron Luciferis
Gigabyte     | GA-EG31MF-S2                       |             |                                                       | Dave Koelmeyer
Gigabyte     | GA-EP45-DS3R                       |             |                                                       | Erol Zavidic
Gigabyte     | GA-EP45-UD3R                       |             | Works when "Enhanced Intel Speedstep Technology" (CPU EIST Function) is disabled in BIOS. (Intel speedstep causes abnormally high kernel CPU usage). | Michael Kruger
Gigabyte     | GA-F2A78M                          |             |                                                       | Johan Sanchez
Gigabyte     | GA-P67A-UD7-B3                     |             | Test System: LGA 1155 Sandy Bridge 2600K<ul><li>Marvell 88SE9128 SATA controller: UNSUPPORTED</li><li>P67A SATA controller: SUPPORTED</li><li>RealTek RTL8111E Ethernet: SUPPORTED (despite being warned off!)</li></ul> | Lou Picciano
Gigabyte     | P45T-ES3G                          |             | Works when "Enhanced Intel Speedstep Technology" (CPU EIST Function) is disabled in BIOS. (Intel speedstep causes abnormally high kernel CPU usage). | Michael Kruger
Gigabyte     | B460MADRUSPRO                      |             | Intel(R) Core(TM) i5-10400F, BIOS American Megatrends Inc. F4   | Carl
Gigabyte     | H370M-D3H                          |             | Intel(R) Core(TM) i5-8400, BIOS American Megatrends Inc. F2     | Carl
Hewlett-Packard | Workstation XW4200              |             | Works Ok.  X with Nvidia gt9600 and 340.93 tested OK | Johan Sanchez
IBM          | ThinkCentre                        |             | Works ok with bge0 and integrated graphics           | Johan Sanchez
Intel        | D510MO                             |             | Live CD will only boot with BIOS set to USB Legacy=Disable. Note, this also results in USB keyboard not usable in GRUB menu (annoying), but works once OS has booted. Only supports VESA graphics driver. | Matt Connolly
Intel        | DG43GT                             |             | Works without any known problems - Basic desktop board with Intel G43 Express chipset, Pro 1000 LAN, Realtek Audio | Michael Kruger
Intel        | S1200BTLR                          |             | Works                                                | Marcel Telka
Intel        | S1400FP2 / S1400FP4                |             |                                                      |  
Intel        | S1                                 |             |                                                      |  
Intel        | S2600 (CP/GZ/IP)                   |             |                                                      |  
MSI          | B150I                              |             |                                                      |  
MSI          | G31TM-P21                          | rge, audiohd | Intel G31/ICH7 Chipset<ul><li>Realtek RTL8101/8102E: SUPPORTED</li><li>ICH7 audio: SUPPORTED</li><li>Intel GMA3100: UNKNOWN (I haven't tried the built-in video)</li></ul> | Philip Robar
MSI          | MS 7069                            | bge         | works with Celeron 3ghz X with onboard graphics      | Quentin Sanchez
MSI          | MS 7301                            | vr          | works with Pentium D and X                           | Quentin Sanchez
SuperMicro   | A1SAi-2750F                        |             |                                                      |  
SuperMicro   | A1SRi-2758F                        |             |                                                      |  
SuperMicro   | H8SGL-F                            |             |                                                      | Richard Palo
SuperMicro   | X7DB8                              | mpt, e1000  |                                                      | Jason Matthews
SuperMicro   | X7BSi                              |             | Test System: Using a lower-speed Xeon Quad and 8GB ECC memory, plus two Seagate 7200.11 disks.<ul><li>IPMI: SUPPORTED</li></ul> | anonymous
SuperMicro   | X7SPA-H                            | e1000g ahci | Test System: Atom D510. <ul><li>Intel 82574L Ethernet: SUPPORTED</li></ul> | Cyril Plisko
SuperMicro   | X8DTU-6F+                          |             |                                                      | Geoff Flarity
Supermicro   | X8SI6-F                            |             | <ul><li>LSI 2008 8-Port 6Gbps SAS Controller: SUPPORTED</li><li>Intel 82574L Ethernet: SUPPORTED</li><li>IPMI: SUPPORTED</li></ul> | Alexander Lesle
Supermicro   | X8SIA-F                            |             | <ul><li>Intel 82574L Ethernet: SUPPORTED</li><li>IPMI 2.0 (IPMI View v2.7.19): SUPPORTED</li></ul> | Alexander Lesle
Supermicro   | X8SIL-F                            |             | <ul><li>Intel 82574L Ethernet: SUPPORTED</li><li>IPMI: SUPPORTED</li></ul> | Alexander Lesle
Supermicro   | X9SCM-F-O                          | mpt/sd, usb_mid/hid, e1000g, vgatext, ahci/sd | Test System: 4x 4-gig ECC DIMMs and an Intel E3-1220 CPU.<ul><li>Intel 82574L Ethernet: SUPPORTED</li><li>Intel 82579LM Ethernet: SUPPORTED</li><li>IPMI: SUPPORTED</li></ul> | Gary Mills
Supermicro   | X9SCA-F                            | mpt/sd, usb_mid/hid, e1000g, vgatext/matrox-graphics, ahci/sd | Test System: 4x 4-gig ECC DIMMs and an Intel E3-1270 CPU.<ul><li>Intel 82574L: SUPPORTED</li><li>IPMI: SUPPORTED</li></ul> | Jon Strabala
Supermicro   | X9DRi-LN4F+                        |             |                                                      | Christof Haemmerle
Supermicro   | X9DRH-IF                           |             | Test System: 2x XEON E5-2609, 16x8GB ECC DIMMs<ul><li>SATA only working on AHCI ports not SCU ports</li></ul> | Carsten
Supermicro   | X9DRD-7LN4F-JBOD                   | mga, ahci   |                                                      | Ken Mays
Supermicro   | X10SLM-F                           | npe, e1000g, vgatext, igb, pcieb | igb and e1000g compiled from illumos git source, for SOL console sol1 use ttyb | Carsten Grzemba
Tyan         | Tomcat K8E (S2865 AG2NRF)          |             |                                                      | Ken Gunderson
Tyan         | S2927-E                            |             | Tyan Thunder n3600B S2927-E (S2927G2NR-E) motherboard| Ken Mays
Tyan         | S5510GM3NR                         |             | Test System: Xeon LGA1155 C204 with Intel Core i3 2100.<ul><li>IPMI: SUPPORTED with BIOS V2.01c or bug [#2560](https://www.illumos.org/issues/2560) fix.</li></ul> | Gary Mills
Zotac        | G43ITX-A-E                         |             | Intel Q8400, 4 GB RAM, onboard Intel X4500 VGA (see note below).<br/>Running with 8 HDDs:<br><ul><li>5 using Intel ICH10R internal SATA (AHCI)</li><li>1 using Intel ICH10R eSATA (AHCI)</li><li>2 using add-on ASMedia ASM1061 PCI-E X1 SATA card (Device supported and detected by OI but HDD not detected. Possibly due to other unrelated issues. Still testing.)</li></ul>Note: The Intel X4500 VGA adapter will throw up some errors pertaining to "regiter error" and "vga init error" either during setup or boot. However, it will still work fine and OI will install / boot without problems. Unsupported driver issues? | Dedy Johan

## Peripheral Devices

### Monitors

Manufacturer | Model          | Description                                         | Works (yes/no) | Notes and/or specific usage instructions | Contributor
------------ | -------------- | --------------------------------------------------- | -------------- | ---------------------------------------- |---------------
Sun          | X7236A-N       | 24.1-Inch TFT LCD Color Monitor                     | yes            |                                          |
Samsung      | PX2370         | 23" LED Monitor                                     | yes            | HDMI2.0/DisplayPort 1.2a                 |
Samsung      | LU28H750UQNXZA | 28" UH750 QLED UHD Monitor (3840 x 2160 resolution) | yes            | HDMI2.0/DisplayPort 1.2a                 |

### Keyboards/Mice

Manufacturer  | Model                      | Works (yes/no)  | Notes and/or specific usage instructions |  Driver |Contributor
------------- | -------------------------- | --------------- | ---------------------------------------- | ------- | -----
Logitech      | TrackMan Wheel             | yes             |                                          |         |
Logitech      | K120 Keyboard              | yes             |                                          |         |
Microsoft     | Basic Optical Wheel Mouse  | yes             |                                          |         |
Microsoft     | Wired Keyboard 600         | yes             |                                          |         |
Sun           | Type 6 USB Mouse           | yes             | Middle button does not work.             | usbms   |
Razer         | Cynosa V2 Keyboard         | yes             |                                          |         |
Logitech      | G102 LIGHTSYNC Mouse       | yes             |                                          |         |

### Printers

Manufacturer  | Model                        | Works (yes/no)  | Notes and/or specific usage instructions |  Driver     | Contributor
------------- | ---------------------------- | --------------- | ---------------------------------------- | ----------- | -----------
Brother       | MFC-9970CDW                  | yes             |                                          |             |
Canon         | PIXMA MG8120                 | yes             |                                          |             |
Canon         | imageCLASS D420              | yes             |                                          |             |
Epson         | WorkForce 840                | yes             |                                          |             |
HP            | Officejet Pro 8500 series    | yes             |                                          |             |
HP            | Envy 100 (D410a)             | yes             |                                          |             |
HP            | Color LaserJet CM3530fs MFP  | yes             |                                          |             |
Lexmark       | X543dn/X544(dn/dw)/X546dtn   | yes             |                                          |             |
Oki           | MB480 MFP                    | yes             |                                          |             |
Oki           | CX2731 MFP                   | yes             |                                          |             |
Samsung       | SCX-3205                     | yes             | Install `print/splix`.                   | scx3200.ppd | Michal Nowak
Xerox         | WorkCentre 6400              | yes             |                                          |             |

## Serial Controllers

Manufacturer  | Model                        | Works (yes/no)  | Notes and/or specific usage instructions |  Driver |Contributor
------------- | ---------------------------- | --------------- | ---------------------------------------- | ------- | -----
Keyspan       | USA-19HS                     | yes             | USB DB9M Serial adapter.<br/>Note: Does not play well with APC UPS and results in connection failures.|usbsksp| Jon Green
MOXA          | CP-102EL-DB9M                | yes             | 2-Port serial PCI-Express card<br/>2-Port PCIe Board with DB9M RS-232 cable.<br/>Use Solaris 10 drivers available from MOXA site (works with APC UPS)| mxsieboard| Jon Green
StarTech      | PEX2S553                     | no              | 2-Port serial PCI-Express card           |         | Jon Green

## Storage Controllers

Manufacturer | Model  | Controller | Assic | Connectors  | Works (yes/no) | Notes and/or specific usage instructions | Driver  |  Contributor
------------ | ------ | ---------  | ----- | ----------  | -------------- | ---------------------------------------- | ------  | -----------
3Ware        | SAS 9550SX/9650SE/9690SA/9750 controller series                      | LSI 9207-4i4e | LSI SAS2108/2208/2308 | 1x SFF-8087, 1x SFF-8088 | yes | | mr_sas | Ken Mays
Adaptec      | 6405, 6445, 6805, 7805,78165, 71605, 71685, 72405, 8805, 8885, 81605 | PMC        | PMC 8001 and others | SFF         | yes            | | aacraid | Ken Mays
Adaptec      | 29320LPE Ultra320 Single Channel Low-Profile PCIe x1 SCSI Card       | 29320LPE   | Adaptec 29320       | 1x VHDCI (External)<br/>1x LVD (Internal) | yes | | adpu320 | Jon Green
Addonics     | Hybrid HDD - mSATA SSD Controller (AD2SAHMSA)                        | AD2SAHMSA  | Marvell 88SE9128    | 1 x SATAIII (internal)<br/>1 x mSATA | yes | | ahci | Marcel Telka
Areca        | SATA II RAID Controller driver (ARC-11xx/12xx/16xx/18xx)             | ARC-1880   | LSI SAS2308         | 2x SFF-8087 | yes | | arcmsr  | Garrett D'Amore
Avago        | SAS 9305 Controllers  (12Gb/s SAS-3 Compliant)                       | Avago 9305-16i | LSI SAS3224     | 4 x SFF8643 | yes | To use sas3ircu (wwn to bay assignment, led alerting), read <https://www.illumos.org/issues/6784> | mpt_sas | Guenther Alka
Axago        | Axago PCES-SA                                                        | PCES-SA    | ASMedia ASM1062 (according pci.ids) / ASM1061 (on the chip) | 2 x SATAIII (internal) | yes | | ahci    | Marcel Telka
Axago        | Axago                                                                | PCIS-60    | SiI3124-2                                                   | 4x SATAII   | yes | | si3124  | Milan Jurik
Broadcom     | SAS 9305 Controllers  (12Gb/s SAS-3 Compliant)                       | Avago 9305-16i | LSI SAS3224 | 4 x SFF8643 | yes | To use sas3ircu (wwn to bay assignment, led alerting), read <https://www.illumos.org/issues/6784> | mpt_sas | Guenther Alka
Dell         | PERC H200/H220i SAS/SATA 6Gb/s PCIe 2.0 controllers                  | LSI 9212-4i4e | LSI SAS2004/2008/2108/2116                               | 4x SFF-8087, 1x SFF-8088 | yes | | mpt_sas | Ken Mays
Dell         | PERC H310/H700/H710/H710P/H800/H810 SAS/SATA 6Gb/s PCIe 2.0 controllers | LSI 9207-4i4e | LSI SAS2108/2208/2308                                 | 1x SFF-8087, 1x SFF-8088 | yes | | mr_sas | Ken Mays
Emulex       | Emulex LP8000                                                        |               |                         | SC                       | yes | | emlxs  | Johan Sanchez
HP           | H210i/H220/H220i/H221/H222 SAS/SATA 6Gb/s PCIe 2.0 controllers       | LSI 9207-4i4e | LSI SAS2108/2208/2308                                    | 1x SFF-8087, 1x SFF-8088 | yes | | mr_sas | Ken Mays
HP           | Smart Array SAS/SATA PCIe Controllers (5i/6i, 5xx/5xxx/6xx/6xxx, E200/200i, P2xx/4xx/5xx/6xx/7xx) | P411/256 | SA-P411 | 2x SAS ports |yes | | cpqary3 | Ken Mays
IBM          | M1015/M1115/M5014/M5015/M5016/5025/5110/5120 SAS/SATA 6Gb/s PCIe 2.0 controllers | LSI 9207-4i4e | LSI SAS2108/2208/2308                    | 1x SFF-8087, 1x SFF-8088 | yes | | mr_sas | Ken Mays
IBM          | ServeRAID H1110 SAS/SATA 6Gb/s PCIe 2.0 controllers                  | LSI 9212-4i4e | LSI SAS2004/2008/2108/2116                               | 4x SFF-8087, 1x SFF-8088 | yes | | mpt_sas | Ken Mays
Intel        | RS25AB080/ RMS2AF040/RS2WC040/RS2WC080 6Gb/s PCIe 2.0 controllers    | LSI 9207-4i4e | LSI SAS2108/2208/2308                                 | 1x SFF-8087, 1x SFF-8088 | yes | |  mr_sas | Ken Mays
Intel        | SASWT4I/SASUC8I                                                      |                | LSI SAS1064, SAS1068 |    | yes | | mpt | Jason Matthews
LSI          | SAS 3008 Controllers - LSI SAS 9300 / LSI SAS 9311 12Gb/s SAS HBAs (SAS 3.0-compliant) | LSI 9300-4i4e |  LSI SAS3008 | 1 Mini-SAS HD SFF-8643 | yes | To use sas3ircu (wwn to bay assignment, led alerting), read <https://www.illumos.org/issues/6784> | mpt_sas | Ken Mays
LSI          | SAS 3041E-R/SAS 3442E/SAS 3442X/SAS 3801E/SAS 3801X                  |                | LSI SAS1064, SAS1068 |    | yes | | mpt | Gary Mills
LSI          | 9200/9201/9202/9210/9211/9212 SAS/SATA 6Gb/s PCIe 2.0 controllers    | LSI 9212-4i4e | LSI SAS2004/2008/2108/2116                               | 4x SFF-8087, 1x SFF-8088 | yes | | mpt_sas | Ken Mays
LSI          | 9207/9217/9240/9260/9261/9262/9264/9265/9266/9270/9271/9280/9281/9285/9286 6Gb/s PCIe 2.0 controllers | LSI 9207-4i4e | LSI SAS2108/2208/2308   | 1x SFF-8087, 1x SFF-8088 | yes | |  mr_sas | Ken Mays
LSI          | SAS 9305 Controllers  (12Gb/s SAS-3 Compliant)                       | Avago 9305-16i | LSI SAS3224 | 4 x SFF8643 | yes | To use sas3ircu (wwn to bay assignment, led alerting), read <https://www.illumos.org/issues/6784> | mpt_sas | Guenther Alka
Oracle       | Sun StorageTek 6Gb/s SAS-2.0                                         | LSI 9207-4i4e | LSI SAS2108/2208/2308   | 1x SFF-8087, 1x SFF-8088 | yes | | mr_sas | Ken Mays
QLogic       | 2340                                                                 | ISP 2312       |                      |    | yes | initiator works | | Johan Sanchez
StarTech.com | StarTech.com 4 port PCI SATA RAID controller <br/> (Silicon Image (SI) 3114 - 4 port SATA raid card) |  SI 3114 | Sil3114 | 4 x SATA150 | yes | For illumos to recognize the drives, the card must be flashed with the IDE version of the BIOS | | Hugo Wilkinson
Supermicro   | SMC2008-iMR - SAS/SATA 6Gb/s PCIe 2.0 controllers                    | LSI 9207-4i4e | LSI SAS2108/2208/2308   | 1x SFF-8087, 1x SFF-8088 | yes | | mr_sas | Ken Mays
Syba         | IOCrest SI-PEX40108 | Marvell 88SE9215 |   | 4 x SATA | no | | | Gary Mills
Vantec       | UGT-ST220R                                                           | Sil3512        |                      | 2x SATA  |  no | | | Eduardo Sanchez

## Webcams

Manufacturer  | Model                        | Works (yes/no)  | Notes and/or specific usage instructions                         |  Driver |Contributor
------------- | ---------------------------- | --------------- | ---------------------------------------------------------------- | ------- | -----
Creative      | Creative Live! Cam Optia     |  no             | Error while accessing video device Generic USB videoclass device | usbvc   | Gary Mills
Logitech      | C310 HD Webcam               |  yes            |                                                                  | usbvc   | Russell Aspinwall
Logitech      | Webcam C905                  |  yes            |                                                                  | usbvc   | Aurélien Larcher
Logitech      | HD Pro Webcam C920           |  yes            |                                                                  | usbvc   | Franklin Morier
Logitech      | Webcam C930e                 |  no            | xhci USB 3.1 attached to Dell Precision 3640, Microphone works fine with audacity, no video applications on OpenIndiana to test video with this webcam | usbvc   | David Stes
Philips       | Webcam SPC2050NC Pro         |  yes            |                                                                  | usbvc   | Ken Mays
Trust         | SpotLight Webcam Pro         |  yes            |                                                                  | usbvc   | Udo Grabowski

## WiFi Adapters

Manufacturer  | Model                             | Works (yes/no)  | WiFi standard    | Notes and/or specific usage instructions                         |  Driver |Contributor
------------- | --------------------------------- | --------------- | ---------------- | ---------------------------------------------------------------- | ------- | -----
ASUS          | USB-AC50 (chip: MediaTek MT7610U) | no              | 802.11a/b/g/n/ac | USB 2.0 dongle                                                   |         | Michal Nowak
Atheros       | AR242x                            | yes             | 802.11abg        | PCI Express (pci168c,1c)                                         | ath     | Ken Mays
Atheros       | AR5523                            | yes             | 802.11b/g        | USB                                                              | uath    | enricop
Atheros       | AR5000 series                     | yes             | 802.11b/g        | Mini PCI Express.                                                | ath     | enricop
Atheros       | AR5006                            | yes             | 802.11b/g        | Mini PCI Express. ASUS Eee PC 900A                               | ath     | Albert Lee
Atheros       | AR5007EG                          | yes             | 802.11b/g        | Mini PCI Express. Acer Aspire One AOA110                         | ath     | Albert Lee
Atheros       | AR9285                            | yes             | 802.11b/g/n      | Mini PCI Express. ASUS Eee PC 1005PE                             | arn     | Gary Mills
Atheros       | AR9485                            | no              | 802.11b/g/n      | Mini PCI Express. Toshiba Satellite L855                         |         | Michal Nowak
Broadcom      | BCM4313                           | yes             | 802.11b/g/n      | [NDIS](https://www.illumos.org/issues/3367)                      | bcmndis | Jim Klimov
D-Link        | DWA-171                           | yes             | 802.11abgn+ac    | USB 2.0                                                          | rtl     | Ken Mays
D-Link        | DWA-192                           | yes             | 802.11abgn+ac    | USB 3.0                                                          | rtl     | Ken Mays
D-Link        | DWA-582                           | yes             | 802.11abgn+ac    | PCI Express (PCIe)                                               | rtl     | Ken Mays
D-Link        | DWL-G122                          | yes             | 802.11b/g        | USB                                                              | rum     | Jay Undernet
Edimax        | AC600 (type: EW-7811UTC, chip: rtl8812au) | no      | 802.11a/b/g/n/ac | USB 2.0 dongle                                                   |         | Michal Nowak
Intel         | Intel PRO/Wireless 2100           | yes             | 802.11b          | Mini PCI                                                         | ipw     | Albert Lee
Intel         | Intel PRO/Wireless 2200BG         | yes             | 802.11b/g        | Mini PCI                                                         | iwi     | Albert Lee
Intel         | Intel PRO/Wireless 2915ABG        | yes             | 802.11a/b/g      | Mini PCI                                                         | iwi     | Albert Lee
Intel         | Intel PRO/Wireless 3945ABG        | yes             | 802.11a/b/g      | Mini PCI Express                                                 | wpi     | Albert Lee
Intel         | WiFi Link 4965AGN                 | yes             | 802.11a/g/n      | Mini PCI Express                                                 | iwk     | Albert Lee
Intel         | WiFi Link 5100AGN (ShirleyPeak/EchoPeak) | yes      | 802.11a/g/n      | Half/Full Mini PCI Express                                       | iwh     | Albert Lee
Intel         | WiFi Link 5300AGN (ShirleyPeak/EchoPeak) | yes      | 802.11a/g/n      | Half/Full Mini PCI Express                                       | iwh     | Albert Lee
Intel         | WiFi Link 5300 (pciex8086,4236)   | yes             | 802.11a/b/g/n    | Half/Full Mini PCI Express                                       | iwn     | Marcel Telka
Intel         | Centrino Advanced-N 6205 (Taylor Peak) | yes        | 802.11a/g/n      | Half Mini PCI Express                                            | iwn     | Michal Nowak
Marvell       | 88W8363 v1.1                      | yes             | 802.11b/g        |                                                                  | mwl     | enricop
Ralink        | RT2500/RT2501/RT2600              | yes             | 802.11b/g        |                                                                  | ral     | enricop
Ralink        | RT252x/RT257x                     | yes             | 802.11b/g        | USB                                                              | ural    | enricop
Ralink        | RT2501/2601                       | yes             | 802.11b/g        | USB                                                              | rum     | enricop
Ralink        | RT2561/RT2561S/RT2661 driver v1.1 | yes             | 802.11b/g        |                                                                  | rwd     | enricop
Ralink        | RT2700/RT2800                     | yes             | 802.11a/b/g/n    |                                                                  | rwn     | enricop
Realtek       | RTL8187L/B driver v1.2            | yes             | 802.11b/g        | USB                                                              | urtw    | enricop
Realtek       | RTL8188CE                         | no              | 802.11b/g/n      |                                                                  |         | Marcel Telka
Zydas         | ZD1211(B)                         | yes             | 802.11a/b/g      | USB                                                              | zyd     | enricop

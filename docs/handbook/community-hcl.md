<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Matt Wilby Copyright (C) 2011.
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s):  Alexander Pyhalov, Aurelien Larcher, Deano Calver, Nikola M.

Portions created by Deano Calver are Copyright (C) 2011.
Portions created by Aurelien Larcher are Copyright (C) 2017.
Portions created by Nikola M. are Copyright (C) 2017.
Portions created by Alexander Pyhalov are Copyright (C) 2019.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

<img src = "../../Openindiana.png">

# OpenIndiana Community Hardware Compatibility List

This is a community maintained HCL (Hardware Compatibility List), compiled from contributions from OpenIndiana users.

It is not an official statement or guarantee from the OpenIndiana Project.

It is provided as a guide to help users discover what hardware works with OpenIndiana, and to guide users with any specific instructions where required.

The HCL consists of two categories:

1. [Components](#components)
2. [Systems](#systems)

## How to find out what hardware you have?

If your are running the standard MATE install of Openindiana, then Device Driver Utility (ddu), provided by `diagnostic/ddu` package, is your friend (it is located by default under Applications->System Tools).

When run, it will provide a list of hardware sorted by category and the driver (if used).

The device line can be copied into the relevant HCL table, along with which driver is being used.
If for any reason you don't want (or can't) enter it yourself into the HCL, feel free to email the details (Device, driver, OI hipster 'osnet-incorporation' and 'userland-incorporation' versions and status) to hcl-feedback@openindiana.org and the oi-dev mailing-list.

## Components

1. [Audio](#audio)
2. [Drives (HDD, CD, DVD or Tape)](#drives)
3. [Network interface controllers](#networ-interface-controllers)
4. [External disk arrays](#external-disk-arrays)
5. [Graphics Adapters](#graphics-adapters)
6. [Motherboards](#motherboards)
7. [Peripheral Devices (Printers, keyboards, mice)](#peripheral-devices)
8. [Serial Controllers](#serial-controllers)
9. [Storage Controllers (HBA, Raid etc)](#storage-controllers)
10. [Webcams](#webcams)
11. [WiFi adapters](#wifi-adapters)

### Audio

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

### Drives

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


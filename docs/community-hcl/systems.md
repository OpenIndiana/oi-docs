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

# Systems

## Laptops

OpenIndiana was tested by our users on the following laptops.

Manufacturer |  Model               | Works (yes/no)  | Notes and/or specific usage instructions | Contributor
------------ | -------------------- | --------------- | ---------------------------------------- | ------------
Acer         |  Aspire AS3810T      | no  | Hangs after OS banner when booting from a USB DVD.  With `-v`, displays `pseudo-device: dld0` and `dld0 is /pseudo/dld@0` last. | Gary Mills
Acer         |  Aspire One ZG8      | yes |                                          | Deano Calver
Acer         |  Ferrari 1100        | yes | Model: 1100-704G25Mn                     |
Acer         |  Ferrari 3400        | yes |                                          |
Acer         |  Ferrari 4000        | yes |                                          |
Acer         |  Ferrari 4200 WLMi   | yes |                                          |
Acer         |  Ferrari 4500 WLMi   | yes |                                          |
Acer         |  Ferrari 5000        | yes |                                          |
Apple        |  iMac 21.5-inch, Mid 2010 (iMac11,2)  | yes | OS installs fine, has BCM5764M ethernet chip, but is supported by the included drivers. | James Young
Asus         |  Eee PC 1005PE       | yes | Atheros AR8132 / L1c Gigabit Ethernet works with atge driver.  Wireless works.  `vgatext` display driver works. | Gary Mills
Dell         |  Latitude D420       | no  | Stopped booting for 148                  | Jon Tibble
Dell         |  Inspiron 1545       | yes | Broadcom Corporation BCM4312 802.11b/g driver missing | Ganapathy S A
Dell         |  Latitude E6520      | yes |                                         | Marco van Lienen
Dell         |  XPS M1330           | yes | Broadcom Corporation BCM4312 802.11b/g driver missing. Doesn't show battery status. | Maxim Kondratovich
Hewlett-Packard | EliteBook 2170p   | no  | OI hipster-20190308.  Wireless does not work.  See [Bug 10556](https://www.illumos.org/issues/10556) for details.  Everything else works. | Gary Mills
Hewlett-Packard | 2710p             | yes | ACPI works, no Wacom driver. Everything works fine, secondary port for graphics card listed as unknown, but external display works. | Bryan Iotti
Hewlett-Packard | DV 6000           | yes | Works perfectly, including graphics, sound and usb | Johan S
Hewlett-Packard | EilteBook 8760w   | yes | WiFi fails from time to time, set "set apix_enable=0" in /etc/system to work-around illumos issue [#1723](https://www.illumos.org/issues/1723), SDcard works, NVIDIA Graphics work (3D accelerated), webcam works, USB3 works not of course (no driver), suspend does not work correctly | Olaf Bohlen
Hewlett-Packard | EliteBook 6930p   | yes | Works: WiFi, Ethernet, no driver issues after disabling Intel MEI/AMT. AMD Radeon HD 3400 only works for 2D acceleration, due to missing KMS. Incomplete ACPI support: no suspend, low battery life (2hrs). | Bryan Iotti
Lenovo       | ThinkPad X1 Carbon 20A7004HRT | yes | Tested with July 2014 OpenIndiana Hipster ISO.<br/>Installed OI from USB drive (switched it to USB 2.0 mode in BIOS). Also selected legacy boot.<br/>Gigabit Ethernet (Intel l218-V) works with e1000g0 driver.<br/>Sound card (ddu detects Intel Haswell-ULT and Intel Lynx Point-LP HD Audio controllers) is detected, but doesn't work.<br/>Video adapter (Intel Haswell-ULT Integrated audio controller, Intel HD 4400) is recognized as VESA, but supports 1600x900 resolution.<br/>FN and functional "keys" work  in general.<br/>Wireless adapter (Intel Wireles-N 7260) doesn't work<br/>Trackpad seems to be too sensitive and behaves strange.<br/><br/><i>Updated at July 2019</i><br/>Video adapter is working with Intel KMS driver.<br/>USB 3.0 ports work fine.| Alexander Pyhalov
Lenovo | ThinkPad Edge E335 | yes | The laptop has no CD drive but can boot off a USB device; to install OI I used a USB HDD with grub4dos in first partition booting an oi_151a5 ISO image and a second 1GB partition with the USB image. Note that the right (yellow USB 2.0) port MUST be used during such setup.<br/>Gigabit Ethernet (Realtek) works, especially (more stable) with an updated gani driver from Free NIC drivers for OpenSolaris project. WiFi (Broadcom BCM4313) works with updated NDIS drivers (see source tarball in <https://www.illumos.org/issues/3367>) based on bcmwl5 64-bit variant of specific Windows driver versions, this supports WEP only. SATA support is strange (sometimes works, sometimes doesn't), so Compatibility mode (IDE) set via BIOS is preferential. USB3 (XHCI) does not work, those two left ports don't even power up a mouse. The USB2 port (right side) works, also with a USB hub. Battery status and model shown OK. Card reader not visible (probably hooked to USB3 chip).<br/> Sound system includes several devices (Realtek audio powering the speakers/mini-jack, and AMD Radeon HDMI audio), both driven as audiohd; in my case Realtek was detected as dsp1/mixer1/audio1/etc. and I had to replace the links (/dev/dsp /dev/audio /dev/mixer etc.) to force it to be used for sound by default. ALSA audio driver mode works, but with hicccups; OSS and SunAudio play music okay, but quite a bit too quiet in my testing (like 10% of the volume on the same system under another OS).<br/>Video adapter (AMD Vision E2 APU including the CPU and Radeon GPU) is not recognized as a "radeon" by "modload /kernel/drv(/amd64)/radeon" nor by X11, but works in correct resolution (1366*768) as "vgatext". Heavy video performs poorly (movies, videocamera tests), but during normal work/reading/browsing/development lags are nearly unnoticeable.<br/>NOTE: The keyboard does not include such keys as Pause/Break and SysRQ/ScrlLock. Some can be emulated (Fn+P, Fn+B, etc.), but I did not manage to find all of them. There is also only a power LED indicator, so you don't see HDD working, CAPS lock, etc. NumLock and at least an emulated numeric keypad are missing altogether.<br/>According to repairs docs, some variants of this laptop model can include an additional MiniPCI socket for WAN (3G modem) or mSATA SSD; my laptop does not have this feature soldered on (or I failed to find it).| Jim Klimov
Lenovo       | Thinkpad L470        | yes |  |
Lenovo       | ThinkCenter m91p     | yes |  | Aurélien Larcher
Lenovo       | Thinkpad P70         | yes |  |
Lenovo       | ThinkPad T60         | yes |  | Milan Jurik
Lenovo       | Thinkpad T430        | yes |  |
Lenovo       | ThinkPad T520        | yes | The Intel Wifi Link 1000 and 6300 do NOT work.  The NIC is an Intel 82579LM works well.<br/>The NVidia GPU works well with the nvidia driver.  eSATA port works fine, but you'll have to use cfgadm to "reconfigure" the device so it picks up the plugged in disk. | Josef "Jeff" Sipek
Lenovo       | ThinkPad T520 (4240-5NG) | yes | No support for Realtek RTL8188CE 802.11b/g/n WiFi Adapter. No support for Integrated Intel VGA (generic VGA driver is used - 1024x768 only). | Marcel Telka
Lenovo       | ThinkPad T578        | yes | The Intel Corporation Centrino Wireless-N 1000 does NOT work. As noted for T520 it is not supported by Illumos. | Logan Bruns
Lenovo       | ThinkPad W520        | yes | Nvidia Quadro 1000m and Intel Centrino Ultimate-N 6300 (3x3 AGN). | Cameron Jones
Lenovo       | ThinkPad X220        | yes | Graphics Intel HD 3000 (Sandy Bridge) suffers from [bug 8049](https://www.illumos.org/issues/8049) on the laptop's primary display if intel Xorg driver is used (vesa is fine but the display then has non-native 1024x768 resolution), but VGA (D-Sub) to external display works correctly. Intel 82579LM Ethernet controller works with e1000g driver. Wifi Intel Centrino Advanced-N 6205 is attached to iwn driver but I did not test it so far (I don't see any wi-fi networks). Audio Intel HDA from C200 chipset works with audiohd driver. Touchpad, trackpoint, keyboard and USB mouse work. Volume & other buttons don't work. | Michal Nowak
Multirama-HT | Xpress Book          | yes |  | Apostolos Syropoulos
Panasonic    | Toughbook Cf-18      | yes | Works, with VESA graphics driver. No Wacom driver for Xorg. Audio works through headphone output, no internal speaker. Disable system bell to avoid freezes. No 56k modem. ACPI works for battery status, no brightness adjustment. Networking and Wifi work. | Bryan Lotti
Sony         | VAIO VGN-S3XP        | yes |  | cardbus does not work. nvidia driver does not fully support NV6200 Go chipset. | Matt Wilby
System76     | Bonobo Extreme       | yes |  | Nripendra Khan
System76     | Galago UltraPro      | yes |  Driver: VESA | Ankita Davis
Toshiba      | Satellite L855 (PSKACE) | no | AMD Radeon HD 7670M Graphics requires KMS driver, which we don't have, so VESA only. Unfortunatelly display's native resolution is 1366x768 but the this resolution is not one of VESA modes, so 1024x768 or 800x600 has to be used, which renders the screen blurry. Nor HDMI nor VGA (D-Sub) works.<br/>Integrated Ethernet controller Atheros AR8161 is not supported, nor is Atheros AR9485 mini-PCI WLAN.<br/>What works: ACPI, battery statistics, chipset in general (Intel C216), sound (Intel HDA), SATA disks in AHCI mode, VT-x (tested in illumos KVM), touchpad, USB (both EHCI & xHCI) for input devices and storage. | Michal Nowak
Lenovo       | T530                 | yes | NVidia NVS 5400M, Interl Centrino Advanced-N 6205 (taylor peak)(iwn), Intel 82579LM (ethernet/gigabit/e1000g)  Everything works, even integrated camera | Espen Martinsen

## Workstations

OpenIndiana was tested by our users on the following workstations with UEFI.

Manufacturer |  Model               | BIOS               | Works (yes/no) | Notes and/or specific usage instructions           | Contributor
------------ | -------------------- | ------------------ | -------------- | -------------------------------------------------- | ------------
ASUS         | PRIME B550-PLUS      | ASUS UEFI Bios 3405 | yes          | OpenIndiana 2025.04, AMD Ryzen 7 5800X CPU works, discrete graphics NVIDIA GeForce GT710 works with X11/MATE, network onboard RealTek RTL8111/8168/8211/8411 PCI Express Gigabit ethernet (rge), SATA harddisk works, tested ASUS UEFI Bios 3405 (American Megatrends 12/13/2023) system installs and boots fine both in UEFI only mode, and in Legacy OPROM only mode, CSM (Compatibility Support Module) and AMD CBS (AMD Common Bios Specification) AMD IOMMU disabled   | David Stes
Dell         | Precision T3610      | Dell UEFI Bios A19 | yes          | OpenIndiana 2025.04, Intel(R) Xeon(R) CPU E5-2650 v2, AMD FirePro W5000 works with X11/MATE, system only boots in legacy mode - does not work/boot in UEFI mode with Secure Boot disabled | J Madgwick
Dell         | Precision 3640       | Dell UEFI Bios 1.17 | yes          | OpenIndiana 2021.04, i3-10100 CPU works, integrated graphics Intel UHD 630 does NOT work and only supports text console (no X11/MATE), NVIDIA GeForce GT 440 works with X11/MATE, integrated audio Intel works, network onboard Intel I219-LM e1000g works, AHCI disks work, tested Dell UEFI BIOS 1.2, 1.8 and 1.17, system installs and boots fine in UEFI mode with Secure Boot disabled | David Stes
Dell         | Precision 7720       | Dell Bios 1.24      | yes          | Intel(R) Xeon(R) CPU E3-1535M v6, boot in legacy, not UEFI  | Stephan Althaus

## Servers

OpenIndiana was tested by our users on the following servers.

Manufacturer |  Model               | Works (yes/no) | Notes and/or specific usage instructions           | Contributor
------------ | -------------------- | -------------- | -------------------------------------------------- | ------------
Dell         | Optiplex 9010        |   yes          | OpenIndiana 2018.04, GFX, network, AHCI disks work | Michal Nowak
Dell         | PowerEdge R610       |   yes          | All ok                                             | Jorge Palma Escobar
Dell         | PowerEdge R620       |   yes          | All ok.                                            | Jason Matthews
Dell         | PowerEdge R720       |   yes          | All okay.                                          | Jason Matthews
Dell         | PowerEdge R820       |   yes          | Severe performance problems on ixgbe - difficult to break 300 mb/s transmitting, receiving is okay | Jason Matthews
Dell         | PowerEdge 1950 III   |   yes          | All working perfectly                              | ctable
Dell         | PowerEdge SC1425     |   yes          | everything works                                   | Johan  Sanchez
Dell         | PowerEdge 4600       |   yes          | everything works                                   | Johan  Sanchez
Fujitsu      | Primergy T1330       |   yes          | boots fine in UEFI mode with Secure Boot disabled  | Stephan Althaus
HP           | DL360 G6             |   yes          | If you use the built in P410i array controller you should make sure you have or get the battery back up so the write cache is enabled or ZFS performance will be horrible. Also it is recommended that you install HP's free hpacucli command to make it easier to enable swapped out hotswap drives. | Logan Bruns
HP           | DL380 G7             |   no           | Intel 5520 chipset based motherboard Broadcom Corporation NetXtreme II BCM5709 p410i RAID controller performance sucks like a hoover vaccum. No JBOD support. Requires new firmware all around or the installation of an SSD triggers a bug that starts a thermal shutdown iLO works as expected. Download drivers directly from HP along with the scripting toolkit to make bios configuration changes in OS – neat level of integration Expect monthly firmware updates on this platform. HP has a fix it in the field approach. There has been some conflict between LSI cards and HPs passive midplane. Every other column of disks must be left vacant or data corruption occurs. Last December LSI and HP were pointing fingers at each other, however, this problem may be resolved. I am no longer in a position where i can risk the data on the disks to find out. I installed both midplanes and half the drive slots are empty at the moment. | Jason Matthews
HP           | ML110 G7             |  yes           | Intel Xeon E3 1220, no reported driver issues.    | Dave Koelmeyer
HP           | ProLiant MicroServer Gen8 G1610T | yes| Get driver for Smart Array B120i/ZM. ZFS works well. | Miguelino Schwinn
HP           | Proliant Microserver Gen8 G2020T | yes| HP NC112T NIC works by default. Used updated CPQary driver. Very stable. Home video server. | Ryan Diomi
HP           | ProLiant MicroServer Gen8 E3-1220Lv2 |yes| HP NC112T NIC. 16GB RAM. hipster-20140701 installed. Very stable.  | Ryan Diomi
HP           | ProLiant Microserver N40L | yes       | No special drivers required.                      | Jon Green
IBM          | xServer x3100 M4     |  yes           | No special drivers required. Intel(R) Xeon(R) CPU E31220 @ 3.10GHz Socket 1 Ethernet 1 Intel 82574L Ethernet Controller | Jorge Palma Escobar
Intel        | MFSYS25  (6x blade server  chassis with  shared storage presented as SAN) | yes  | No particular Solaris-related problems (all networking and storage components recognized by OI and several older Solaris 10 distros). Did not test MPxIO with Solaris because this box had no secondary IO controller (had it working with Linux and Windows on other such boxes). However the stability of remote serial console, remote graphical jKVM and remote media used for installation leaves a lot better to be desired (in comparison with Sun Fire IPMI/ILOM interfaces). May be a pain to install over pure remote-console networking, but this regards any OS we tried with the server. Physical distro media is very much recommended. After that, all works well =) | Jim Klimov
Intel        | SR2625URLX           |  yes           | No problems Intel S5520 motherboard Intel Corporation 82801JI (ICH10 Family) Intel Corporation 82575EB Gigabit Network Connection RMM3 works as expected (as an OEMd service processor from AMI), but no bmc driver support in OI (works in Solaris 11) Onboard SATA/SAS ports work in AHCI mode on the passive midplane but hot plug seems broken. I recommend internal LSI cards in any case. I did not try the serial console, but I would assume that works Hardware throws ECC errors on large memory installations (96GB) up until version 50 of firmware. Recommend v60+ System is unable to fast boot and generates an error about a 32bit address. Alter boot config in the repo to do a full boot to work around this problem. | Jason Matthews
Storevault   | N500/S500            | yes            | All working fine | ctable
SuperMicro   | SuperServer 6016T-MTHF | yes          |                  | Milan Jurik
SuperMicro   | SYS-6026T-6RF+       | yes            |                  | Geoff Flarity
SuperMicro   | AS-2122TG-HTR        | yes            | No problems with Advanced Micro Devices [AMD] ... Intel Corporation 82576 Gigabit Network Connection Matrox Graphics, Inc. MGA G200eW WPCM450 ATI Technologies Inc RD890 ... ATI Technologies Inc SB700/SB800 ... | Uwe Reh
Zotac | Zbox ID-18U | rge | All working except for Intel graphics (only VGA), and USB3 (has no driver). | Gary Mills

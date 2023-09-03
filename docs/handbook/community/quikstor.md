<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
 (the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.


The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Bryan N Iotti Copyright (C) 2013.
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): ______________________________________.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

# Using RDX Quikstor media

Originally contributed by Bryan Iotti on the OpenIndiana Wiki.

## What is RDX?

RDX is essentially a 2.5" SATA disk enclosed in a shockproof, electrostatically shielded container. It is a popular and affordable type of backup media that by design allows random access, not possible on tape drives.
For more information, visit [RDX Technology](https://en.wikipedia.org/wiki/RDX_Technology).

<img src = "http://www.rdxworks.com/images/Imation/1TB_RDX_27957.jpg">

## Usage with OpenIndiana

SATA RDX readers work fine with OpenIndiana 151a8 (USB not tested, please add information if available).
The system will recognize a reader out of the box and ZFS works fine with the inserted disks.
The Hardware Abstraction Layer (hal) however doesn't know that this cartridge is removable.

### Modifications to the system

To allow it to be ejected, add a file (named along the lines of `10-rdx.fdi`) to `/etc/hal/fdi/preprobe/30user` with content like the following:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<deviceinfo version="0.2">
 <device>
   <match key="info.udi" string="/org/freedesktop/Hal/devices/pci_0_0/pci_ide_1f_2/ide_0_2/sd20/sd20">
   <merge key="storage.removable" type="bool">true</merge>
   <merge key="storage.hotpluggable" type="bool">true</merge>
   <merge key="storage.requires_eject" type="bool">true</merge>
  </match>
 </device>
</deviceinfo>
```

The "match" key is the only system-specific item. You could alternatively use the `info.product key` and match an 'RDX' string.

Now, restart the `hal` service:

```
pfexec svcadm disable hal
pfexec svcadm enable hal
```

When you need to eject the RDX, use `pfexec eject /dev/dsk/cXtXdX` where cXtXdX is your specific drive address.

### What if I can't/don't want to modify my system?

You can either:

- Disable the hal service, press eject on the drive, re-enable the hal service
- Start shutting down/restarting the system. After it syncs the disks, the hardware eject works fine.

## Debugging issues with eject and hal

The Hardware Abstraction Layer can be troublesome to get working properly. Here are some tidbits that are useful for debugging purposes:
The lshal command that dumps "what HAL thinks about a device". Its output can be lengthy, but it's invaluable when finding out what keys one should match and merge.
The hal daemon can be run from the command line in debug mode, showing what happens when you plug in a new device:

```
svcadm disable hal
pfexec /usr/lib/hal/hald --daemon=no --verbose=yes
```

### Suggested reading

- [Solaris-specific information about rmmount, dbus and hal, looking especially at the interaction between these components](https://iws.cs.uni-magdeburg.de/~elkner/s11/rmmount.html)
- [Interesting notes by a disgruntled hal user fixing his installation for proper mounting of an iPod](https://web.archive.org/web/20210419214900/http://sphinx.mythic-beasts.com/~mark/random/hal/)
- [Configuring an X Server in Oracle Solaris - has a part about working with hal's .fdi files](http://docs.oracle.com/cd/E26502_01/html/E28056/gmcdj.html)
- [man page about the HAL device information file format](https://docs.oracle.com/cd/E26502_01/html/E29042/fdi-4.html#REFMAN4fdi-4)
- [man page: overview of hardware abstraction layer](https://docs.oracle.com/cd/E26502_01/html/E29043/hal-5.html#REFMAN5hal-5)

### What works

- Cartridge insertion
- Normal operation (format, zfs use, mount/unmount)
- Cartridge eject

### What doesn't work

- Cartridge read-only switch doesn't work. Media is always writable.
- SMART passthrough is supported, but I can't enable it at the present time (my controller is using the pci-ide driver). Please test and report.

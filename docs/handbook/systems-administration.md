<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
 (the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.


The Original Documentation is _________________.

The Initial Writer of the Original Documentation is ___________ Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): ______________________________________.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

<img src = "../../Openindiana.png">

# Hipster Handbook - System Administration

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
<p>This is a <b>DRAFT</b> document which may contain errors!</p>
<p>Help us improve and expand this site.</p>
<p>Please see the <b>Contrib</b> section for more details about joining the OpenIndiana Documentation Team.</p>
</div>

< place holder for introduction content >


## Configuring and Tuning

< place holder >


### Configuring a UPS

* NUT?


### Fault management (FMA)

< place holder >


### Service management (SMF)

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

Start a service

`svcadm enable <service name>`

Start service along with it's dependencies

`svcadm enable -r <service name>`

Start a service temporarily (won't survive a reboot)

`svcadm enable -t <service name>`

Check service dependencies

`svcs -d <service name >`

Check status of services

`svcs -vx`

</div>


### Systems logging and monitoring

< place holder >


## Illumos boot process

< place holder >


## Security

< place holder >


### Role based access control (RBAC)

< place holder >


## Zones

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Need to mention some of the changes to zone management...e.g..
    * sys-unconfig gone.
    * sysding replaced syscfg
    * now have to have DNS, root password, etc. all configured inside the zone before being able to logon using `zlogin -C <zonename>`, otherwise have to do `zlogin <zonename>`.

So a fair amount of stuff has changed there.

</div>

## Storage

< place holder >


### Mounting file systems

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Need a walkthrough of mounting options for other filesystems...NTFS, FAT, UFS, etc.

</div>


### NTFS support - 3rd party

* [http://jp-andre.pagesperso-orange.fr/openindiana-ntfs-3g.html](http://jp-andre.pagesperso-orange.fr/openindiana-ntfs-3g.html)


### Configuring OpenIndiana as an ISCSI Target Server - (COMSTAR)

< Place holder for content >


### System backups

OpenIndiana offers several backup solutions.
Here are just a few of them:

* [Areca](http://www.areca-backup.org/)
* [Borg Backup](https://borgbackup.readthedocs.io/en/stable/)
* [Bacula](http://blog.bacula.org/)
* Time-Slider
* [rdiff-backup](http://www.nongnu.org/rdiff-backup/)
* Rsync
* [Zetaback](https://labs.omniti.com/labs/zetaback)
* ZFS exports
* cpio
* tar, zip, etc.


### ZFS

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

Gotcha's such as the following:

```
<e^ipi> don't suppose there's any solution to this:
<e^ipi> cannot replace 1509280528045021472 with /dev/dsk/c0t5000C5009204EB9Bd0s0: devices have different sector alignment
<tsoome> thats 512 versus non-512 sector issue
<tsoome> you need to build new pool based on larger sector
<tsoome> if its mirror, you can attach 512B disk to 4k pool, but not vice versa...
<e^ipi> well, damn.
<tsoome> that error message is too confusing, should be replaced by more clear one;)
<e^ipi> I swear this pool is already mix & match, freebsd complained about it
<e^ipi> (but still used it)
<tsoome> there is that thing that ashift is vdev property;)
<tsoome> not pool property (one reason why that linux zpool create ashift= option is bad)
<tsoome> or sort of bad anyhow
```

</div>


#### Importing ZFS disks

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Talk about the ZFS import command.

</div>


#### How does one mirror their root zpool?

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Adding a 2nd disk to the root pool

</div>


#### How does one create additional zpools?

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* zpool create command
    * Mirrors
    * Raidz

</div>


#### Modifying zpool settings and attributes

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* zpool get/set commands

</div>


#### Modifying zfs file system settings and attributes

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* zfs get/set commands

</div>


#### How does one create additional zfs datasets?

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* zfs create command

</div>


#### Configuring system swap

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* zfs set command
* swap -l

</div>

## Virtualization

< Place holder >


### OpenIndiana as a virtualization host server

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Qemu-KVM (KVM) walkthrough
    * illumos KVM port does not support AMD processors.
    * Intel processors require EPT support.
* Virtualbox walkthrough
    * There is no package for this yet, but folks do have it working, see the wiki for details.

</div>


<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

In a nutshell, most modern Intel processors such as i3, i5, i7, and Xeon provide EPT support.
Most older processors such as Core2duo and Core2Quad lack EPT support, and a few of them lack virtualization support at all.
You can check your processor for EPT support via the following link: <http://ark.intel.com/Products/VirtualizationTechnology>

* Hipster is currently testing a new package for managing KVM instances as SMF services.
    * [kvmadm](http://www.kvmadm.org/)
* libvirt is on the roadmap for the future releases and will open the door for virsh, and likely virt-manager as well.

```
<leoric> Testers needed! pkg://userland/system/qemu/kvmadm@0.10.3,5.11-2015.0.2.0:20160322T212709Z
<leoric> jeffpc: I know, you like kvm :)
<jeffpc> heh
<jeffpc> leoric: is there documentation for it?
<leoric> https://github.com/hadfl/kvmadm/blob/master/doc/kvmadm.pod
<jeffpc> oh, is it http://www.kvmadm.org/ ?
<leoric> yes
<jeffpc> interesting
<jeffpc> I'll have to give it a try at some point
```

</div>


## Localization

< place holder >



## Dtrace

< Place Holder >


## Configuring Networking

< Place Holder >


### Manual Configuration (static IP)


```bash
:~$ sudo svcadm disable physical:nwam
```

Define in your IP/hostname `/etc/hosts`, if not already, an entry for this host. For example:

```bash
192.168.1.22 hostname hostname.local localhost loghost
# Subsittude 192.168.1.22 for YOUR IP
```

Enable the default physical service with `svcadm` and configure the `interface`:

```bash
:~$ sudo svcadm enable physical:default
```

Configure interface with ipadm:

```bash
:~$ sudo ipadm create-addr -T static -a local=192.168.1.22/24 bge0/v4static
```

If you do not know what the interface name is (bge0 in this case); then type in

```bash
:~$ dladm show-link
```

or:

```bash
:~$ kstat -c net | grep net

# look for hme0, bge0, e1000g0 or soemthing that resembles the driver in use.
```

Add gateway

```bash
:~$ sudo route -p add default 192.168.1.121
```

or

```bash
:~$ sudo nano /etc/defaultrouter

# Enter in your gateways IP
```

Set DNS server(s)

```bash
:~$ sudo nano /etc/resolv.conf
# Enter in the DNS server IP(s)
nameserver 192.168.1.121
```

or

```bash

:~$ sudo sh -c 'echo "nameserver 192.168.1.121" >> /etc/resolv.conf'

```

Restart

```bash
:~$ sudo reboot
```

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
IF you cannot ping an external IP (e.g. google.com) run this command and try again.
</div>

```bash
:~$ sudo cp /etc/nsswitch.dns /etc/nsswitch.conf
```

credit for this section of docs go to [/u/127b](https://www.reddit.com/user/127b)


### Automatic Configuration (NWAM)

* How to use NWAM (network auto magic)


#### Network automagic online help

Comprehensive and fully illustrated online help for using NWAM is available by right clicking the NWAM tray icon and selecting _Help_.
This opens the online help browser.


#### Troubleshooting NWAM

If NWAM is already configured and fails to connect to a wireless network try restarting the service.

For example:

```bash
svcadm restart nwam
```

Sometimes the location gets set to _NoNet_ and it's nessessary to manually change the location.

When the location setting is configured to _Switch Locations Automatically_, it's not possible to change the location.
This is resolved by reconfiguring the location to allow manual switching.
To perform this task, do the following:

Right click the NWAM tray icon and select **_Location_ > _Switch Locations Manually_**.
Right click the NWAM tray icon and select **_Location_ > _Automatic_**.


### Desktop GUI

< Place Holder >


#### Manual Configuration

< Place Holder >


#### Automatic Configuration

< Place Holder >


#### Troubleshooting

* Make sure the network auto magic 'Location' setting is configured as 'Automatic' and not 'NoNet'


## Clustering with Open HA Cluster

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

See old sun docs

* <http://docs.oracle.com/cd/E19735-01/>

Also see:

* <http://zfs-create.blogspot.nl/>

</div>


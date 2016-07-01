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

# System Administration - (Draft) - work in progress

< place holder >

### Configuring a UPS

* NUT?


### How does one perform system backups?

* Time Machine
* ZFS exports
* Bacula?


### How does one add additional users?

* Basic system administration
* Basic Unix commands


## Configuring and Tuning

< placeholder >

## Illumos Boot Process

< placeholder >

## Security

< placeholder >

## Zones

### Zones - running web stuff in zone, development, etc.

* Need to mention some of the changes to zone management...e.g..
    * sys-unconfig gone.
    * sysding replaced syscfg
        * now have to have DNS, root password, etc. all configured inside the zone before being able to logon using `zlogin -C <zonename>`, otherwise have to do `zlogin <zonename>`. So a fair amount of stuff has changed there.


## Storage

< Place holder for section introduction content >

### How does one mount or import additional disks?

<!--

TODO:

* Talk about the ZFS import command.
* Need a walkthrough of mounting options for other filesystems...NTFS, FAT, UFS, etc.

-->

#### commands used

* `mount`

### NTFS support - 3rd party

* [http://jp-andre.pagesperso-orange.fr/openindiana-ntfs-3g.html](http://jp-andre.pagesperso-orange.fr/openindiana-ntfs-3g.html)


### ZFS

#### How does one mirror their root zpool?

* Adding a 2nd disk to the root pool

#### How does one create additional zpools?

* zpool create command
    * Mirrors
    * Raidz

#### Modifying zpool settings and attributes

* zpool get/set commands

#### Modifying zfs file system settings and attributes

* zfs get/set commands

#### How does one create additional zfs datasets?

* zfs create command

#### Configuring system swap

* zfs set command
* swap -l


## Virtualization

### Virtualization Storage Server

* Poor man's standalone ISCSI SAN linked to a 2nd machine running VMware ESXI (2 computers required)
    * A variation of this would be to run OI as an ESXI guest with local storage hardware "passed through" to OI and then subsequently share ZFS volumes via  ISCSI with the ESXI host itself. In this configuration, OI effectively becomes a SAN (1 computer required)


### Virtualization Server

* Qemu-KVM walkthrough (Does hipster even have this package?)
    * Yes, KVM is the package name
* Using VIRSH, Virt-manager, etc. (Does hipster [or any illumos distro for that matter] even have virsh or Virt-manager)
    * If not, what tools are used to manage the Joyent KVM port (VMADM perhaps?)
    * Virtualbox walkthrough - ditto...is there a package available?

* illumos KVM port does not support AMD processors.
* Intel processors require EPT support.

In a nutshell, most modern Intel processors such as i3, i5, i7, and Xeon support EPT.
Most older processors such as Core2duo and Core2Quad lack EPT support, and a few of them lack virtualization support at all.

You can check your processor for EPT support via the following link: <http://ark.intel.com/Products/VirtualizationTechnology>

* Hipster is currently testing a new package for managing KVM instances as SMF services.

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

## Localization

< placeholder >

## Updating and Upgrading

< placeholder >

<!--
### How does one keep the system updated?

<!--

Some notes and reference docs for writing the IPS section:

* Be sure to provide walkthroughs for both IPS and BEADMIN (as they work together).
* [Basics of Image Packaging System (IPS) - Oracle](http://www.oracle.com/technetwork/articles/servers-storage-admin/o11-083-ips-basics-523756.html)
* [IPS cheat sheet PDF - Oracle](http://www.oracle.com/technetwork/server-storage/solaris11/documentation/ips-one-liners-032011-337775.pdf)

-->

< Place holder for content >


#### Using pkg to list packages currently installed on the system

< Place holder for content >


#### Using pkg to search for packages

< Place holder for content >


#### Using pkg to update the system

* `pkg update -nv` will perform a dry run and list the changes which would have been made to the system.
* `pkg update` will perform a normal update and print a very brief summary.
* `pkg update -v` will perform the update and then print a summary of what was updated.
* `pkg history` will provide basic details for previous uses of the pkg command.


### How does one find and install more software?


Tips for writing this section:

* <https://pkgsrc.joyent.com/>
* <https://pkgsrc.joyent.com/>
* <https://pkgsrc.joyent.com/install-on-illumos/>

* Clean up and consolidate information from website and wiki about where to find additional software.
* Need to answer the questions - Where and how can I install more software?
* Discuss the various package managers (PKGIN, IPS (PKG), etc.)
* Discuss the various repos (opencsw, sfe, pkgsrc.joyent, etc.), what's available in them, and which might break compatibility, etc.
* What is SFE? How does it differ from other repos?
* Add a page for popular available software with descriptions, etc.
* When they say IPS is network centric, they're not kidding;
Packages cannot be installed locally like RPM, instead you have to setup a local network repository.
    * See: <http://serverfault.com/questions/348139/how-to-manually-download-individual-files-from-the-openindiana-or-solaris-pkg>
* How to additional repos, etc.
* How to compile your own software.
I think there is an existing wiki page for this.
Given the limited number of IPS packages currently available, this is a pretty important subject to write about.
    * Also could look here (might be outdated):
    * <http://www.inetdaemon.com/tutorials/computers/software/operating_systems/unix/Solaris/compiling_software.shtml>
* How to install flash player

-->

< Place Holder for Content >


#### Using the pkg publisher and pkg set-publisher commands

The `pkg publisher` command is used to add and remove remote repositories.

* `pkg publisher` - lists all the repositories configured on the system.
* To add a repository, use `pkg set-publisher -O <Repository_URL> <Repository_Name>`


#### Using the pkgrepo command

The `pkgrepo` command is primarily used for creating and working with IPS repositories.
It can also be used for querying the contents of a repository.

* `pkgrepo info -s <repo_URL>`
* `pkgrepo list -s <repo_URL> <package_group>`


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

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
IF you cannot ping an external IP (e.g. google.com) run this command and try again.
</div>

```bash
:~$ sudo cp /etc/nsswitch.dns /etc/nsswitch.conf
```

credit for this section of docs go to [/u/127b](https://www.reddit.com/user/127b)

### Automatic Configuration (NWAM)

* How to use NWAM (network auto magic)

### Desktop GUI

< Place Holder >

#### Manual Configuration

< Place Holder >

#### Automatic Configuration

< Place Holder >

#### Troubleshooting

* Make sure the network auto magic 'Location' setting is configured as 'Automatic' and not 'NoNet'


## Clustering with Open HA Cluster

See old sun docs

* <http://docs.oracle.com/cd/E19735-01/>

Also see:

* <http://zfs-create.blogspot.nl/>

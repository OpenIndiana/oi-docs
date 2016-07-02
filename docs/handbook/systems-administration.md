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


## Configuring and Tuning

< place holder >


### Configuring a UPS

* NUT?


### Fault management (FMA)

< place holder >


### Service management (SMF)

< place holder >


### Systems logging and monitoring

< place holder >


## Illumos boot process

< place holder >


## Security

< place holder >


### Role based access control (RBAC)

< place holder >


## Zones

**DOC TEAM NOTES TO WRITE ABOUT:**

* Need to mention some of the changes to zone management...e.g..
    * sys-unconfig gone.
    * sysding replaced syscfg
        * now have to have DNS, root password, etc. all configured inside the zone before being able to logon using `zlogin -C <zonename>`, otherwise have to do `zlogin <zonename>`. So a fair amount of stuff has changed there.


## Storage

< place holder >


### Mounting file systems

**DOC TEAM NOTES TO WRITE ABOUT:**

* Need a walkthrough of mounting options for other filesystems...NTFS, FAT, UFS, etc.


### Configuring OpenIndiana as an ISCSI Target Server - (COMSTAR)

< Place holder for content >


### NTFS support - 3rd party

* [http://jp-andre.pagesperso-orange.fr/openindiana-ntfs-3g.html](http://jp-andre.pagesperso-orange.fr/openindiana-ntfs-3g.html)


### System backups

OpenIndiana offers several backup solutions.
Here are just a few of them:

* [Areca](http://www.areca-backup.org/)
* [Borg Backup](https://borgbackup.readthedocs.io/en/stable/)
* [Bacula](http://blog.bacula.org/)
* Time-Slider
* [rdiff-backup](http://www.nongnu.org/rdiff-backup/)
* Rsync
* [Zeta](http://www.zetta.net/)
* ZFS exports
* cpio
* tar, zip, etc.


### ZFS

< place holder >


#### Importing ZFS disks


**DOC TEAM TOPICS TO WRITE ABOUT:**

* Talk about the ZFS import command.


#### How does one mirror their root zpool?

**DOC TEAM TOPICS TO WRITE ABOUT:**

* Adding a 2nd disk to the root pool


#### How does one create additional zpools?

**DOC TEAM TOPICS TO WRITE ABOUT:**

* zpool create command
    * Mirrors
    * Raidz


#### Modifying zpool settings and attributes

**DOC TEAM TOPICS TO WRITE ABOUT:**

* zpool get/set commands


#### Modifying zfs file system settings and attributes

**DOC TEAM TOPICS TO WRITE ABOUT:**

* zfs get/set commands


#### How does one create additional zfs datasets?

**DOC TEAM TOPICS TO WRITE ABOUT:**

* zfs create command


#### Configuring system swap

**DOC TEAM TOPICS TO WRITE ABOUT:**

* zfs set command
* swap -l


## Virtualization

< Place holder >


### OpenIndiana as a virtualization host server

**DOC TEAM TOPICS TO WRITE ABOUT:**

* Qemu-KVM (KVM) walkthrough
    * illumos KVM port does not support AMD processors.
    * Intel processors require EPT support.
* Virtualbox walkthrough
    * There is no package for this yet, but folks do have it working, see the wiki for details.


**DOC TEAM NOTES:**

In a nutshell, most modern Intel processors such as i3, i5, i7, and Xeon provide EPT support.
Most older processors such as Core2duo and Core2Quad lack EPT support, and a few of them lack virtualization support at all.
You can check your processor for EPT support via the following link: <http://ark.intel.com/Products/VirtualizationTechnology>

* Hipster is currently testing a new package for managing KVM instances as SMF services.
    * [kvmadm](http://www.kvmadm.org/)
* virtlib is on the roadmap for the next release and will open the door for virsh, and likely virt-manager as well.

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

< place holder >


## Updating and Upgrading


**DOC TEAM TOPICS TO WRITE ABOUT:**

* Be sure to provide walkthroughs for both IPS and BEADMIN (as they work together).
* [Basics of Image Packaging System (IPS) - Oracle](http://www.oracle.com/technetwork/articles/servers-storage-admin/o11-083-ips-basics-523756.html)
* [IPS cheat sheet PDF - Oracle](http://www.oracle.com/technetwork/server-storage/solaris11/documentation/ips-one-liners-032011-337775.pdf)



### Using pkg to list packages currently installed on the system

< Place holder for content >


### Using pkg to search for packages

< Place holder for content >


### Using pkg to update the system

* `pkg update -nv` will perform a dry run and list the changes which would have been made to the system.
* `pkg update` will perform a normal update and print a very brief summary.
* `pkg update -v` will perform the update and then print a summary of what was updated.
* `pkg history` will provide basic details for previous uses of the pkg command.


### How does one find and install more software?

**DOC TEAM TOPICS TO WRITE ABOUT:**

* <https://pkgsrc.joyent.com/>
* <https://pkgsrc.joyent.com/install-on-illumos/>

* Need to answer the questions - Where and how can I install more software?
* Discuss the various package managers (PKGIN, IPS (PKG), etc.)
* Discuss the various repos (opencsw, sfe, pkgsrc.joyent, etc.), what's available in them, and which might break compatibility, etc.
* Describe SFE (SPEC FILES EXTRA) and how it differs from OI and other repos.
* When they say IPS is network centric, they're not kidding;
Packages cannot be installed locally like RPM, instead you have to setup a local network repository.
    * See: [this link](http://serverfault.com/questions/348139/how-to-manually-download-individual-files-from-the-openindiana-or-solaris-pkg)
* How to add additional repos, etc.
* How to compile your own software.
    * I think there is an existing wiki page for this.
    * Given the limited number of IPS packages currently available, this is a pretty important subject to write about.
    * Also could look here (might be outdated):
    * [web link](http://www.inetdaemon.com/tutorials/computers/software/operating_systems/unix/Solaris/compiling_software.shtml)



### Using the pkg publisher and pkg set-publisher commands

**DOC TEAM NOTE:**
See the FAQ for the updated command.
The -O switch is no longer used.

The `pkg publisher` command is used to add and remove remote repositories.

* `pkg publisher` - lists all the repositories configured on the system.
* To add a repository, use `pkg set-publisher -O <Repository_URL> <Repository_Name>`


### Using the pkgrepo command

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

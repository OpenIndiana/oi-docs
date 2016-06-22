<!--
The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is ___________ Copyright (C)_________[Insert year(s)]. All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s): ______________________________________.

Portions created by ______ are Copyright (C)_________[Insert year(s)]. All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).
-->

<!--
DOC TEAM NOTES: Just some notes about things....

Pre-installation caveats and considerations

* System partitioning, Gparted, etc.
* Device Driver utility - (also how to manually install missing drivers - and where to find them if they are available)
* Network install drivers: `pkgrecv -s http://pkg.openindiana.org/hipster-2015 -d bash.p5a -a bash && sudo pkg install -nv  -g bash.p5a bash`
* Local install drivers: `pkg install -g name.p5a fmri`
* How to disable drivers at boot time (this might help fix the kernel panic we see when trying to boot OI inside KVM)
* Physical or virtual?

What are the post-installation caveats and considerations?

* e.g. - What kinds of things can be done with a system once installed?

Helpful resources for writing some of these sections

* https://web.archive.org/web/20090611234850/http://dlc.sun.com/osol/docs/downloads/minibook/en/820-7102-10-Eng-doc.pdf[ Getting Started with OpenSolaris 2008.11]
* https://web.archive.org/web/20091229232632/http://www.opensolaris.com/learn/[OpenSolaris Learn site - Wayback Machine]
* https://web.archive.org/web/20100105080516/http://dlc.sun.com/osol/docs/content/2009.06/[OpenSolaris 2009.06 docs]
* https://web.archive.org/web/20100401024945/http://www.opensolaris.com/use/OpenSolaris200906Booklet.pdf[OpenSolaris 2009.06 Booklet PDF]

-->

## Finding help and support

< Place Holder for section Introduction Content >

### Local system command line help

* apropos - search the manual page names and descriptions
* find - search for files in a directory hierarchy
* info - read Info documents
* locate - find files by name
* man - an interface to the on-line reference manuals

### Web based support resources

<!--

The content for this section is pulled from the OpenIndiana FAQ (section '').
As the FAQ evolves, try to keep this section in sync.

-->

| Resource | URL
| --- | ---
| User Support IRC channel | [#openindiana on irc.freenode.net](irc://irc.freenode.net/openindiana)
| Development IRC channel | [#oi-dev on irc.freenode.net](irc://irc.freenode.net/oi-dev)
| Documentation IRC channel | [#oi-documentation on irc.freenode.net](irc://irc.freenode.net/oi-documentation)
| OpenIndiana Mailing Lists | <http://openindiana.org/mailman>
| OpenIndiana Wiki | <http://wiki.openindiana.org>
| OpenIndiana Bug Tracker | <http://www.illumos.org/projects/openindiana/issues>

## Installing OpenIndiana

< Place Holder for content >

<!--

TODO:

For some guidance writing this section:
http://technodrone.blogspot.com/2012/05/openindiana-installation-walkthrough.html

Installation videos:
https://www.youtube.com/watch?v#VVWP_5oAy3w

-->

### Installing OpenIndiana from Live Media

To install OpenIndiana from Live Media, you have two options.

* GUI based guided install.
* Text based guided install.

Each of these options is represented by a desktop icon.
Select the appropriate installer option by clicking the corresponding desktop installer icon.

#### GUI based Guided Install

< Place Holder for Content >

#### Text based Guided Install

The text based guided install start and runs within a command line console.
Navigation within the installer is performed by pressing specifically designated navigation keys (F2, Tab, etc.).

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
The non-graphical text based bootable media installer also uses this very same _Text based Guided Install_.
</div>

Start the Text based Guided Install by double clicking the Text based Guided Install icon.

![Welcome Screen](images/handbook/text_install/text_install1.png)

When you begin the Text based Guided Install, you are presented with the welcome screen.
Press F2 to continue.

![Disks](images/handbook/text_install/text_install2.png)

The installer identifies the disks which are available for installation.
If you have only a single disk, it is already selected.
If you have multiple disks, use the arrow keys to select the appropriate disk.
When finished, press F2 to continue.

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Disregard the minimum and recommended sizes as they do not take into account periodic disk usage growth as the result of ZFS snapshots.
To account for this, your disk should be at least 25GB or more.
</div>

![GPT Warning](images/handbook/text_install/text_install3.png)

If your disk contains a GPT disk label, the entire disk will be reformatted.
This warning serves as your advisory.
If this is acceptable, press F2 to continue.
Otherwise use the arrow keys to select cancel.

![Fdisk Partitions](images/handbook/text_install/text_install4.png)

In this screen you are presented with the choice of how to partition the disk.
You may select to use an EFI partition (which uses the entire disk), or you may choose to create MBR partitions.
Using the arrow keys select the appropriate choice and press F2 to continue.

![Network 1](images/handbook/text_install/text_install5.png)

Specify the computer name you wish to use.
By default the computer name is _openindiana_.

![Network 2](images/handbook/text_install/text_install6.png)

This screen is the same as as the previous.
We have illustrated it twice to help clarify the 2 distinct configuration tasks which need to be completed on the screen.

After configuring the computer name, now you need to decide whether to automatically configure networking (DHCP), or leave network unconfigured.
Use the arrow keys to select your choice.
Press the F2 key to continue.

![Time Zone - Region](images/handbook/text_install/text_install7.png)

In this screen (and the following 2 screens) you will configure your time zone.
If you select UTC/GMT, you will only be presented with this single screen.
Using the arrow keys select the appropriate region.
Press F2 to continue.

![Time Zone - Location](images/handbook/text_install/text_install8.png)

Using the arrow keys, select your time zone location.
Press F2 to continue.

![Time Zone](images/handbook/text_install/text_install9.png)

Using the arrow keys, select the appropriate time zone.
Press F2 to continue.

![Date and Time](images/handbook/text_install/text_install10.png)

In this screen you may configure the date and time.
Using the arrow keys navigate between the fields.
Press F2 to continue.

![Users](images/handbook/text_install/text_install11.png)

In this screen you are presented with several different fields to configure.
Using the arrow keys navigate between the fields.
Press F2 to continue.

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE**
<div class="well">
The regular user specified on this screen is granted the _root_ role.
In effect this means by default (and without any further configuration) this user can perform administrative task by assuming the root role as needed.
Also, after installation the root password is automatically expired and needs to be changed prior to being used for any administrative task.
</div>

![Installation Summary](images/handbook/text_install/text_install12.png)

Now that you have completed the installation configuration, you are presented with an _Installation Summary_.
If these configuration settings are correct, begin the installation by pressing the F2 key.

![Transferring Contents](images/handbook/text_install/text_install13.png)

Installation progress is measured by means of a status bar.

![Installation Complete](images/handbook/text_install/text_install14.png)

After the installation completes you are presented with a summary screen.
The installation logs are available by pressing the F4 key.
If you ran the installation from Live Media, can exit the installation by pressing F9.
Otherwise, you will want to reboot the system using the F8 key.

### Installing OpenIndiana using the Text Installer

The text installer is not graphical nor does not have a live environment.
When you boot from the text installer, it immediately begins the installation process using the previously described _Text based Guided Install_.

## Troubleshooting Installations

* If you do not see a menu after booting your computer with the DVD or USB device, and instead see some text and a "grub>" prompt, there may be an error in your copy of the installer, or it was created incorrectly.
* If you see a "login:" prompt after selecting your keyboard and language and no desktop appears after several seconds, there may be a problem with the drivers for your graphics hardware.
    * Please let us know via IRC or the mailing list if this happens.
    * When you contact us, please include any error messages you see on the console, as well as the output of the `svcs -xv` command.
    * If possible, also include the contents of the file `/var/log/Xorg.0.log`.

<!--

TODO:

Bring this guidance in alignment with the USB 3.0 warnings found elsewhere in this document.

-->

### USB 3.0 issues

* OpenIndiana Hipster does not currently support USB3.
* You cannot boot a USB thumbdrive installer from a USB3 port.

## Using OpenIndiana

< Place holder for section introduction content >

### Configuring Networking

< Place holder for section introduction content >

#### Command Line

#### Manual Configuration (static IP)


```bash
:~$ sudo svcadm disable physical:nwam
```

Define in your IP/hostname ```/etc/hosts```, if not already, an entry for this host. For example:

```bash
192.168.1.22 hostname hostname.local localhost loghost
# Subsittude 192.168.1.22 for YOUR IP
```

Enable the default physical service with ```svcadm``` and configure the ```interface```:

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

#### Automatic Configuration (NWAM)

* How to use NWAM (network auto magic)

#### Desktop GUI

#### Manual Configuration

< Place Holder >

#### Automatic Configuration

< Place Holder >

#### Troubleshooting

* Make sure the network auto magic 'Location' setting is configured as 'Automatic' and not 'NoNet'

### Video Card Support (3D)

Nearly all cards are supported for 2nd, but only Nvidia is supported for 3D.
Work is progressing to provide support for AMD and Intel.

#### Nvidia

* Talk about the expected behavior when booting the live CD from a system with an NVIDIA card.
* Discuss procedure for adding an NVIDIA card to a system that was using VESA or some other non-3d video driver.
* Troubleshooting - what logs to look at, manual configuration, etc.
* Walk through NVIDIA utility screens.

#### AMD

* Currently no 3rd support, VESA driver only.

#### Intel

* Still working to incorporate this into Hipster.

### How does one add a missing device driver?

< Write about finding hardware id's, searching for drivers, installing, loading, /etc/driver_alias'es file. >

### How can the desktop be modified?

* Gnome walkthrough
* Appearance applet
    * Enabling Compiz
    * Configuring font anti-aliasing

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

<!--

Tips for writing this section:

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


### Configuring a UPS

* NUT?


### How does one perform system backups?

* Time Machine
* ZFS exports
* Bacula?


### How does one add additional users?

* Basic system administration
* Basic Unix commands


### Working with storage and file systems


< Place holder for section introduction content >

#### How does one mount or import additional disks?

<!--

TODO:

* Talk about the ZFS import command.
* Need a walkthrough of mounting options for other filesystems...NTFS, FAT, UFS, etc.

-->

#### commands used

* `mount`

#### NTFS support - 3rd party

* [http://jp-andre.pagesperso-orange.fr/openindiana-ntfs-3g.html](http://jp-andre.pagesperso-orange.fr/openindiana-ntfs-3g.html)


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


### Using OpenIndiana as a NAS

< place holder for section introduction content >


#### Configuring OpenIndiana as a CIFS (Samba) Server

##### Home NAS setup steps

* Get the hardware
* Assemble the hardware
* Install OpenIndiana
* Configure OpenIndiana
* Configure Windows

##### commands used

* `sharemgr` - configure and manage file sharing
* `smbadm` - configure and manage CIFS local groups and users, and manage domain membership
* `zfs` - configures ZFS file systems
* `passwd` - change login password and password attributes
* `chown` - change file ownership

<!--

For a variation of configuring a home NAS - this could be done virtually as well

* Running OI as a VMware EXSI guest
    * Local storage hardware is passed through to the OI guest and then shared via ISCSI, CIFS, NFS, etc.

For help writing this section, see the following OpenSolaris references:

* [Setting Up an OpenSolaris NAS Box](https://web.archive.org/web/20091008234550/http://developers.sun.com/openstorage/articles/opensolaris_nas.html)
* [Getting Started With the Solaris CIFS Service](https://web.archive.org/web/20091005070838/http://wiki.genunix.org/wiki/index.php/Getting_Started_With_the_Solaris_CIFS_Service)
* [How to enable guest access to a Solaris CIFS share](https://web.archive.org/web/20091021005616/http://blogs.sun.com/afshinsa/entry/how_to_enable_guest_access)
* [Solaris CIFS Service Troubleshooting](https://web.archive.org/web/20091126111451/http://wiki.genunix.org/wiki/index.php/Solaris_CIFS_Service_Troubleshooting)
* [What's New With Solaris CIFS](https://web.archive.org/web/20091124124935/http://wiki.genunix.org/wiki/index.php/What's_New_With_Solaris_CIFS)
* [CIFS Technical References](https://web.archive.org/web/20090725231658/http://wiki.genunix.org/wiki/index.php/CIFS_Technical_References)

Also have a look at the [OpenSolaris CIFS Administration Guide](https://docs.oracle.com/cd/E19120-01/open.solaris/820-2429/820-2429.pdf)

-->

Start by listing available storage pools.

```bash
# zfs list

NAME                           USED  AVAIL  REFER  MOUNTPOINT
storage                        498K   899G    19K  /storage

```

Create your ZFS dataset to be shared via CIFS/SMB.

```bash
# zfs create -o casesensitivity=mixed -o sharesmb=on storage/backup

```

Start the CIFS service.

```bash
# svcadm enable -r smb/server
```

Join the CIFS server to a workgroup.

```bash
# smbadm join -w WORKGROUP
```

Configure PAM authentication for the CIFS service.

```bash
# echo "other password required pam_smb_passwd.so.1 nowarn" >> /etc/pam.conf
```

Reset the password for the local user accounts which will be used for remotely accessing the CIFS/SMB share.

```bash
# passwd <user_account>
```

Set the share name to be used for the CIFS/SMB share.

```bash
# zfs set sharesmb=name=backup storage/backup
```

Change the ownership of ZFS dataset to the user account which will be used for remotely accessing the CIFS/SMB share.

```bash
# chown -R <user_account> /storage/backup
```

Verify everything is all set to go.

```bash
# sharemgr show -vp

default nfs=()
smb smb=()
        * /var/smb/cvol  smb=() ""
                  c$=/var/smb/cvol       smb=(abe="false" guestok="false")      "Default Share"
zfs smb=()
    zfs/storage/backup smb=()
          backup=/storage/backup
```

You can create additional CIFS datasets using the following 4 commands.

```bash
# zfs create -o casesensitivity=mixed -o sharesmb=on <pool_name/dataset_name>
# zfs set sharesmb=name=<new_share_name> <pool_name/dataset_name>
# chown -R <user_account> <path_to_dataset>
# sharemgr show -vp

```

##### Configuring CIFS/SMB linux client connectivity


Adding a remote share using the linux smbclient

* [Accessing an SMB Share With Linux Machines](http://www.tldp.org/HOWTO/SMB-HOWTO-8.html)

Adding a remote share using the KDE Dolphin file manager GUI

* In the left hand pane click _Network_
* In the right hand pane click _Add Network Folder_
* The Network Folder Wizard opens
* Select the radio button for _Microsoft Windows network drive_ and click next
* Specify a name for the share - can be anything - this is just a label
* Specify the remote CIFS/SMB server name (or IP address)
* Specify the share name of the remote CIFS/SMB share
* Click the save and connect button
* You'll be prompted for a remote username and password
* Ensure the checkbox is marked to save credentials or you'll be asked for everything you do.

Adding a remote share using a Windows client

* < place_holder >



#### Configuring OpenIndiana as an NFS Server

< Place holder for content >


#### Configuring OpenIndiana as an ISCSI Target Server -(COMSTAR)

< Place holder for content >


### Getting OI to play Multimedia

* How to get OI to play a DVD
* How to get flash player installed and working.
* How to get VLC installed and working.
* Codecs, etc.
* How to use the hidden `gstreamer-properties` configuration utility.


### Using OpenIndiana as a Media server, HTPC, etc.

* <http://forum.kodi.tv/showthread.php?tid=44315&page=2>
* <http://lightsandshapes.com/plex-on-smartos.html>


### Graphics workstation

< Place holder for content >


### Desktop Publishing system, Etc.

< Place holder for content >


### Virtualization Storage Server

* Poor man's standalone ISCSI SAN linked to a 2nd machine running VMware ESXI (2 computers required)
    * A variation of this would be to run OI as an ESXI guest with local storage hardware "passed through" to OI and then subsequently share ZFS volumes via  ISCSI with the ESXI host itself. In this configuration, OI effectively becomes a SAN (1 computer required)


### Virtualization Server

* Qemu-KVM walkthrough (Does hipster even have this package?)
    * Yes, KVM is the package name
* Using VIRSH, Virt-manager, etc. (Does hipster [or any illumos distro for that matter] even have virsh or Virt-manager)
    * If not, what tools are used to manage the Joyant KVM port (VMADM perhaps?)
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

### Zones - running web stuff in zone, development, etc.

* Need to mention some of the changes to zone management...e.g..
    * sys-unconfig gone.
    * sysding replaced syscfg
        * now have to have DNS, root password, etc. all configured inside the zone before being able to logon using `zlogin -C <zonename>`, otherwise have to do `zlogin <zonename>`. So a fair amount of stuff has changed there.


### Clustering with Open HA Cluster

See old sun docs

* <http://docs.oracle.com/cd/E19735-01/>

Also see:

* <http://zfs-create.blogspot.nl/>


## Developing with OpenIndiana

<!--

DOC TEAM NOTE:

The book titled "Introduction to Operating Systems: A Hands-On Approach Using the OpenSolaris Project" may be a good resource for helping to complete this part of the handbook.

-->

## How can OI be used as a development platform?

< Place holder for content >

## What programming tools, languages, etc., are available?

< Place holder for content >

## How can OI be used to further the development of OI itself?

< Place holder for content >

## Software Development Testing

< Place Holder >

<!--

TODO:

Need to add some guidance about how to add a test repo to test specific packages, etc.

-->

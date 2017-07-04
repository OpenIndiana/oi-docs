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

## Performing System Administration Tasks

OpenIndiana is a multi-user platform. The role of administering the system is
assigned to one privilaged user known as the _superuser_ or _root_ user. This user
is assigned all privilages.

To become root, it is possible to switch user using the command: [su(1M)](https://illumos.org/man/1M/su).

However, it is not always feasible for one user to perform all administrative
tasks. It would be considerably more flexible if some tasks could be performed
by some, say, experienced users. Moreover, down the years it was realised that
assigning certain administrative tasks to several users is benificial, e.g.,
monitoring various system parameters or system repair in
emergencies. Furthermore, security concerns dictate that performing sensitive
administration tasks would be more secure if carried out by a user with a
minimum number of privilages.

It is not always prudent to perform system administration duties as the
superuser.

In view of the above considerations a mechanism was developed whereby users
could be assigned a select number of privilages by the superuser. There are a
number of different possibilities of assigning privilages to users:

* [sudo(1m)](https://illumos.org/man/1M/sudo).
* [pfexec(1)](https://illumos.org/man/1/pfexec).
* [roles(1)](https://illumos.org/man/1/roles).

The `sudo` command, i.e., superuser do, is the least sophisticated of these
commands. It permits a user to use _all_ supperuser commands without having to
become the superuser. A sudo enabled user, simply precedes a command with
`sudo`. 

To enable a user the ability to use `sudo`, the superuser edits `/etc/sudoers`.
This should ideally be done as follows:

```
visudo
```

This performs various syntax checks. 
[sudoers(1)](https://illumos.org/man/1/sudoers) provides details on the precise
means to appropriately add a user to use sudo.

Example:

To shutdown the system, root privilages are required. If a standard user issues
the `shutdown` command, the system will issue a warning. However, if the user is
allowed to use sudo, then the user can now shutdown the system:

```
sudo shutdown 
```

The user is then prompted for the user's password and a file is checked to
establish whether the user is permitted to perform the operation.

The `pfexec` command is more flexibly in the number of privilages that can be
assigned to a user.

It also worth mentioning an additional method of assigning privilages to users:
roles. The idea behind roles is a sophisticated and powerful mechanism. It was
originally developed with security in mind. 

The superuser can define roles, assign various privilages to these roles and
then assign a set of roles to a user. In other words, it allows a much more
fine grained means of assigning privilages to users as opposed to the 'all or
nothing' method of sudo.

## Basic system information

#### System processes

```markdown
prstat
```

This command provides a host of information on all processes running on the system.
Some of the information provided is as follows:

- percentage of CPU used by each process
- amount of memory consumed by each process
- unique id of each process (which can, for example, be used to stop the process)

#### Disk usage

```markdown
df -h
```

Provides information on disk size, amount of space used and available free space
for all attached storage devices. The `-h` option reports this information in
human readable format.

#### Largest files in a directory

Go to the directory using the `cd` command and issue the following command:

```markdown
du | sort -n
```

This will list the size of each file in the current directory and all
subdirectories, starting with the smallest up to the largest files.

#### Who is logged on to the system

```markdown
listusers
```

#### List all software packages installed on the system

```markdown
pkg list
```

### System shutdown, reboot, ...

OpenIndiana defines a number of different system states known as run-levels. You
can change from one system state to another by using the `shutdown` command and
specify the run-level using the `i` option. You can always determine the
run-level via `who -r`.

You must be root or have root privilages (e.g., using `sudo`) to send the system
into a different state, i.e., turn off, reboot, etc. Shutdown and turn off all
hardware (if supported by the hardware) now:

```markdown
shutdown -i5 -g0 -y
```

Changing the run-level of the system can be disruptive to other users currently
using the system. Thus, it is always wise to establish who is currently logged
onto the system before changing the run-level.

* `-i [run-level]` is used to specifiy the run-level. This is either a digit or a
  single letter. Here are some run-levels available:
    * `5` stop all system services, and turns off hardware devices, etc. Here
      are some run-levels.
    * `6` reboot the system.
    * `1` single-user mode. Primarily used for system maintenance.
    * `S` single-user mode where only a command line terminal is available.
* `-g [seconds]` is used to specify the number of seconds after which to commence
   shutting down services. `0` immediately intiates shutting down all services.
* `-y` automatically answers all system questions with 'yes'. The shutdown
   process is not interrupted by system prompts requiring user-interactive
   intervention.

 

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

**Start a service**

```
svcadm enable <service name>
```

**Start service along with it's dependencies**

```
svcadm enable -r <service name>
```

**Start a service temporarily (won't survive a reboot)**

```
svcadm enable -t <service name>
```

**Check service dependencies**

```
svcs -d <service name >
```

**Check status of services**

```
svcs -vx
```

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

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

Possible resources to help write this section:

* <https://wiki.openindiana.org/oi/4.4+Localization>
* <https://docs.oracle.com/cd/E23824_01/html/E26033/glmen.html>

</div>


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


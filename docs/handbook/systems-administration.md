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

Once OpenIndiana has been installed, the system will require monitoring to
ensure smooth operation. Software will periodically have to be updated,
redundant software removed, new users added to the system, etc. All these
activities and many more are referred to as system administration.

Basic system administration can be reduced to a number of common tasks:

- Management of system resources
- Installation and maintenance of software
- User administration

While it is certainly possible to add more to this list or select alternative
items, this small selection is readily absorbed and is convenient to illustrate
a number of essential concepts central to OpenIndiana system administration.

Before we discuss these topics, it is first important to introduce how these
tasks can be carried out.


## Performing System Administration Tasks

OpenIndiana is a multi-user platform. The role of administering the system was
traditionally assigned to one privileged user known as the _superuser_ or _root_
user. This user is assigned _all_ privileges.

To become root, it is possible to switch user using the command: [su(1M)](https://illumos.org/man/1M/su).

However, it is not always feasible for one user to perform all administrative
tasks. It would be more flexible if some tasks could be performed by some, say,
experienced users. To enable some users to carry out a command with _all_ root
privileges, or to _do_ an administrative command sudo(1m) can be used.

However, security concerns dictate that performing sensitive administration
tasks would be more secure if carried out by a user with a minimum number of
privileges. Both aforementioned mechanisms provide _all_ privileges.

It is not always prudent to perform system administration duties with all
privileges.

Hence, a mechanism was developed whereby users could be assigned a select number
of privileges by the superuser. OpenIndia provides, in addition to these
traditional  mechanisms, a richer means to perform these duties known as
Role-Based Access Control.

RBAC involves collecting a select number of privileges and bundling these
together as a role. A user can then be assigned one, or several roles.


### root: [su(1M)](https://illumos.org/man/1M/su)

This is historically the privileged, super user that can perform all
administrative tasks.

Use the `su` command to login as root:

```
su
Password:
```

### SUperuser DO: sudo(1m)

The `sudo` command, i.e., superuser do, permits a user to use _all_ supperuser
commands without having to become the superuser. A sudo enabled user, simply
precedes a command with `sudo`.

To enable a user the ability to use `sudo`, the superuser edits `/etc/sudoers`.
This should ideally be done as follows:

```
visudo
```

This performs various syntax checks.
sudoers(1) provides details on the precise
means to appropriately add a user to use sudo.

Example:

To shutdown the system, root privileges are required. If a standard user issues
the `shutdown` command, the system will issue a warning. However, if the user has
been enabled to use sudo, then the user can now shutdown the system:

```
sudo shutdown -i5 -g0 -y
```

The user is then prompted for the user's password and a file is checked to
establish whether the user is permitted to perform the operation.
The options are explained below.

### Role-Based Access Control (RBAC)

The _all-or-nothing_ power assigned to the root user has its obvious
limitations.  While sudo is an improvement by limiting root privileges for only
a single command, a user allowed to use sudo has access to all root commands.

An improvement on the above systems would be one in which privileges could be
assigned on a more fine-grained and selective basis.

Imagine a user assigned the task of administrating some particular hardware, for
example, printers attached to the system.  A more desirable system would be one
in which this user had the ability to permit users to use a printing device,
remove print jobs from the print spool, add new printers to the system, ...
Moreover, it would be advantageous if it were possible to assign privileges to
perform only these actions and none other.

RBAC was developed to accomplish this.


#### What is RBAC


#### How to use RBAC

The root user or a user with sudo enabled can shutdown the system.
We can use RBAC to enable a user to be able to shutdown the system. However, we
can create a role that allows only the privilege to shutdown the system, and
no additional privileges. We can then assign this role to one or several users.

- assign a privilege to a role to shutdown the system

```
roleadd shutdown
```

- Assign a password

```
passwd shutdown
```

- Assign this role to a user

```
usermod -R shutdown whoever
```


- Create a SHUTDOWN profile

```
echo "SHUTDOWN:::profile to shutdown:help=shutdown.html" >> /etc/security/prof_attr
```

- Okay, now assign the role profile SHUTDOWN to the role shutdown

```
rolemod -P SHUTDOWN shutdown
```

- Assign some administrative command to profile

```
echo "SHUTDOWN:suser:cmd:::/usr/sbin/shutdown:uid=0" >> /etc/security/exec_attr
```

- Use it

```
su shutdown
shutdown -i5 -g0 -y
```


Now user whoever can shutdown the system.



The `pfexec` command is more flexibly in the number of privileges that can be
assigned to a user.

It also worth mentioning an additional method of assigning privileges to users:
roles. The idea behind roles is a sophisticated and powerful mechanism. It was
originally developed with security in mind.

The superuser can define roles, assign various privileges to these roles and
then assign a set of roles to a user. In other words, it allows a much more
fine grained means of assigning privileges to users as opposed to the 'all or
nothing' method of sudo.

### Convention

Instead of elaborating each administrative command with one of the above means
of acquiring administrative privileges, it has become standard procedure to prefix
the command with a dollar character.

Example:

```
$ shutdown -i5 -g0 -y
```


## Management of System Resources

### Basic system information

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
sub-directories, starting with the smallest up to the largest files.

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

You must be root or have root privileges (e.g., using `sudo`) to send the system
into a different state, i.e., turn off, reboot, etc. Shutdown and turn off all
hardware (if supported by the hardware) now:

```markdown
shutdown -i5 -g0 -y
```

Changing the run-level of the system can be disruptive to other users currently
using the system. Thus, it is always wise to establish who is currently logged
onto the system before changing the run-level.

* `-i [run-level]` is used to specify the run-level. This is either a digit or a
  single letter. Here are some run-levels available:
    * `5` stop all system services, and turns off hardware devices, etc.
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
ITEMS TO WRITE ABOUT: provide more detailed explanations.
</div>

List services:

```
svcs # list (permanently) enabled services
svcs -a # list all services
svcs -vx # list faulty services
```

Get information about a service:

```
svcs <service name> # one-line status
svcs -x <service name> # important information
svcs -d <service name> # check the service's dependencies
svcs -l <service name> # all the available information
```

Start a service:

```
svcadm enable <service name> # permanently enable/start
svcadm enable -t <service name> # temporary start (won't survive a reboot)
svcadm enable -r <service name> # permanently enable/start service along with its dependencies
```

Restart / reload a service:

```
svcadm refresh <service name> # reload the service's configuration
svcadm restart <service name> # restart the service
```


### Systems logging and monitoring

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **DOC TEAM NOTE:**
<div class="well">
ITEMS TO WRITE ABOUT:

* Where to find the logs (`/var/log`, `/var/svc/log`).
</div>


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

Zones are an OpenIndiana feature that provides <a href="http://www.wikipedia.org/wiki/Operating_system-level_virtualization">operating system-level virtualization</a>. Each zone is managed as a completely separate OpenIndiana machine. Zones have very low overhead and are one of the most efficient forms of OS virtualization.

The global zone (GZ) is the operating system itself, which has hardware access. From the global zone, non-global zones (NGZ) are created and booted. Boot time for non-global zones is very fast, often a few seconds. The CPU, network, and memory resources for each zone can be controlled from the global zone, ensuring fair access to system resources. Disk space access is usually controlled by ZFS (with quotas and reservations if needed), as well as mounting of filesystem resources with NFS or lofs. As with other forms of virtualization, each zone is isolated from the other zones – zones cannot see processes or resources used in other zones. The low marginal cost of a zone allows large systems have tens or even hundreds of zones without significant overhead. The theoretical limit to the number of zones on a single platform is 8,192.

Different releases of (Open)Solaris used different packaging distribution method for the global zone. OpenIndiana zones use two basic brands - "ipkg" and "nlipkg", which are based on IPS Packaging. The brand determines how zone is initialized and how zone's processes are treated by kernel. Both type of zones represent a PKG image. "ipkg"-branded zones are tightly coupled with GZ.Image pakaging system (IPS) knows about ipkg-branded zones and can perform several actions simultaneously in GZ and NGZ. For example, you can update all your zones and GZ with a single "pkg update -r" command. IPS can ensure some depenencies between packages in GZ and NGZ. To allow this it cheks that NGZ's publishers are a superset of GZ's publishers and their properties are the same (for example, stickiness or repository location). As this is not always suitable for development zones, "nlipkg"-branded zones were introduced. "nlipkg"-branded zone behave like completely independent instance and IPS ignores them during operations in GZ.

An easy way to implement zones is to use a separate ZFS file system as the zone root's backing store. File systems are easy to create in ZFS and zones can take advantage of the ZFS snapshot and clone features. Due to the strong isolation between zones, sharing a file system must be done with traditional file sharing methods (eg NFS).

When each zone is created  it comes with a minimal set of packages, and from there you can add and use most packages and applications as required.

### Quick Setup Example

Zone creation consists of two steps - creating zone configuration and zone installation or cloning. Zone configuration determines basic parameters, such as zone's root location and provided resources.
Zone configuration is performed using zonecfg tool, zone administration (for example, installation) is performed using zoneadm tool.

For example, we create a simple zone:

```
# zonecfg -z example
example: No such zone configured
Use 'create' to begin configuring a new zone.
zonecfg:example> create
zonecfg:example> add net
zonecfg:example:net> set physical=e1000g0
zonecfg:example:net> set address=192.168.0.10/24
zonecfg:example:net> end
zonecfg:example> set zonepath=/zones/example
zonecfg:example> verify
zonecfg:example> commit
zonecfg:example> exit

```

Here `create` puts you inside the zone configuration program where you can change and update settings particular to the zone specified with -z.
`zonecfg` break different resource groups of data, you add a new resource with add.
The next block adds ressource "net", configuring network in default `shared` ip-type mode. It allows zone to share IP stack with GZ. If you want to
get dedicated nic in NGZ, you have to use `set ip-type=exclusive`. In exclusive mode zone has complete control over network interface and you
can't assigned address in zonecfg prompt.
After network configuration `zonepath` is set. It's a location for zone's root file system, which should be a ZFS filesystem.
The `verify` command checks that no mistakes were made.
Finally changes are committed (saved to zone configuration file).

After configuring a zone you can install it with `zoneadm install` subcommand:

```
# zoneadm -z example install
```

During installation pkg image rooted at $zonepath/root is created and minimal set of packages is installed to the image.
When installation finishes, zone can be booted with `zoneadm -z example boot` command. If you want your zone to boot automatically during system startup,
you should set autoboot parameter to true during zone configuration:

```
zonecfg:example> set autoboot=true
```

Once zone is booted you can log in locally with `zlogin example`, or you can ssh in via the IP address you provided to zone config.

<div class="well">
Note, that on first zone boot sysding(1M) will set root's password to NP. Before this happened you will not be able to login to zone with zlogin, so this command will not work on early startup stage.
</div>

#### System repository configuration

In latest OpenIndiana versions (starting from November 2017) it's possible to configure so-called zone proxy daemon. This configuration is intended to use GZ proxy service for NGZs to access configured publishers
and can be useful for sharing pkg cache between zones or to provide network access for performing updates to otherwise restricted zone environment (i.e. to zone without Internet access).

The functionality is provided by series of services in GZ and NGZs. In GZ two services are running: system repository service and zones proxy daemon (see `pkg.sysrepo(1M)`). In NGZ zones proxy client
communicates with GZ's zone proxy daemon.
System repository service `svc:/application/pkg/system-repository`  is responsible for providing access to the package repositories configured in a reference image through a centralized proxy.
Zones proxy daemon service `svc:/application/pkg/zones-proxyd` starts on system boot and registers door in each running ipkg-branded zone (the door is created at `/var/tmp/zoneproxy_door` path).
Later, on zone startup or shutdown /usr/lib/zones/zoneproxy-adm is used to notify zones-proxyd, so that it could create the door for the zone or to cleanup it.
Zones proxy daemon client `svc:/application/pkg/zones-proxy-client:default` runs in NGZ and talks to GZ's zones-proxyd via created door.
<div class="well">
Note, you can't use system repository with nlipkg-branded zones.
</div>

IPS determines if it should use zones proxy client in zone based on image's use-system-repo property (which is false by default).

To configure your system to use system repository, perform the following actions.

1) In global zone:

```
# pkg install pkg:/package/pkg/system-repository pkg:/package/pkg/zones-proxy
# svcadm enable svc:/application/pkg/system-repository:default
# svcadm enable svc:/application/pkg/zones-proxyd:default
```

2) In NGZ:

```
# svcadm enable svc:/application/pkg/zones-proxy-client:default
# pkg set-property use-system-repo True
```

After this in NGZ in publisher description you'll see system-repository location:

```
# pkg publisher
PUBLISHER                   TYPE     STATUS P LOCATION
openindiana.org (non-sticky, syspub) origin   online T <system-repository>
hipster-encumbered (syspub)     origin   online T <system-repository>
```

You can check if your configuration works by issuing `pkg refresh` command in zone. `pkg(1M)` should contact repository indirectly via zones-proxy-client.

To convert you zone back to non-proxied configuration, run

```
# pkg set-property use-system-repo False
```

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

Define your IP/hostname in `/etc/hosts`. For example:

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


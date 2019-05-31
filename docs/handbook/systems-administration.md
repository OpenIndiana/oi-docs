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

- Users and account management
- Management of system resources
- Installation and maintenance of software

While it is certainly possible to add more to this list or select alternative
items, this small selection is readily absorbed and is convenient to illustrate
a number of essential concepts central to OpenIndiana system administration.

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Administrative commands are usually expected to be run with elevated privileges -
directly from root user, via <code>sudo(1M)</code> or
<code>pfexec</code> (if user was granted privileges via RBAC).
In this document commands which require elevated privileges are prefixed with
"# ". Commands, which don't require elevated privileges, are prefixed with "$ ".
</div>

## Users and account management

OpenIndiana allows multiple users to work on the same computer at the same time.
Only one person can sit in front of the monitor and keyboard.
However, many can be remotely logged into machine and work on it.
If a user wants to use the system, he needs an account.

There are also special service accounts which are used by system services.

### User accounts

User accounts are primarily used for day-to-day tasks.
Every user accessing the system should have his own unique account.
This allows the administrator of the system to find out who is doing what.
This also allows him to set different access rights for each user separately.

When system is installed, usually one user account is created.
Additional accounts can be added later.

Every user account has some attributes associated with it.

* **username** - name of the account, which is typed at the login screen.
  Username format is briefly described in [passwd(4)](https://illumos.org/man/4/passwd)
* **password** - password associated with the account.
<div class="well">
Accounts without password should not exist on the system as they could put the system at the security risk!
</div>
* **UID** (user ID) - unique numerical ID of the account in the system.
The maximum value for uid is 2147483647.
However, for compatibility reasons one should not use numbers over 65535.
* **GID** (group ID) - unique numerical ID of the account's primary group.
* **comment** (also referred to as gecos) - account description
Often this filed is set to real user name.
* **home directory** - a path where user will be after he logs into the system.
* **login shell** - user's initial shell program.
* **password last change time** - time when the password was lastly changed.
* password aging information - several [shadow(4)](https://illumos.org/man/4/shadow) fields determining when password should be changed
    * **min** - the minimum number of days required between password changes;
    * **max** - the maximum number of days the password is valid;
    * **warn** - the number of days before password expires that the user is warned.

### Service accounts

Service (system) accounts are used by applications, which are running on the system
and are providing some services to the network such as DNS, SMTP or WWW.
For security reasons these services are ran under non-privileged accounts.

OpenIndiana comes with several service accounts such as `webservd` for web servers,
`pkg5srv` for `pkg(5)` server or `nobody`.
`nobody` is a system account for services needing unprivileged user.
However, the more services are ran under this account,
the more privileged it becomes as it gains access to service processes and files.

### Roles

A role is a basic unit of Role-Based access control (RBAC) or set of privileges one can assume.
A role can be thought of as a no-login account.
It has most of the attributes of normal user account and is identified like normal user,
but is not allowed to log into a system directly.
One should login using regular account and use [su(1M)](https://illumos.org/man/1M/su) to assume the role.

### Superuser account

Every UNIX-like system has the superuser account, named root, used for system administrative tasks.
This account has UID 0.

Using this account for everyday usage like web browsing, email reading or movie watching is not recommended
as root account can operate without any restrictions or limits and could cause serious damage to the system.

If you created user during installation, root is created as role (not a regular account).
This role is assigned to the user created during the installation.
This means that you can't directly log into a system using the root account.
One has to log in as the created user and switch to root role using [su(1M)](https://illumos.org/man/1M/su).

However, if the user was not created during installation, then the root is created as regular account and
is able to log in directly.
Note, that even when root is created as role, one can use this account directly to log into the system when it's
booted in single user mode.

#### SUperuser DO: sudo(1m)

It is not always feasible for one user to perform all administrative
tasks. It would be more flexible if some tasks could be performed by some, say,
experienced users. To enable some users to carry out a command with _all_ root
privileges, or to _do_ an administrative command `sudo(1M)` can be used.

The `sudo` command, i.e., superuser do, permits a regular user to execute the specified
set of commands with supperuser privileges without having to become the superuser.

If user was permitted to use some commands with superuser privileges via `sudo`
he/she can execute them with elevated privileges simply starting command with `sudo`.

To permit a user to use `sudo`, the superuser edits `/etc/sudoers`.

This can be done using special `visudo(1M)` tool.
`visudo` tool edits `/etc/sudoers` file performing various syntax checks.
`sudoers(1)` provides details on the precise
means to appropriately grant user elevated privileges via sudo.

Example:

To shutdown the system, root privileges are required. If a standard user issues
the `shutdown` command, the system will issue a warning. However, if the user has
been enabled to use sudo, then the user can now shutdown the system:

```
$ sudo shutdown -i5 -g0 -y
```

### Managing accounts

There are several tools in OpenIndiana to manage user accounts.
They are listed in the table below.

 Tool                                                |  Description
---------------------------------------------------- | --------------------------------
[useradd(1M)](https://illumos.org/man/1M/useradd)    | creates new account on the system
[userdel(1M)](https://illumos.org/man/1M/userdel)    | deletes account from the system
[usermod(1M)](https://illumos.org/man/1M/usermod)    | modifies account information on the system
[groupadd(1M)](https://illumos.org/man/1M/groupadd)  | creates group on the system
[groupdel(1M)](https://illumos.org/man/1M/groupdel)  | deletes group from the system
[groupmod(1M)](https://illumos.org/man/1M/groupdel)  | modifies group information on the system
[roleadd(1M)](https://illumos.org/man/1M/roleadd)    | creates new role on the system
[roledel(1M)](https://illumos.org/man/1M/roledel)    | deletes role from the system
[rolemod(1M)](https://illumos.org/man/1M/rolemod)    | modifies role information in the system
[passwd(1)](https://illumos.org/man/1/passwd)        | changes login password and password attributes

#### useradd

useradd is a program to create user accounts on the system.
When creating account one can set some attributes of the newly created account such as comment, group membership, home directory path, UID number of the account or login shell.

#### userdel

One can use `userdel` to remove the account from the system.

#### usermod

`usermod` is used to modify properties of existing account.

#### groupadd

`groupadd` creates a new group definition on the system by adding the appropriate to the /etc/group file.

#### groupdel

`groupdel` deletes a group definition from the system.

#### groupmod

When one needs to modify group attributes, `groupmod` should be used.

#### roleadd

`roleadd` is used create roles in the system.

#### roledel

`roledel` deletes selected role from the system.

#### rolemod

`rolemod` modifies role's information on the system.

#### passwd

`passwd` changes password for user accounts.
An unprivileged user may only change the password for his/her own account, while the superuser may change the password for any account.
Privileged user can also use `paasswd` to change login password attributes (such as expiration date) or lock the account.

### Role-Based Access Control (RBAC)

The _all-or-nothing_ power assigned to the root user has its obvious
limitations.  While sudo is an improvement by limiting root privileges for only
several commands, more granular control is often desired.

An improvement on the above systems would be one in which privileges could be
assigned on a more fine-grained and selective basis.

Imagine a user assigned the task of administrating some particular hardware, for
example, printers attached to the system.  A more desirable system would be one
in which this user had the ability to permit users to use a printing device,
remove print jobs from the print spool or add new printers to the system.
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
# roleadd shutdown
```

- Assign a password

```
# passwd shutdown
```

- Assign this role to a user

```
# usermod -R shutdown whoever
```


- Create a SHUTDOWN profile

```
# echo "SHUTDOWN:::profile to shutdown:help=shutdown.html" >> /etc/security/prof_attr
```

- Okay, now assign the role profile SHUTDOWN to the role shutdown

```
# rolemod -P SHUTDOWN shutdown
```

- Assign some administrative command to profile

```
# echo "SHUTDOWN:suser:cmd:::/usr/sbin/shutdown:uid=0" >> /etc/security/exec_attr
```

- Use it

```
$ su shutdown
# shutdown -i5 -g0 -y
```

Now user whoever can shutdown the system.


The `pfexec` command is more flexible in the number of privileges that can be
assigned to a user.

## Management of System Resources

### Basic system information

#### System processes

```bash
$ prstat
```

This command provides a host of information on all processes running on the system.
Some of the information provided is as follows:

- percentage of CPU used by each process
- amount of memory consumed by each process
- unique id of each process (which can, for example, be used to stop the process)

#### Disk usage

```bash
# df -h
```

Provides information on disk size, amount of space used and available free space
for all attached storage devices. The `-h` option reports this information in
human readable format.

#### Largest files in a directory

Go to the directory using the `cd` command and issue the following command:

```bash
$ du | sort -n
```

This will list the size of each file in the current directory and all
sub-directories, starting with the smallest up to the largest files.

#### Who is logged on to the system

```bash
$ listusers
```

#### List all software packages installed on the system

```bash
$ pkg list
```

### System shutdown, reboot, ...

OpenIndiana defines a number of different system states known as run-levels. You
can change from one system state to another by using the `shutdown` command and
specify the run-level using the `i` option. You can always determine the
run-level via `who -r`.

You must be root or have root privileges (e.g., using `sudo`) to send the system
into a different state, i.e., turn off, reboot, etc. Shutdown and turn off all
hardware (if supported by the hardware) now:

```
# shutdown -i5 -g0 -y
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
$ svcs # list (permanently) enabled services
$ svcs -a # list all services
$ svcs -vx # list faulty services
```

Get information about a service:

```
$ svcs <service name> # one-line status
$ svcs -x <service name> # important information
$ svcs -d <service name> # check the service's dependencies
$ svcs -l <service name> # all the available information
```

Start a service:

```
# svcadm enable <service name> # permanently enable/start
# svcadm enable -t <service name> # temporary start (won't survive a reboot)
# svcadm enable -r <service name> # permanently enable/start service along with its dependencies
```

Restart / reload a service:

```
# svcadm refresh <service name> # reload the service's configuration
# svcadm restart <service name> # restart the service
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

Different releases of (Open)Solaris used different packaging distribution method for the global zone. OpenIndiana zones use two basic brands - "ipkg" and "nlipkg", which are based on IPS Packaging. The brand determines how zone is initialized and how zone's processes are treated by kernel. Both type of zones represent a PKG image. "ipkg"-branded zones are tightly coupled with GZ. Image pakaging system (IPS) knows about ipkg-branded zones and can perform several actions simultaneously in GZ and NGZ. For example, you can update all your zones and GZ with a single "pkg update -r" command. IPS can ensure some depenencies between packages in GZ and NGZ. To allow this it cheks that NGZ's publishers are a superset of GZ's publishers and their properties are the same (for example, stickiness or repository location). As this is not always suitable for development zones, "nlipkg"-branded zones were introduced. "nlipkg"-branded zone behave like completely independent instance and IPS ignores them during operations in GZ.

An easy way to implement zones is to use a separate ZFS file system as the zone root's backing store. File systems are easy to create in ZFS and zones can take advantage of the ZFS snapshot and clone features. Due to the strong isolation between zones, sharing a file system must be done with traditional file sharing methods (eg NFS).

When each zone is created  it comes with a minimal set of packages, and from there you can add and use most packages and applications as required.

### Zone networking model

OpenIndiana zones can use one of two networking models: a shared IP stack and an exclusive IP stack. There are pros and cons to each of them.

Low-level system networking components, such as the ipfilter firewall and the kernel IP routing tables attach to an "IP stack", and are thus either unique to a zone or shared by all zones with the one shared stack. There are also some other nuances, such as that the zones with the shared stack can communicate over IP directly, regardless of their subnetting and, to some extent, default firewall packet filtering (that has to be specially configured), while exclusive-IP zones with addresses in different subnets have to communicate over external routers and are subject to common firewall filtering.

The global zone defines which physical networks and VLANs the NGZ has access to, and hands down the predefined networking interfaces (the NGZ can not use or create other interfaces). Also, while shared networking allows to configure and attach (or detach) network interfaces from GZ to the NGZ "on the fly", changes in exclusive networking require reboot of the zone to propagate device delegation.

A zone with an exclusive IP stack can have all the benefits of dedicated hardware networking, including a firewall, access to promiscuous sniffing, routing, configuration of its own IP address (including use of DHCP and static network addressing), etc. This requires a fully dedicated NIC. Usually this is a VNICs - a virtual adapter with own MAC address, that operate as if the VNIC was plugged directly into local LAN in a particular (or default) VLAN. Note also that the local zones with an exclusive IP stack are not subject to the host's shared-stack firewall.

<div class="well">
Note that if you create zone in VM, the hypervisor can require you to provide some information about its mac addresses. For example, if you configure bridged networking on VirtualBox running on OpenIndiana, you must set secondary-macs property of the VNIC, delegated to VM, to the set of mac addresses  of VNICs created inside VMs and enable promiscous mode on VirtualBox network adapter.
</div>

### Quick Setup Example

Zone creation consists of two steps - creating zone configuration and zone installation or cloning. Zone configuration determines basic parameters, such as zone's root location and provided resources.
Zone configuration is performed using zonecfg tool, zone administration (for example, installation) is performed using zoneadm tool.

For example, we create a simple zone with shared networking model:

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

If you want to use dedicated networking for your zone, you should create VNIC and delegate it to the zone.

```
# dladm create-vnic -l e1000g0 vnic0
```

If you want to specify VLAN id for VNIC, use `-v` `dladm create-vnic` option:

```
# dladm create-vnic -l e1000g0 -v 123 vnic0
```

Now you can create your zone and delegate VNIC to it (note that we set zone's `ip-type` to `exclusive`):

```
# zonecfg -z example
example: No such zone configured
Use 'create' to begin configuring a new zone.
zonecfg:example> create
zonecfg:example> set ip-type=exclusive
zonecfg:example> add net
zonecfg:example:net> set physical=vnic0
zonecfg:example:net> end
zonecfg:example> set zonepath=/zones/example
zonecfg:example> verify
zonecfg:example> commit
zonecfg:example> exit

```

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

Once zone is booted you can log in locally with `zlogin example`. If you created zone with dedicated network adapter, you should configure it inside zone.

<div class="well">
Note, that on first zone boot sysding(1M) will set root's password to NP. Before this happened you will not be able to login to zone with zlogin, so this command will not work on early startup stage.
</div>

### System repository configuration

On OpenIndiana it is possible to allow NGZs to access configured publishers via GZ proxy service (so-called zone proxy daemon).
This can be useful for sharing pkg cache between zones or to provide network access for performing updates to otherwise restricted zone environment (i.e. to zone without Internet access).

The functionality is provided by series of services in GZ and NGZs. In GZ two services are running: system repository service and zones proxy daemon (see `pkg.sysrepo(1M)`). In NGZ zones proxy client
communicates with GZ's zone proxy daemon.
System repository service `svc:/application/pkg/system-repository`  is responsible for providing access to the package repositories configured in a reference image through a centralized proxy.
Zones proxy daemon service `svc:/application/pkg/zones-proxyd` starts on system boot and registers door in each running ipkg-branded zone (the door is created at `/var/tmp/zoneproxy_door` path).
Later, on zone startup or shutdown /usr/lib/zones/zoneproxy-adm is used to notify zones-proxyd, so that it could create the door for the zone or to cleanup it.
Zones proxy daemon client `svc:/application/pkg/zones-proxy-client:default` runs in NGZ and talks to GZ's zones-proxyd via created door.
<div class="well">
Note, you can't use system repository with nlipkg-branded zones.
</div>

IPS determines if it should use zones proxy client in zone based on image's `use-system-repo` property (defaults to False).

To configure your system to use system repository, perform the following actions.

1) In global zone:

```
# pkg install pkg:/package/pkg/system-repository pkg:/package/pkg/zones-proxy
# svcadm enable svc:/application/pkg/system-repository:default
# svcadm enable svc:/application/pkg/zones-proxyd:default
```

2) In non-global zone:

```
# pkg install pkg:/package/pkg/zones-proxy
# svcadm enable svc:/application/pkg/zones-proxy-client:default
# pkg set-property use-system-repo True
```

After this in NGZ's publisher description you'll see system-repository location:

```
# pkg publisher
PUBLISHER                   TYPE     STATUS P LOCATION
openindiana.org (non-sticky, syspub) origin   online T <system-repository>
hipster-encumbered (syspub)     origin   online T <system-repository>
```

You can check if your configuration works by issuing `pkg refresh` command in the zone. `pkg(1M)` should contact repository indirectly via zones-proxy-client.

To revert your zone to proxy-less configuration, run

```
# pkg set-property use-system-repo False
```

### Troubleshooting

Zone configuration and management operations can fail for a number of reasons, sometimes obscure.
This section contains information on how to solve different well-known issues.

#### Fixing zone installation issues

Zones on OpenIndiana use ZFS features to manage boot environments.
Zone's root and its parent directory should be a ZFS dataset.
It's not enough for zone's root (or its parent directory) to be just a directory on ZFS filesystem.
If you try to create a zone which root doesn't satisfy this requirement, you can get the following error:

```
# zoneadm -z example install
Sanity Check: Looking for 'entire' incorporation.
ERROR: the zonepath must be a ZFS dataset.
The parent directory of the zonepath must be a ZFS dataset so that the
zonepath ZFS dataset can be created properly.
```

To fix this, you can just uninstall the zone and create its root dataset manually:

```
# zoneadm -z example uninstall
Are you sure you want to uninstall zone example (y/[n])? y
# zfs create rpool/zones/example
# chmod 700 /zones/example
# zoneadm -z example install
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
# svcadm disable physical:nwam
```

Define your IP/hostname in `/etc/hosts`. For example:

```bash
192.168.1.22 hostname hostname.local localhost loghost
# Subsittude 192.168.1.22 for YOUR IP
```

Enable the default physical service with `svcadm` and configure the `interface`:

```bash
# svcadm enable physical:default
```

Configure interface with ipadm:

```bash
# ipadm create-addr -T static -a local=192.168.1.22/24 bge0/v4static
```

If you do not know what the interface name is (bge0 in this case); then type in

```bash
$ dladm show-link
```

or:

```bash
$ kstat -c net | grep net

# look for hme0, bge0, e1000g0 or soemthing that resembles the driver in use.
```

Add gateway

```bash
# route -p add default 192.168.1.121
```

or

```bash
# nano /etc/defaultrouter

# Enter in your gateways IP
```

Set DNS server(s)

```bash
# nano /etc/resolv.conf

# Enter in the DNS server IP(s)
nameserver 192.168.1.121
```

or

```bash

# echo "nameserver 192.168.1.121" >> /etc/resolv.conf

```

Restart

```bash
# reboot
```

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
IF you cannot ping an external IP (e.g. google.com) run this command and try again.
</div>

```bash
# cp /etc/nsswitch.dns /etc/nsswitch.conf
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
# svcadm restart nwam
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


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

# Hipster Handbook - Network Communications

!!! note
    This is a **DRAFT** document which may contain errors!
    
    Help us improve and expand this site.
    
    Please see the **Contrib** section for more details about joining the OpenIndiana Documentation Team.

< Place holder for Introduction content >


## PPP

< Place holder for content >


## PPPoE

< Place holder for content >


## Email

< Place holder for content >


## WWW server

* Apache
* nginx


## Firewalls

Firewalls are used to filter network traffic based on rules set by the system administrator. Firewall can protect your personal computer or whole company's network from unauthorized network while allowing passage of legitimate network traffic.

### IP Filter

OpenIndiana comes with built-in firewall, IP Filter. IP Filter is the stateful packet filtering and network address translation (NAT) mechanism. IP filter can filter any kind of traffic based on source or destination IP address or pool of IP addresses, source or destination ports, interface or direction of the network traffic. OpenIndiana IP Filter is derived from open source IPFilter software.

!!! note
    To manage IP Filter rules one must assume a role that includes IP Filter Management profile rights or superuser (**root**).

### IP Filter configuration

IP Filter is configured by loadable configurations files stored in `/etc/ipf`. One can create several configuration files in `/etc/ipf` for firewall configuration:

- **ipf.conf** - stores packet filtering rules
- **ipnat.conf** - defines NAT rules
- **ippol.conf** - address pool configuration

If IP Filter SMF service is enabled then the configured rules will be automatically loaded at every boot time of the operating system.

### Packet Filtering

IP Filter ruleset can be configured with the [ipf(1M)](https://illumos.org/man/1M/ipf) or `/etc/ipf/ipf.conf` file. Rules are processed by the _"the last matching rule wins"_ logic. This means that packet passing the IP Filter ruleset from the beggining and the action of the last rule that matched the packet is applied. There are two exceptions, which change this processing. The first one is the use of **quick** keyword, which will apply the rule on the packet and stop further filter rules checks. Another exception is the **group** keyword, which matches packet. Only rules with **group** keyword are used for packet processing.

#### Filtering rules syntax

The following format is used to create filtering rules:

**action [in|out] option keyword, keyword..**

Every rule begins with the action. Action can be one of these:

- **block** - denies packets from passing the filter
- **pass** - allows packets to pass the filter
- **log** - logs the packet. [ipmon(1M)](https://illumos.org/man/1M/ipmon) is used to view the log file.
- **count** - counts packet into the filter statistics. Use [ipfstat(1M)](https://illumos.org/man/1M/ipfstat) to display the statistics.
- **skip** number - skips the filter over number filtering rules
- **auth** - user program is requested to perform packet authentification in order to decide if the packet should be passed or not

Following the action, the next word is **in** or **out**. This determines in which direction rules are applied, e.g incoming or outgoing packets.

The option keyword is next. One can choose from:

- **log** - logs the packet is the packet matched the rule. Use [ipmon(1M)](https://illumos.org/man/1M/ipmon) to view the log.
- **quick** - rule with quick keyword is executed if packet matches it. No further rules checking is done.
- **on** interface - rule is applied only on interface in both directions
- **dup-to** interface - packet is copied and sent out on interface to specified IP address
- **to** interface - packet is moved to an outbound queue on interface

Next are the keywords that determine if the packet matches the rule. The following keywords shown here can be used:

- **tos** - packet is filtered based on the type-of-service value written as decimal or hexadecimal integer.
- **ttl**- packet is matched based on its time-to-live value.
- **proto** - used to match a specific protocol. Any protocol name from /etc/protocols or its decimal representation can be used.
- **from/to/all/any** - matches either source or destination IP address of the packet and the port number. All accepts packet from any source to any destination.
- **with** - matches specified attributes associated with the packet. Inserted not/no in front of the keyword matches the packet only if the option is not present.
- **flags** - filters based on TCP flags that are set.
- **icmp-type** - filters based on ICMP type.
- **keep** keep-options - determines whetever state should be kept for a packet. state stores information about the session and can be kept on TCP, UDP, and ICMP packets. The frags keeps information about packet fragments and apllies them to later fragments. This option allows matching packets to pass without further ruleset evalution.
- **head** number - creates new group for filtering rules denoted by number.
- **group** number - adds the rule to group number. The default group value is 0.

In the following example we will block all incoming packet on igb0 from 10.0.0.0/8. This rule should be included in one's ruleset:

`block in quick on igb0 from 10.0.0.0/8 to any`

#### Address pools

Address pools group multiple IP addresses/networks into a single reference that can be used in IP Filter rules.

## NAT (Network Address Translation)

NAT is used in case when one needs to do address or port translation. This happens when one wants to connect multiple computers at home and share the network connection or when one wants to do port forwarding. NAT on OpenIndiana is set up in `/etc/ipf/ipnat.conf` and work regarding NATs is done with [ipnat(1M)](https://illumos.org/man/1M/ipnat).

### NAT rules syntax

To create NAT rules use the following syntax:

command interface-name parameters

Every rule begins with command from one of these:

- **map** - maps one IP address or network to another IP address or network.
- **rdr** - redirects packet from one IP address and port to another IP address and port.
- **bimap** - creates bidirectorial NAT between an external and an internal IP address.
- **map-block** - establishes static IP address-based translation.

Interface named is used after command, e.g. **igb0**.

To determine NAT configuration one has to use one of the following parameters:

- **ipmask** - designates the network mask.
- **dstipmask** - designates the address ipmask is translated to.
- **mapport** - designates TCP or UDP protocols along with range of ports.

Assuming we have an external IP address 10.0.0.1/24 on interface eg1000 and an internal range of 192.168.1.0/24. The example NAT rule would look like this:

`map eg1000 192.168.0.0/24 -> 10.0.0.1/24`

!!! note
    NAT is not usable with IPv6 IP filter as NAT is deprecated in IPv6. NAT can be only used with IPv4 addresses.

## Advanced Networking

< Place holder for content >


## Crossbow

< Place holder for content >


## Hipster as a NAS

OpenIndiana provides several ways to share data with network clients.

| Implementation | Description
| --- | ---
| CIFS | Kernel based SMB file sharing solution offering ZFS integration, ease of use, and relatively simple configuration.
| SAMBA | Modern userland based SMB file sharing solution providing support for newer SMB protocols (SMB 2.1) and better compatibility with modern Windows clients.
| NFS | The Network File System was originally developed by Sun Microsystems.

!!! info "Documentation Team"
    ITEMS TO WRITE ABOUT:
    
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


### Hipster as a CIFS server (workgroup)

< Placeholder for introduction content >


#### Commands used

* `sharemgr` - configure and manage file sharing
* `smbadm` - configure and manage CIFS local groups and users, and manage domain membership
* `zfs` - configures ZFS file systems
* `passwd` - change login password and password attributes
* `chown` - change file ownership


#### Configuration steps

Start by listing available storage pools.

`zfs list`

```bash
NAME                           USED  AVAIL  REFER  MOUNTPOINT
storage                        498K   899G    19K  /storage
```

Create your ZFS dataset to be shared via CIFS/SMB.

```bash
zfs create -o casesensitivity=mixed -o sharesmb=on storage/backup
```

Start the CIFS service.

```bash
svcadm enable -r smb/server
```

Join the CIFS server to a workgroup.

```bash
smbadm join -w WORKGROUP
```

Configure PAM authentication for the CIFS service.

```bash
echo "other password required pam_smb_passwd.so.1 nowarn" >> /etc/pam.conf
```

Reset the password for the local user accounts which will be used for remotely accessing the CIFS/SMB share.

```bash
passwd <user_account>
```

Set the share name to be used for the CIFS/SMB share.

```bash
zfs set sharesmb=name=backup storage/backup
```

Change the ownership of ZFS dataset to the user account which will be used for remotely accessing the CIFS/SMB share.

```bash
chown -R <user_account> /storage/backup
```

Verify everything is all set to go.

`sharemgr show -vp`

```bash
default nfs=()
smb smb=()
        * /var/smb/cvol  smb=() ""
                  c$=/var/smb/cvol       smb=(abe="false" guestok="false")      "Default Share"
zfs smb=()
    zfs/storage/backup smb=()
          backup=/storage/backup
```

You can create additional CIFS datasets using the following 4 commands.

* `zfs create -o casesensitivity=mixed -o sharesmb=on <pool_name/dataset_name>`
* `zfs set sharesmb=name=<new_share_name> <pool_name/dataset_name>`
* `chown -R <user_account> <path_to_dataset>`
* `sharemgr show -vp`


### Hipster as a CIFS server (domain)

< Placeholder for introduction content >


### Hipster as a SAMBA server

< Place holder for content >


### Configuring CIFS/SMB client connectivity

< Place holder for content >


#### Adding a remote share using the Linux smbclient

* [Accessing an SMB Share With Linux Machines](http://www.tldp.org/HOWTO/SMB-HOWTO-8.html)


#### Adding a remote share using the KDE Dolphin file manager GUI

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


#### Adding a remote share using a Windows client

< Place holder for content >


### Hipster as an NFS server

< Place holder for content >


## Hipster as an NIS server

< Place holder for content >


## Hipster as an LDAP server

< Place holder for content >


## Hipster as a DHCP server

< Place holder for content >


## Hipster as an FTP server

< Place holder for content >


## Hipster as a DNS server

< Place holder for content >


## Hipster as a NTP server

< Place holder for content >


## Hipster as a INETD server

< Place holder for content >



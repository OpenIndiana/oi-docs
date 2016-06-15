
// vim: set syntax=asciidoc:

// Start of document parameters

:toc: macro
:icons: font
:linkattrs:
:awestruct-layout: asciidoctor

// End of document parameters

== Intermediate & Advanced Systems Administration


toc::[levels=2]


=== OpenSolaris Managing Boot Environments

[cols="1,4"]
|===

| Document Link
| link:./content/snapupgrade/html/solarisinstall.html[OpenSolaris Managing Boot Environments, role="external", window="_blank"]

| Topics
| A boot environment is a bootable instance of an OpenSolaris™ operating system image plus any other application software packages installed into that image.
System administrators can maintain multiple boot environments on their systems, and each boot environment can have different software versions installed.

Upon the initial installation of OpenSolaris onto a system, a boot environment is created.
Use the beadm(1M) utility or the Package Manager to administer additional boot environments on your system.

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for anyone responsible for administering one or more systems running the OpenSolaris operating system.

| Requirements
| Experience using the Solaris Operating System (OS) or another UNIX® version is recommended.
|===


=== OpenSolaris 2009.06 Image Packaging System Guide

[cols="1,4"]
|===

| Document Link
| link:./content/IMGPACKAGESYS/html/ips.html[OpenSolaris 2009.06 Image Packaging System Guide, role="external", window="_blank"]

| Topics
a| The Image Packaging System, pkg(5), is a framework that provides for software lifecycle management such as installation, upgrade, and removal of packages.
IPS also provides users the ability to create their own software packages, create and manage packaging repositories, and mirror existing packaging repositories.

With IPS, users can perform the following tasks:

- Create and manage images

- Install new packages and update existing packages

- Manage and search the software on your system

With the IPS publication tools, developers can perform the following:

- Create and manage packaging repositories

- Create and publish packages to a packaging repository

- Provide a content mirror for an existing packaging repository

- Retrieve the contents of an existing package from a packaging repository

- Republish the contents of an existing package to a packaging repository

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for system administrators, end users, and developers.

| Requirements
| Experience using the Solaris Operating System (OS) or another UNIX® version is recommended.
|===


=== Solaris CIFS Administration Guide

[cols="1,4"]
|===

| Document Link
| link:./content/SSMBAG/html/ssmbag.html[Solaris CIFS Administration Guide, role="external", window="_blank"]

| Topics
a| - Solaris CIFS service, which enables you to configure a Solaris system to make CIFS shares available to CIFS clients.
- Native identity mapping services, which enables you to map user and group identities between Solaris systems and Windows systems.

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for system administrators and end users.
Both Solaris and Windows system administrators can use this information to configure and integrate the Solaris CIFS service into a Windows environment.

In addition, system administrators can configure the identity mapping service.
Finally, the chapter about the Solaris CIFS client is primarily intended for Solaris users who would like to mount CIFS shares.
The Solaris CIFS client chapter also includes tasks to be performed by a system administrator.

| Requirements
| Experience using the Solaris Operating System (OS) or another UNIX® version is recommended.
|===


=== Solaris ZFS Administration Guide

[cols="1,4"]
|===

| Document Link
| link:./content/ZFSADMIN/html/zfsadmin.html[Solaris ZFS Administration Guide, role="external", window="_blank"]

| Topics
a| - ZFS storage pool and file system creation and management
- Snapshots
- Clones
- Backups
- Using access control lists (ACLs) to protect ZFS files
- Using ZFS on a Solaris system with zones installed
- Emulated volumes
- Troubleshooting
- Data recovery

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This guide is intended for anyone who is interested in setting up and managing Solaris ZFS file systems.

| Requirements
| Experience using the Solaris Operating System (OS) or another UNIX® version is recommended.
|===


=== OpenSolaris Automated Installer Guide

[cols="1,4"]
|===

| Document Link
| link:./content/AIinstall/html/solarisinstall.html[OpenSolaris Automated Installer Guide, role="external", window="_blank"]

| Topics
| If you want to install the OpenSolaris operating system (OS) on multiple client systems on a network, you can use the automated installer (AI) to accomplish that task.
The automated installer performs essentially “hands-free” network installations of the OpenSolaris OS.

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for anyone responsible for administering one or more systems that are running the Solaris release.

| Requirements
| Experience using the Solaris Operating System (OS) or another UNIX® version is recommended.
|===


=== System Administration Guide: Advanced Administration

[cols="1,4"]
|===

| Document Link
| link:./content/SYSADV2/html/sysadv2.html[System Administration Guide: Advanced Administration, role="external", window="_blank"]

| Topics
a| - Terminals and modems
- System resources (disk quotas, accounting, and crontabs)
- System processes
- Troubleshooting Solaris software problems

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for anyone responsible for administering one or more systems that are running the Solaris release.

| Requirements
| This book assumes that you have installed the SunOS™ Solaris Operating System.
It also assumes that you have set up any networking software that you plan to use.
To use this book, you should have 1-2 years of UNIX® system administration experience.
Attending UNIX system administration training courses might be helpful.
|===


=== System Administration Guide: Devices and File Systems

[cols="1,4"]
|===

| Document Link
| link:./content/SAGDFS/html/sagdfs.html[System Administration Guide: Devices and File Systems, role="external", window="_blank"]

| Topics
a| - Removable media
- Disks and devices
- File systems
- Backing up and restoring data

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for anyone responsible for administering one or more systems running the Solaris release.

| Requirements
| This book assumes you have installed the SunOS 5.11 Operating System and set up all the networking software that you plan to use.
To use this book, you should have 1–2 years of UNIX® system administration experience.
Attending UNIX system administration training courses might be helpful.
|===


=== System Administration Guide: IP Services

[cols="1,4"]
|===

| Document Link
| link:./content/SYSADV3/html/sysadv3.html[System Administration Guide: IP Services, role="external", window="_blank"]

| Topics
a| - TCP/IP network administration
- IPv4 and IPv6 address administration
- DHCP
- IPsec
- IKE
- Solaris IP filter
- Mobile IP
- IP network multipathing (IPMP)
- IPQoS

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for anyone responsible for administering systems that run the Solaris OS release, which are configured in a network.

| Requirements
| This book assumes that you have already installed the Solaris operating system (Solaris OS).
You should be ready to configure your network or ready to configure any networking software that is required on your network.
To use this book, you should have at least two years of UNIX® system administration experience.
Attending UNIX system administration training courses might be helpful.
|===


=== System Administration Guide: Network Services

[cols="1,4"]
|===

| Document Link
| link:./content/SYSADV4/html/sysadv4.html[System Administration Guide: Network Services, role="external", window="_blank"]

| Topics
a| - Web cache servers
- Time-related services
- Network file systems (NFS and Autofs)
- Mail
- SLP
- PPP

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for anyone responsible for administering one or more systems that run the Solaris 10 release.

| Requirements
| This book assumes that you have already installed the SunOS™ 5.10 operating system, and you have set up any networking software that you plan to use.
To use this book, you should have one to two years of UNIX® system administration experience.
Attending UNIX system administration training courses might be helpful.
|===


=== System Administration Guide: Naming and Directory Services (DNS, NIS, and LDAP)

[cols="1,4"]
|===

| Document Link
| link:./content/SYSADV5/html/sysadv5.html["System Administration Guide: Naming and Directory Services (DNS, NIS, and LDAP)", role="external", window="_blank"]

| Topics
a| - DNS
- NIS
- LDAP (including transitioning from NIS to LDAP and transitioning from NIS+ to LDAP)

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This manual is written for experienced system and network administrators.

| Requirements
| Although this book introduces networking concepts relevant to Solaris naming and directory services, it explains neither the networking fundamentals nor the administration tools in the Solaris OS.
To use this book, you should have a firm understanding of UNIX® networking and systems administration fundamentals.
|===


=== System Administration Guide: Solaris Printing

[cols="1,4"]
|===

| Document Link
| link:./content/SYSADPRTSVCS/html/sysadprtsvcs.html[System Administration Guide: Solaris Printing, role="external", window="_blank"]

| Topics
a| - Solaris printing topics and tasks
- Using services, tools, protocols, and technologies to set up and administer printing services and printers

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for anyone responsible for administering one or more systems that are running the Solaris release.

| Requirements
| This book assumes that you have installed the SunOS™ Solaris Operating System.
It also assumes that you have set up any networking software that you plan to use.
To use this book, you should have 1-2 years of UNIX® system administration experience.
Attending UNIX system administration training courses might be helpful.
|===


=== System Administration Guide: Security Services

[cols="1,4"]
|===

| Document Link
| link:./content/SYSADV6/html/sysadv6.html[System Administration Guide: Security Services, role="external", window="_blank"]

| Topics
a| - Auditing
- Device management
- File security
- BART
- Kerberos services
- PAM
- Solaris Cryptographic Framework
- Privileges
- RBAC
- SASL
- Solaris Secure Shell

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for anyone who is responsible for administering one or more systems that run a Solaris Express Community Edition release.

| Requirements
| To use this book, you should have more than two years of UNIX® system administration experience.
Attending training courses in UNIX system administration might be helpful.
|===


=== System Administration Guide: Virtualization Using the Solaris Operating System

[cols="1,4"]
|===

| Document Link
| link:./content/SYSADRM/html/sysadrm.html[System Administration Guide: Virtualization Using the Solaris Operating System, role="external", window="_blank"]

| Topics
a| - Resource management features, which enable you to control how applications use available system resources
- Zones software partitioning technology, which virtualizes operating system services to create an isolated environment for running applications
- Virtualization using Sun™ xVM hypervisor technology, which supports multiple operating system instances simultaneously

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for anyone responsible for administering one or more systems that run the Solaris release.

| Requirements
| This book assumes that you have already installed the operating system and set up any networking software that you plan to use.
To use this book, you should have at least one to two years of UNIX® system administration experience.
|===


=== Solaris Volume Manager Administration Guide

[cols="1,4"]
|===

| Document Link
| link:./content/LOGVOLMGRADMIN/html/logvolmgradmin.html[Solaris Volume Manager Administration Guide, role="external", window="_blank"]

| Topics
| The Solaris Volume Manager Administration Guide explains how to use Solaris™ Volume Manager to manage your system's storage needs.
Solaris Volume Manager enables you to create, modify, and use RAID-0 (concatenation and stripe) volumes, RAID-1 (mirror) volumes.

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
a| System and storage administrators can use this book to identify:

- Tasks supported by Solaris Volume Manager
- Ways to use Solaris Volume Manager to provide more reliable and accessible data

| Requirements
| This book assumes that you have installed the SunOS™ Solaris Operating System.
It also assumes that you have set up any networking software that you plan to use.
To use this book, you should have 1-2 years of UNIX® system administration experience.
Attending UNIX system administration training courses might be helpful.
|===


=== Solaris Tunable Parameters Reference Manual

[cols="1,4"]
|===

| Document Link
| link:./content/SOLTUNEPARAMREF/html/soltuneparamref.html[Solaris Tunable Parameters Reference Manual, role="external", window="_blank"]

| Topics
| The Solaris Tunable Parameters Reference Manual provides reference information about Solaris™ OS kernel and network tunable parameters.
This manual does not provide tunable parameter information about the CDE, GNOME, or Java™ environments.

| Relevancy to OpenIndiana Hipster
| To be determined

| Target Audience
| This book is intended for experienced Solaris system administrators who might need to change kernel tunable parameters in certain situations.

| Requirements
| To use this book, you should have more than two years of UNIX® system administration experience.
Attending training courses in UNIX system administration might be helpful.
|===


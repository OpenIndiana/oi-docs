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

# Installing Oracle Databases (Native or Vagrant)

Originally contributed by OpenIndiana community member Franklin Ronald, Franklin Ronald's article details the steps required for the native installation of Oracle Database 11R2 on OpenIndiana Hipster.  Alternatively it is possible to run Oracle RAC or any other Oracle Database software using VirtualBox and Vagrant.

Link to PDF Document: [How to Install Oracle Database 11R2 on OpenIndiana Hipster](../pdf/HowToInstallOracleDB.pdf)

<div class="note" markdown="1">
!!! note
    It is not recommended to run Oracle Database on OpenIndiana in a production environment. Oracle has a restricted list of supported operating systems and unfortunately OpenIndiana is not in it. The purpose of the Installing 11R2 on OI article is to install the Oracle Database for use in a development environment.
</div>

For development purposes it is also possible to setup Oracle Database 18, 19 and 21.3 using Vagrant.  See the Vagrant documentation for more information.

Vagrantfile are provided by Oracle, for testing products such as the Oracle Database.

As ordinary login user do:

```none
        $ mkdir -p /scratch/oracle/vagrant-projects
```

Then clone the Oracle vagrant projects :

```none
        $ cd /scratch/oracle/vagrant-projects
        $ git clone https://github.com/oracle/vagrant-projects.git .
```

Some interesting Oracle Database products can be built :

```none
        $ cd /scratch/oracle/vagrant-projects
        $ cd OracleDatabase/
        $ ls
        11.2.0.2   12.2.0.1   18.4.0-XE  21.3.0
        12.1.0.2   18.3.0     19.3.0     README.md
```

For example to build a 21.3 Oracle Database provided you can download from OTN (Oracle Tech Net) the LINUX.X64_213000_db_home.zip Oracle product :

```none
        $ cd 21.3.0
        $ vagrant up
        Bringing machine 'oracle-21c-vagrant' up with 'virtualbox' provider...
        ==> oracle-21c-vagrant: Importing base box 'oraclelinux/8'...
        ==> oracle-21c-vagrant: Matching MAC address for NAT networking...

        ... lots of messages ---

        oracle-21c-vagrant: Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
        oracle-21c-vagrant: Version 21.3.0.0.0
```

This is an example Vagrantfile to deploy a VirtualBox VM called oracle-21c-vagrant running Linux and Oracle Database 21c.
</div>


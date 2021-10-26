<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
 (the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.


The Original Documentation is at https://squeak.org/documentation/

The Initial Writer of this Documentation is David Stes Copyright (C) 2021.
All Rights Reserved. (https://sourceforge.net/u/stes/profile).

Contributor(s): David Stes.

-->

<img src = "../../../Openindiana.png">

# Hipster Handbook - Vagrant

The following notes document the steps to install Vagrant on OpenIndiana Hipster.

Vagrant is a tool for building and managing virtual machine environments in a single workflow.  See [vagrantup.com](https://www.vagrantup.com/) or [hashicorp.com](https://www.hashicorp.com/) for more information.

The following notes explain how to build vagrant from source for OpenIndiana and how to use vagrant with VirtualBox as provider.

## Installing Ruby from source

Vagrant uses some tools such as git, curl, bsdtar and Ruby.  Although that Ruby is available in the OpenIndiana repositories, Hashicorp recommends NOT to use the system provided Ruby.  So we'll build Ruby from source as well.

Complete instructions from Hashicorp are available at :

[https://www.vagrantup.com/docs/installation/source](https://www.vagrantup.com/docs/installation/source)

Create a ZFS filesystem (or just a directory) to install Ruby and Vagrant :

```none
        # zfs create -o mountpoint=/scratch rpool/scratch
```

Make a non-root user the owner of that directory.  This is the user that you normally use to login into your OI system :

```none
        # chown <some-user> /scratch
```

Then as ordinary non-root user continue and download Ruby version 3.0.2 from :

[https://www.ruby-lang.org/en/downloads/](https://www.ruby-lang.org/en/downloads/)

Copy ruby-3.0.2.tar.gz to the scratch directory and extract it there :

```none
        $ cd /scratch
        $ gtar xvfz ruby-3.0.2.tar.gz
```

Make sure that the bison grammar ripper.y is NOT rebuilt on OI.  This is minor issue currently at time of writing these notes with bison.  The Ruby sources are generated with bison 3.5.1 while OI currently runs a more recent version of bison (3.7.6) :

```none
        $ ls -l ruby-3.0.2/ext/ripper/ripper.*
        $ head ruby-3.0.2/ext/ripper/ripper.y
        $ touch ruby-3.0.2/ext/ripper/ripper.c
        $ ls -l ruby-3.0.2/ext/ripper/ripper.*
```

Configure Ruby 3.0.2 :

```none
        $ cd ruby-3.0.2
        $ ./configure --disable-dtrace --with-gcc --prefix=/scratch/ruby-30
```

Then build Ruby 3.0.2 and install it under /scratch/ruby-30 as follows :

```none
        $ gmake
        $ gmake install
```

Modify the PATH to use Ruby 3.0.2 :

```none
        $ PATH=/scratch/ruby-30/bin:$PATH
        $ ruby --version
        ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [i386-solaris2.11]
```

## Installing Vagrant from source

Complete instructions from Hashicorp are available at :

[https://www.vagrantup.com/docs/installation/source](https://www.vagrantup.com/docs/installation/source)

Create a vagrant directory as ordinary non-root user (same login user as used for the installation of Ruby 3.0.2) :

```none
        $ mkdir /scratch/vagrant
```

Git clone the Vagrant source code :

```none
        $ cd /scratch/vagrant
        $ git clone https://github.com/hashicorp/vagrant.git .
```

Make sure that bundle and bundler commands are from Ruby 3.0.2 :

```none
        $ type bundler
        bundler is a tracked alias for /scratch/ruby-30/bin/bundler
        ls /scratch/ruby-30/bin/
        bundle      htmldiff    listen      rdoc        rwinrm
        bundler     httpclient  racc        ri          rwinrmcp
        erb         irb         rake        rspec       thor
        gem         ldiff       rbs         ruby        typeprof
```

Follow the Hashicorp instructions for the install by running :

```none
        $ bundle install
```

The above is a non-root installation into /scratch/ruby-30.

Then create a binstub and add it to your path :

```none
        $ bundle --binstubs exec
        $ PATH=/scratch/vagrant/exec:$PATH
```

Note that the above adds the directory exec, not bin, to the PATH.  There also is a bin directory but that's not the binstub directory.

```none
        $ type vagrant
        vagrant is a tracked alias for /scratch/vagrant/exec/vagrant
        $ vagrant --version
        Vagrant 2.2.19.dev
```

## VirtualBox

Vagrant can use multiple providers, but in this case we use VirtualBox as provider:

```none
        # pkg list virtualbox
        NAME (PUBLISHER)                                  VERSION                    IFO
        system/virtualbox                                 6.1.22-2020.0.1.2          i--
```

Vagrant uses a Vagrantfile to describe the actions to build the virtual machine or machines.  Once you or someone else creates a single Vagrantfile, you just need to vagrant up and everything is installed and configured for you to work.

If the Vagrantfile uses internal networks, check first that internal networks are defined in VirtualBox under the File menu (Host Network Manager).

The following example shows a setup with two internal networks.  By default there will only be just one internal network :

```none
        # dladm show-phys | grep vbox
        vboxnet0     Ethernet             up         1000   full      vboxnet0
        vboxnet1     Ethernet             up         1000   full      vboxnet1
```

With the VBoxManage command, check the available internal networks:

```none
        $ VBoxManage list hostonlyifs | grep 192
        IPAddress:       192.168.56.1
        IPAddress:       192.168.99.1
```

The above example is for 2 internal networks.  By default only the 192.168.56.1 is setup by the default VirtualBox installation.

## Testing Vagrant projects from Oracle

Many Vagrantfile are provided, for example some are by Oracle, for testing products such as the Oracle Database.

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

Many other Vagrantfiles exist in the cloud.

OpenIndiana Hipster itself is also in the Vagrant Cloud :

See [https://app.vagrantup.com/openindiana/boxes/hipster](https://app.vagrantup.com/openindiana/boxes/hipster).

The oi-userland repository has for example also a Vagrantfile that can be used to create a VM to host oi-userland (by Adam Stevko and Michal Nowak).

A set of example Vagrantfiles that use the OpenIndiana Hipster operating system can be cloned from github by :

```none
        # git clone https://github.com/openindiana/vagrantfiles
```

These examples create various virtual machines running OpenIndiana.


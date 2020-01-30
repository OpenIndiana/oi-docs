<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
 (the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.


The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Carsten Grzemba Copyright (C) 2020.
All Rights Reserved. (Initial Writer contact(s): cgrzemba@opencsw.org).

Contributor(s): ______________________________________.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

# Sun Ray Software on OpenIndiana Hipster

Some notes for installation Sun Ray Software on OpenIndiana Hipster.

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Since GNOME is replaced by Mate in Hipster, installation is a little bit more difficult. For Sun Ray it is still necessary to use GNOME GDM and some other GNOME applications. But it is possible to use also Mate applications like pluma or atril.

Limitations:

multihead is possible but the Display Switcher Applet on gnome-panel on the second screen won't start. So you can't reopen minimized  windows on the second screen.

</div>

## Install

Sun Ray Software is still downloadable at http://edelivery.oracle.com. Download the Software for Solaris x86-64 and for Linux x86-64. From the Linux software we take scripts for configure ISC DHCP server described later.

Extract the archives.

The Solaris packages require Sun DHCP server, which we do not provide anymore. To solve this problem we update the IPS packages SUNWutr and SUNWuto with the following script:

update_dhcp_dependency

```shell
#!/bin/ksh

# set -x

if [ -z $1 ] || [ ! -d $1 ]; then
    echo "usage: $0 repodirectory"
    exit
fi

if [[ $1 != /* ]]; then
   repo=$(pwd)/$1
else
   repo=$1
fi

republish="republish$$"

mkdir ${republish}

for p in SUNWutr SUNWuto; {
(cd ${republish}
  pkgrecv -d . --raw -s $repo $p || exit 2
  for d in $(ls $p); {
      (cd $p/$d
        sed -i s#service/network/dhcp#service/network/dhcp/isc-dhcp# manifest
        pkgrepo -s $repo remove $p
        pkgsend publish -s $repo -d . manifest
      )
  }
);
}
rm -r ${republish}
```

Running script `update_dhcp_dependency <extractdirectory>/srs_5.4.5.0-Solaris_11plus.i386/IPS.i386/` replaces the dependcy of package `service/network/dhcp` by `service/network/dhcp/isc-dhcp`.

Install IPS packages of the Sun Ray Software Software from the local repository

```shell
# pkg set-publisher -g <extractdirectory>/srs_5.4.5.0-Solaris_11plus.i386/IPS.i386/ sunray
# pkg install SUNWut-srss SUNWut-srwc SUNWuti
```

Caused by package dependencies these packages are installed finally:

```
SUNWut-srss (sunray)                              5.4.5.0.38-0.0             i--
SUNWuta (sunray)                                  4.5.4.0.38-0.0             i--
SUNWutdso (sunray)                                3.5.0.0.2-0.0              i--
SUNWutdsr (sunray)                                3.5.0.0.2-0.0              i--
SUNWutesa (sunray)                                4.5.0.0.44-0.0             i--
SUNWutgsm (sunray)                                4.5.0.0.44-0.0             i--
SUNWuti (sunray)                                  4.5.5.0.38-0.0             i--
SUNWutid (sunray)                                 4.5.5.0.38-0.0             i--
SUNWutk (sunray)                                  4.5.0.0.44-0.0             i--
SUNWutm (sunray)                                  4.5.4.0.38-0.0             i--
SUNWuto (sunray)                                  4.5.4.0.38-0.0             i--
SUNWutps (sunray)                                 4.5.0.0.44-0.0             i--
SUNWutr (sunray)                                  4.5.0.0.44-0.0             i--
SUNWutref (sunray)                                4.5.0.0.44-0.0             i--
SUNWutscr (sunray)                                4.5.4.0.38-0.0             i--
SUNWutsrs (sunray)                                4.5.5.0.38-0.0             i--
SUNWutstk (sunray)                                4.5.0.0.44-0.0             i--
SUNWutsto (sunray)                                4.5.0.0.44-0.0             i--
SUNWutstr (sunray)                                4.5.0.0.44-0.0             i--
SUNWutsvt (sunray)                                1.1.0.0.3-0.0              i--
SUNWuttsc (sunray)                                2.6.4.0.11-0.0             i--
SUNWuttscd (sunray)                               2.6.4.0.11-0.0             i--
SUNWuttscr (sunray)                               2.6.4.0.11-0.0             i--
SUNWutu (sunray)                                  4.5.0.0.44-0.0             i--
SUNWutwa (sunray)                                 4.5.2.0.5-0.0              i--
SUNWutwar (sunray)                                4.5.0.0.44-0.0             i--
SUNWutwh (sunray)                                 4.5.0.0.44-0.0             i--
SUNWutwl (sunray)                                 4.5.0.0.44-0.0             i--
```

### configure isc-dhcp

ISC DHCP was already the DHCP server for Sun Ray Software on Linux.
Sun Ray Software on Hipster can use DHCP scripts like on Linux. But it is possible to configure DHCP manually also and skipping the step of `utadm` . Here an example:

```
ddns-update-style none;

# option definitions common to all supported networks...
option domain-name "sunray.lan";
option domain-name-servers 192.168.1.6, 192.168.1.1;
option subnet-mask 255.255.255.0;
option broadcast-address 192.168.1.255;
option routers 192.168.1.1;
option space SunRay;
option SunRay.Intf code 33 = text;
option SunRay.Intf "nge1";
option SunRay.AuthSrvr code 21 = ip-address;
option SunRay.AuthSrvr 192.168.1.2;
option SunRay.AltAuth code 35 = array of ip-address;
option SunRay.AltAuth 192.168.1.2;
option SunRay.FWSrvr code 31 = ip-address;
option SunRay.FWSrvr 192.168.1.2;
option SunRay.NewTVer code 23 = text;
option SunRay.NewTVer "11.1.7.0_38_2016.10.27.13.09";
option SunRay.AuthPort code 22 = integer 16;
option SunRay.AuthPort 7009;
option SunRay.LogHost  code 24 = ip-address;
option SunRay.LogHost 192.168.1.2;
option SunRay.LogKern code 25 = integer 8;
option SunRay.LogKern 6;
option SunRay.LogNet code 26 = integer 8;
option SunRay.LogNet 6;
option SunRay.LogUSB code 27 = integer 8;
option SunRay.LogUSB 6;
option SunRay.LogVid code 28 = integer 8;
option SunRay.LogVid 6;
option SunRay.LogAppl code 29 = integer 8;
option SunRay.LogAppl 6;
option SunRay.sunray-servers code 68 = text;
option SunRay.sunray-servers "oi-sr.sunray.lan";
option SunRay.sunray-config-servers code 67 = text;
option SunRay.sunray-config-servers "oi-sr.sunray.lan";

default-lease-time 86400;
max-lease-time 86400;

class "sun" {
  match if substring (option vendor-class-identifier, 0, 4) = "SUNW";
}

log-facility local7;

host sr1.sunray.lan {
  hardware ethernet 00:14:4f:57:a0:c1;
  fixed-address 192.168.1.50;
  vendor-option-space SunRay;
}

subnet 192.168.1.0 netmask 255.255.255.0 {
  range 192.168.1.51 192.168.1.59;
}
```

The vendor specific DHCP options described at [Sun Ray Software: Alternate Client Initialization Reqs Using DHCP](https://docs.oracle.com/cd/E25749_01/E25745/html/Alternate-Client-Initialization-Reqs-Using-DHCP.html#Alternate-Vendor-Specific-DHCP-Options).
The config file `/etc/dhcp/dhcpd.conf` has to link to `/etc/inet/dhcp4.conf` for use with the `svc:/network/dhcp/server:ipv4` service.

For Sun Ray Software switch to isc-dhcp we take scripts located in path `/opt/SUNWut/lib/dhcp/isc` from the Sun Ray Software package for Linux (SUNWuto-4.5-44.i386.rpm). Extract the package with `rpm2cpio`:

```shell
pkg install rpm
rpm2cpio SUNWuto-4.5-44.i386.rpm | cpio -imd <tmprpmdirectory>
```

put the scripts below `<tmprpmdirectory>/opt/SUNWut/lib/dhcp/isc` in `/opt/SUNWut/lib/dhcp/isc` and rename `dhcp_config_linux` in `dhcp_config_solaris`.

Reference the scripts by setting this link:

```
root@oi-sr:/etc/opt/SUNWut# ln -s /opt/SUNWut/lib/dhcp/isc dhcp
```

`utadm` command need some updates shown in this patch:

```
--- utdm.0      Do. Jan 19 11:11:14 2017
+++ utadm       Do. Jan 19 11:12:12 2017
@@ -116,7 +116,7 @@
 UTDHCPSERVICE_DISABLED=3

 SVCADM="/usr/sbin/svcadm"
-DHCP_FMRI="svc:/network/dhcp-server:default"
+DHCP_FMRI="svc:/network/dhcp-server:ipv4"

 UTLIB="/opt/SUNWut/lib"
 UTSBIN="/opt/SUNWut/sbin"
@@ -207,6 +207,7 @@
                IFCONFIG_KEY_NETMASK="netmask"
                if [ -x /usr/sbin/ipadm ]; then
                  IPADM_CONF=true
+                 DHCPCONFIG="/etc/dhcp/dhcpd.conf"
                fi

                ;;      # end case SunOS
@@ -2567,8 +2567,8 @@
            fi
            # Clear any pre-existing state on interface, then create
            # new persistent configuration
-           ipadm delete-ip ${INTF} 2>/dev/null
-           ipadm create-ip ${INTF}
+           ipadm delete-if ${INTF} 2>/dev/null
+           ipadm create-if ${INTF}
            ipadm create-addr -T static -a local=${IPADDR}/${MASKBITS} ${INTF}/v4static
          else
            # ifconfig the new interface
@@ -1788,10 +1788,10 @@ function DoAddNetworkConfig {
                # Need to catch the case where hostname.<intf> exists but the hostname
                # defined in the file may not be configured locally in the hosts file.
                #
-               if [ ! -f ${HOSTNAME_C}${INTF} ]; then
-                   print -u2 "Error: missing \"${HOSTNAME_R}${INTF}\" file."
-                   return 1
-               fi
+               # if [ ! -f ${HOSTNAME_C}${INTF} ]; then
+               #     print -u2 "Error: missing \"${HOSTNAME_R}${INTF}\" file."
+               #     return 1
+               # fi
                if [[ $OS == "SunOS" ]]; then
                        NAME=`getIfname ${INTF}`
                        if [ -z "${NAME}" ]; then
@@ -2570,7 +2570,7 @@ should an auth server be located by broadcasting on the network?" "Y"
            # new persistent configuration
            ipadm delete-if ${INTF} 2>/dev/null
            ipadm create-if ${INTF}
-           ipadm create-addr -T static -a local=${IPADDR}/${MASKBITS} ${INTF}/v4static
+           ipadm create-addr -T static -a local=${IPADDR}/${MASKBITS} ${INTF}/v4utadm
          else
            # ifconfig the new interface
            ifconfig ${INTF} plumb >/dev/null 2>&1 ;
@@ -2711,7 +2711,8 @@ function DoList {
        if [[ $BLOCKTYPE = "interface" ]] ; then
          if Intf=${UT_DHCP_INTERFACE} ; then
            if [[ ! -s ${HOSTNAME_R}.${Intf} ]]; then
-               IntfAddr=""*MISSING*""
+                IntfAddr=`ipadm show-addr -p -o ADDR ${Intf}/ | awk '{split($1,a,"/"); print a[1]}'`
+               # IntfAddr=""*MISSING*""
            else
                typeset H=`getIfname ${Intf}`
                IntfAddr=`getent hosts $H | awk '{ print $1 }'`
@@ -2824,6 +2825,7 @@ function DoList {

            if [[ -n "$Intf" ]]; then
                # private interconnect, need to get the hostname and ip
+echo IntfAddr ${IntfAddr}
                if [[ -n "${IntfAddr}" ]]; then
                    HostName=$(getent hosts ${IntfAddr} | awk '{print $2}')
                fi
@@ -3156,10 +3158,10 @@ function DoPrint {
        # Need to catch the case where hostname.<intf> exists but the hostname
        # defined in the file may not be configured locally in the hosts file.
        #
-       if [ ! -f ${HOSTNAME_R}.${INTF} ]; then
-           print -u2 "Error: missing \"${HOSTNAME_R}.${INTF}\" file."
-           return 1
-       fi
+       # if [ ! -f ${HOSTNAME_R}.${INTF} ]; then
+       #     print -u2 "Error: missing \"${HOSTNAME_R}.${INTF}\" file."
+       #     return 1
+       # fi
        H=`getIfname ${INTF}`
        if [ -z "${H}" ]; then
            print -u2 "Error: interface ${INTF} is partially configured.  Hostname not" \
@@ -3453,19 +3455,7 @@ function getIfname {
        awk '{print $1 ; exit}' "${HOSTNAME_R}.$1"
        return
     else
-       # With ipadm, there's no way to create a persistent
-       # configuration without it immediately being reflected in the
-       # runtime configuration, nor does ipadm provide any convenient
-       # way to find the IPv4 addrobj for the interface, so just
-       # check runtime configuration via ifconfig.
-       IPADDR=$(ifconfig $1 | awk '
-               /[      ]inet /{
-                       for (i = 1; i < NF; ++i) {
-                               if ($i == "inet") {
-                                       print $(i+1)
-                               }
-                       }
-               }')
+       IPADDR=`ipadm show-addr -p -o ADDR $1/ | awk '{split($1,a,"/"); print a[1] }'`
        if [ -z "$IPADDR" ]; then
            print -u2 "Error in parsing of ifconfig addresses"
            exit 2
```

### JRE

The Sun Ray Software needs the Sun/Oracle JRE 1.7 which is shipped with the Sun Ray Software.

## Config

You can run `utconfig` and `utadm` run in common manner described in [Sun Ray Software](https://docs.oracle.com/cd/E35310_01/index.html).

# Use GNOME on current Hipster

As already mentioned Sun Ray Software cannot handled by lightdm and so we still have to use GDM and GNOME.

Be sure you have installed:

```shell
# pkg install libwnck
# pkg install libbonoboui
# pkg install gnome-themes-standard
```

these must not be empty metapackages or obsoleted packages.

## update older Hipster

If you have Sun Ray running on Hipster with GNOME, you can prevent remove GNOME with freeze the GNOME packages and release the version locks

```shell
# pkg freeze gdm gnome-session gnome-panel metacity libgnomekbd gnome-settings-daemon gweather

# pkg change-facet facet.version-lock.library/desktop/gnome-desktop=false
# pkg change-facet facet.version-lock.library/desktop/gnome-menus=false
# pkg change-facet facet.version-lock.gnome/gnome-session=false
# pkg change-facet facet.version-lock.system/display-manager/gdm=false
# pkg change-facet version-lock.library/desktop/libgweather=false
# pkg change-facet version-lock.gnome/window-manager/metacity=false
```

## install from current Hipster (2019)

If you install new Hipster it is necessary to have the GNOME packages before (or after) obsoleting

Last known working OpenIndiana GNOME packages version are the following:

```
libgweather@2.30.3
gnome-session@2.32.1
gnome-panel@2.32.1
metacity@2.30.3
gdm@2.30.7
libgnomekbd@2.30.0
gnome-settings-daemon@2.32.1
```

These are still in hipster repo, but are obsoleted empty metapackages.

At <http://pkg.toc.de/sunray/> can you found the old GNOME packages with newer release date, so that these should be able to install it on current Hipster.
For that add the publisher in that kind, that it can override packages of publisher openindiana.org

```shell
# pkg set-publisher --search-before=openindiana.org -g http://pkg.toc.de/sunray sunray
# pkg set-publisher --non-sticky openindiana.org
```

and install the all packages from publisher sunray.


**The version locks have to release anyway.**

#### XScreenSaver

Latest Hipster delivers XScreenSaver only in 64-bit. The SunRay PAM module are only shipped as 32-bit-only.
That's why we need the XScreenSaver package with 32-bit bins from <http://pkg.toc.de/sunray/>.

## GDM

the gdm service has to be enabled. lightdm should not run.

```
# svcadm enable graphical-login/gdm
# svcadm disable graphical-login/lightdm
```

# Login Screen (gdm-greeter) won't reapear after logout

After logout the gdm-login won't reappear. Install the following script as `/opt/SUNWut/lib/gdm/revivesrsession.py` and call it by the `/etc/opt/SUNWut/gdm/SunRayPostSession/helpers/revivesession` helper script.

```
/opt/SUNWut/lib/gdm/revivesrsession.py &
```

`/opt/SUNWut/lib/gdm/revivesrsession.py` contains:

```python
#!/usr/bin/env python

'''
 Reconnect SunRay X-session: some times after logout, the gdm will not start login screen on the X-session and the DTU remains in state 26D
 INSTALL: - cp to /opt/SUNWut/lib/gdm/revivesrsession.py
          - create script /etc/opt/SUNWut/gdm/SunRayPostSession/helpers/revivesession:
            /opt/SUNWut/lib/gdm/revivesrsession.py &
'''

import subprocess as sp
import re
import pdb
import time
import logging

logformat = "%(asctime)s %(levelname)s:%(message)s"
logging.basicConfig(format = logformat)
logger = logging.getLogger(__name__)

logger.setLevel(logging.DEBUG)

time.sleep(10)

pid = sp.Popen(['pgrep','gdm-binary'], stdout=sp.PIPE).stdout.readline().strip()
logger.debug("GDM pid %s ", pid)
dpl = [ p.split()[2].strip(':')
    for p in sp.Popen(['ptree', pid], stdout=sp.PIPE).stdout.readlines() if '/opt/SUNWut/lib/Xnewt' in p ]
logger.debug("Xnewt pid {}".format( dpl))

# error -4 gdm-simple-slave not started for Display, no UT sessions
for sess in sp.Popen(['/opt/SUNWut/sbin/utsession','-px'], stdout=sp.PIPE).stdout.readlines():
    logger.debug("{}".format(sess))
    for t in sess.split(';'):
        if 'STATE' in t: state = t.split('=')[1]
        if 'DISPLAY' in t: disp = t.split('=')[1]
    if state == 0 and disp in dpl:
        # ok
        pass
    else:
        logger.debug("restart display %s"  % disp)
        sp.Popen(['/opt/SUNWut/lib/gdm/utgdmdynamic','-a', disp])
```


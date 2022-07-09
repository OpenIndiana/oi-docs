<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Alexander Pyhalov Copyright (C) 2013-2020.
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s):   Adam Števko, Andreas Wacknitz, Aurelien Larcher,  Ken Mays, Michal Nowak

Portions created by Adam Števko are Copyright (C) 2017.
Portions created by Andreas Wacknitz are Copyright (C) 2018.
Portions created by Aurelien Larcher are Copyright (C) 2018.
Portions created by Ken Mays are Copyright (C) 2014.
Portions created by Michal Nowak are Copyright (C) 2020.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

# Latest OpenIndiana changes

Date       | Change
---------  | -------------
2020-10-30 | qt 5 was updated to 5.12.9
2020-10-11 | SunStudio 12.1 was removed
2020-09-12 | Mate was updated to 1.24
2020-07-27 | FreeRDP and Remmina were added
2020-07-17 | Python 3.4 was removed
2020-04-02 | Samba was updated to 4.12
2020-03-31 | GCC 7 is the default oi-userland compiler now. If you create PR, ensure that you've checked it in GCC-7 environment.
2020-03-14 | Python imaging library was replaced by Pillow
2020-01-11 | GNU TLS v2 was obsoleted. All components now use GNU TLS 3.
2019-12-19 | net-snmp was updated to ABI-incompatible version 5.8. All dependent applications should be rebuilt.
2019-12-17 | OpenSSH was updated to 8.1p1
2019-11-24 | PostgreSQL 9.4 was removed as it's reaching EOL. Dependent components were switched to PostgreSQL 9.5 libraries. This version is now the default one used by oi-userland.
2019-11-23 | Barman was updated to version 2.9. Server configurations should be updated. At least `archiver = on` option should be added to old configurations. Look at /usr/share/barman for examples.
2019-08-08 | IPS was synced with the latest OmniOS CE version and switched to Python 3. This is a flag day, as <ul><li>to build oi-userland after removing Python 2 pkg module you need <https://github.com/OpenIndiana/oi-userland/commit/fb10babbcfd65ff74cf439bc77a2186fd79ee2a7>;</li><li>to build gfx-drm you need latest `developer/build/onbld` package;<li>to build illumos-gate you have to add `export BUILDPY2TOOLS="#"` to your `illumos.sh`.</li></ul>
2019-08-02 | Clang 8.0 was added as developer/clang-80. Old Clang package developer/clang-40 was removed.
2019-08-01 | MongoDB 4.0 was updated to 4.0.11. Note that this release is not a free software - it is distributed under the restrictive [SSPL v1 license](https://www.mongodb.com/licensing/server-side-public-license). If you make the functionality of MongoDB available to third parties as a service, you must make the service code available under the SSPL v1 license (see the article 13 of the license).
2019-07-25 | VLC was updated to 3.0.7.1.<ul><li>If you see warnings like `main libvlc error: stale plugins cache`, refresh `svc:/application/vlc-cache-gen:default` service.</li><li>VLC was patched to prefer xcb_xv (XVideo) plugin if it's available. If you want to check performance of OpenGL plugin, set `vout` parameter to `gl` in `~/.config/vlc/vlcrc`.</li></ul>
2019-07-25 | FFmpeg was updated to 3.2.14. This is ABI-incompatible update. All dependent applications should be rebuilt.
2019-07-25 | x265 3.1.1 library was added
2019-07-25 | x264 library was updated to latest 20190721 snashot. This is ABI-incompatible update. All dependent applications should be rebuilt.
2019-07-18 | Device Driver Utility (DDU) was updated. Major changes include replacement of binaries for which we have no source, regeneration of OpenIndiana drivers database and migration to Python 3.5.
2019-07-16 | Samba was updated to 4.10.6
2019-07-01 | Ruby 2.6 was added. Ruby 2.2 was removed. New Ruby version is 64-bit.
2019-06-28 | Bind DNS server was updated to 9.14.3. [Security issue](https://www.openindiana.org/2019/06/28/dns-server-startup-script-security-issue/) in bind startup scripts was fixed.
2019-05-06 | PHP 7.3 was introduced
2019-05-05 | Mate was updated to 1.22
2019-04-28 | Firefox was updated to 60.6.1 ESR
2019-03-01 | PHP 5.6 is removed.
2019-03-01 | apache-24 is 64-bit-only now. File and configuration layout is changed. Manual intervention will be likely required on update to fix service. Look for details in this announcement.
2019-01-10 | fish shell was updated to version 3.0.0, which has some non-backward compatible changes, for more information see fish release notes.
2018-12-13 | libsodium was updated to ABI-incompatible version 1.0.16. All dependent applications should be rebuilt.
2018-12-06 | VirtualBox 5.2.22 was added
2018-10-25 | GtkHTML 3.32.2 (library/desktop/gtkhtml) was removed. The only consumer, evolution, had been removed long before.
2018-10-22 | Components lame and twolame were moved from encumbered to userland. Gstreamer updated to 1.14.4.
2018-10-19 | IPS was updated to include new fixes from Oracle and OmniOS CE (up to 93b48ac487d97ffef1711361697f1e929b744c01 )
2018-10-14 | GTK 3 was updated to 3.24.1. Mate was updated to 1.20. Nimbus GTK3 theme was rebased on Solaris 11 theme from B00merang project.
2018-10-03 | KVM zone brand was integrated. Now you can get additional isolation level for kvm and manage kvm VMs as zones. Some examples are available here: https://github.com/OpenIndiana/pkg5/blob/oi/doc/kvm.md
2018-09-27 | ghostscript was updated to 9.25. This is ABI-incompatible update. All dependent packages should be rebuilt.
2018-09-24 | distro_const doesn't longer create 32-bit boot archive. GUI and text installer were modified to cope with this. If you used custom disto-const manifests, be sure to remove \<script name="/usr/share/distro_const/boot_archive_archive_32"\> section from them.
2018-09-01 | Samba was updated to 4.8.4
2018-08-28 | BerkeleyDB 5.1 compatibility symlinks were removed.
2018-07-27 | Tomcat 6 ( web/java-servlet/tomcat ) was removed. Use Tomcat 8 (web/java-servlet/tomcat-8) instead.
2018-07-26 | Libpqxx was updated to incompatible version 6.2.4, all dependent packages should be recompiled.
2018-06-21 | Postfix updated to 3.3.1, configuration format changed in version 3.2 and 3.3, be sure to read the changes in postconf(5).
2018-05-21 | hwloc updated to 2.0.1 is ABI incompatible, dependent libraries such as PETSc need rebuild.
2018-05-05 | ghostcript was updated to likely ABI-incompatible 9.23 version.
2018-02-12 | GCC 6 is the default oi-userland compiler now. Read announce email for details.
2018-01-23 | gdm, libunique, gnome-power manager are removed. Support for creating Gnome2 installation images was removed.
2018-01-22 | upower 0.99.7 and mate-power-manager 1.18.1 were added
2017-12-22 | asterisk was updated to 15.1.4
2017-12-21 | nautilus, file-roller, gnome-control-center and evolution were removed. You can use Mate analogs (caja, engrampa, mate-control-center) and thunderbird instead.
2017-12-20 | totem was updated to 3.0.1
2017-12-12 | audacity 2.1.1 was added to /hipster-encumbered repository.
2017-11-25 | samba was updated to 4.5.15
2017-11-25 | library/gnu-libiconv was removed. Applications should use illumos native iconv interface.
2017-11-17 | IPS sysem repository is now working on OpenIndiana. Documentation was updated: http://docs.openindiana.org/handbook/systems-administration/#zones (look at "System repository configuration").
2017-10-27 | Xorg was updated to 1.19.5. Note, that if you run OI as VirtualBox guest, you should switch to vesa driver, as latest VirtualBox guest additions (currently 5.1.30 or 5.2.0) don't provide Solaris xorg drivers for Xorg 1.19.
2017-10-17 | net-snmp was updated to ABI-incompatible version 5.7.3. All dependent packages should be recompiled.
2017-10-14 | PostgreSQL 9.3 was removed. PostgreSQL 9.4 is the default PostgreSQL version now. PostgreSQL 10 was added.
2017-08-30 | goffice was updated to ABI-incompatible 0.10.35 version, all dependent software should be recompiled
2017-08-10 | libgcrypt was updated to ABI-incompatible 1.8.0 version, all dependent software should be recompiled
2017-08-10 | libgpg-error was updated to 1.27. Due to fix in ligpg-error headers, ABI incompatibility is possible. Dependent applications should be recompiled.
2017-08-08 | apache 2.2 was removed. Users are advised to switch to apache 2.4.
2017-07-26 | libgphoto2 was updated to ABI-incompatible 2.5.14 version. All dependent applications should be rebuilt.
2017-07-19 | Tcl/Tk were updated to 8.6.6. Default tclsh is 64-bit now. Third-party modules likely should be recompiled/reinstalled due to the change of the search path .
2017-07-01 | GeoIP was updated to 1.6.11. geoip-database shipping GeoIP databases was added to oi-userland.
2017-06-23 | MariaDB 5.5 and Percona Server 5.5 were removed. MariaDB 10.1 is the default MySQL implementation now.
2017-05-31 | Mate was updated to 1.18
2017-05-22 | Thunderbird was updated to 52.1.1
2017-05-16 | VLC was updated to 2.2.5.1
2017-05-16 | Firefox was updated to 52.1.1
2017-05-01 | Xorg was updated to 1.18.4. If you had self-compiled xorg modules, they likely have to be recompiled. VirtualBox drivers should be updated.
2017-03-26 | rhythmbox was updated to 3.4.1. Ensure that you install necessary library/audio/gstreamer1/plugin/\* packages when updating your desktop installations, as new rhythmbox uses gstreamer1.
2017-03-26 | totem-pl-parser was updated to ABI-incompatible version 3.10.7
2017-03-24 | unrar was updated to 5.4.5
2017-03-22 | gtk3 was updated to 3.18.9
2017-03-17 | tracker was updated to 1.8.1
2017-03-07 | OpenJDK 8 is the default JDK now. If you build illumos-gate, don't forget to add 'export BLD_JAVA_8=' to your illumos.sh.
2017-01-10 | Perl 5.16 was removed. Perl 5.24 modules are shipped.
2016-12-28 | Bison was updated to 3.0.4
2016-12-22 | PostgreSQL 9.6 was added. It provides only 64-bit binaries, except developer tools. Developer tools for 32-bit applications are provided in $(PG_HOME)/bin/i86.
2016-12-19 | Updated drm port (including reworked agpgart and agpmaster packages) was integrated.
2016-12-15 | GnuTLS 3 (library/gnutls-3) is default gnutls version, used by oi-userland. Details are available here: https://openindiana.org/pipermail/oi-dev/2016-December/005045.html
2016-12-13 | libmicrohttpd was updated to ABI-incompatible 0.9.52 version
2016-12-02 | Ruby 1.9 is dropped. Ruby 2.3 is the default system Ruby now. Ruby 2.3 is updated to 2.3.3, facter - to 2.4.6, puppet - to 3.8.6.
2016-11-29 | Vim is updated to 8.0.0104.
2016-11-26 | GNU TLS 3.4.16 was added.
2016-11-25 | nettle was updated to ABI-incompatible 3.3 version.
2016-11-19 | Mate is updated to 1.16
2016-11-11 | libsmb was relocated to /usr/lib/libsmb (header files - to /usr/include/libsmb) and updated to 4.4.6.  GVFS was updated to 1.26.0. GVFS and gnome-vfs use updated libsmb now.
2016.11-10 | Node.js 7 was added to oi-userland
2016.11-10 | MariaDB 10.1 was added to oi-userland
2016.11-10 | requests, Python HTTP library, was added to oi-userland.
2016-11-10 | pip was updated to 9.0.1
2016-11-09 | sysding now supports creates configuring link aggregation and VLAN interfaces.
2016-10-28 | Distribution constructor now adds extra loader menu options for live images. Manifests, used to generate live images, should be updated. Details are available here: https://openindiana.org/pipermail/oi-dev/2016-October/004956.html
2016-10-28 | OpenOffice was dropped. Details are available here: https://openindiana.org/pipermail/openindiana-discuss/2016-October/019796.html
2016-10-20 | Thunderbird is updated to 45.3.0
2016-10-05 | Python 2.6 is removed
2016-09-29 | PHP 5.4 and 5.5 were removed as they have reached EOL
2016-09-28 | Loader is shipped and enabled by default. See https://www.openindiana.org/2016/09/28/loader-integration/ .
2016-09-22 | CUPS is updated to 1.7.5
2016-09-16 | Mesa is updated to 12.0.3
2016-09-12 | MongoDB 3.3 is added
2016-09-06 | GCC 5.4 is available as optional compiler.
2016-08-29 | Intel KMS port was integrated. People, building their own illumos-gate version, shouldn't be affected, as userland drm version is not restricted by any incorporation. If they care to run fresh drm on illumos-gate build, they can request removing incorporate dependency on drm from illumos-gate.
2016-08-23 | SunSSH was removed. On update you should transparently receive openssh packages. They are called network/ssh (client) and service/network/ssh (server) now.
2016-08-18 | sendmail is updated to 8.15.2
2016-08-17 | clang 3.8 is added
2016-08-16 | inkscape is updated to 0.91
2016-08-16 | new meta-packages for creating install images are available: pkg:/mate_install and pkg:/minimal_install
2016-08-16 | lightdm 1.19.3 and lightdm-gtk-greeter are added
2016-08-10 | GCC 4.9 is updated to 4.9.4
2016-08-04 | arm for monitoring Tor relays is added to oi-userland
2016-08-04 | tor is updated to 0.2.8.6
2016-08-04 | yelp is updated to 3.20.1
2016-07-19 | iso-codes are updated to 3.68
2016-07-19 | OpenJDK 8 1.8.92 is added
2016-07-16 | IPython is updated to 5.0.0.
2016-07-17 | libssh2 is updated to 1.7.0
2016-07-17 | GNU Make is updated to 4.2.1
2016-07-08 | Python 2.7 is default python version now. All software use it by default besides illumos-gate packages, which still need Python 2.6.
2016-07-05 | distro_const now generates full usb images. 1G/2G.header files are no longer required, just copy image to usb stick with dd.
2016-06-16 | samba is updated to new major version 4.4.4.
2016-05-31 | ImageMagick was updated to ABI-incompatible version 6.9.4.5.
2016-05-29 | gd2 was updated to new major release (version 2.1.1). Old binary for gd2 2.0.35 is still delivered.
2016-05-14 | libpng 1.6 is the default libpng now. Older versions are preserved.
2016-05-07 | libtasn1 was upated to ABI-incompatible version 4.8. The only consumer in OI repositories is gnutls, which was rebuilt and updated to ABI-compatible version 2.12.23.
2016-04-16 | libnotify is updated to ABI-incompatible 0.7.6 version. All dependencies are fixed to build against it.
2016-04-16 | fuse driver and libfuse 2.7.6 are integrated
2016-04-13 | samba is updated to 4.2.11. samba36 is removed. vfs_solarisacl module is compiled as static module now
2016-03-25 | libusb-1.0 is added, libmtp is switched from libusb to libusb-1.0
2016-03-22 | GDB is updated to 7.10.1
2016-03-21 | Borg backup tool is added
2016-03-16 | Thunderbird is updated to 38.6.0
2016-03-03 | bash is updated to 4.3.42
2016-03-03 | openssl-fips package was removed
2016-03-02 | DNSCrypt-proxy 1.6.1 was added
2016-02-22 | Openproj was removed
2016-02-22 | Hunspell / Myspell dictionaries were updated. Dictionaries for af_ZA, bg_BG, ca_ES, da_DK, el_GR, en_ZA, eo_l3, et_EE, fa_IR, fo_FO, ga_IE, gd_GB, gl_ES, gv_IE, he_IL, hr_HR, hy_AM, ku_TR, lt_LT, lv_LV, nb_NO, nl_NL, nn_NO, nr_ZA, ns_ZA, pt_PT, ro_RO, sk_SK, sl_SI, ss_ZA, st_ZA, th_TH, tn_ZA, ts_ZA languages were removed.
2016-02-17 | libical is updated to binary incompatible version 1.0 . All dependent software should be rebuilt.
2016-02-11 | Bind DNS server (network/dns/server:default) runs as "named" user now. Check that all necessary files are accessible to named.
2016-01-30 | Firefox is updated to 44.0
2016-01-26 | userland-incorporation is now removable. If you have to uninstall it  (for example, on test PC), do "pkg change-facet facet.require.consolidation/userland/userland-incorporation=false &&  pkg uninstall userland-incorporation"
2016-01-26 | EsounD was removed (superseeded by pulseaudio)
2016-01-22 | PostgreSQL 9.5 is added
2015-12-31 | vlc 2.2.1 is added to /hipster-encumbered
2015-12-31 | ffmpeg is updated to 2.8.4
2015-12-22 | sysidtool and other packages from admin consolidation were removed. service/management/sysidtool was replaced by service/management/sysding . Text installer now can use sysding to configure network on the host.
2015-12-04 | GTK 3 version 3.14.15 was added. GTK 2 is still the main GTK version.
2015-11-29 | Firefox is updated to 43.0b7 (based on the work of Martin Boching).
2015-11-19 | OpenSSH 7.1 was added. To change ssh implementation update to the latest OI version and install network/openssh package.
2015-11-13 | gcc-49 was added. It's the default oi-userland compiler now. gcc-47 and clang-3.3 are removed.
2015-11-13 | erlang was updated to 17.5
2015-11-09 | automake 1.15 was added. It is the default automake now.
2015-11-05 | Apache 2.4 now ships mod_http2 to suport HTTP/2 connections.
2015-11-03 | OpenSSL was updated to 1.0.2d. It should be mostly ABI-compatible to 1.0.1. One notable exception is SSH. It checks that it runs against the version it was compiled. So, you have to update to latest illumos-gate bits or all ssh clients and servers will be broken (pkg update will take care for you if you don't use self-compiled illumos-gate, in case you do, you should recompile it). Note that if you have updated OpenSSL and old ssh bits, default gnome login will fail as it calls ssh-agent.
2015-11-02 | php 5.6 is added
2015-10-28 | nlipkg zone brand introduced. This brand behaves like old ipkg brand and allows creation of non-linked images. Usage instructions are [here](../handbook/systems-administration.md#zones)
2015-10-27 | updates from /dev to /hipster-2015 now can be possible (look at verbose instructions here -  http://openindiana.org/pipermail/oi-dev/2015-October/003823.html)t
2015-10-04 | entire now depends on userland consolidation, which locks all packages to latest versions.
2015-10-04 | visual panels were dropped
2015-09-28 | nvidia proprietary driver was updated to 340.93
2015-09-27 | Xorg server was updated to 1.14.7. Several video drivers were updated. If you use third-party video drivers, they probably should be updated. Nvidia, radeon and vesa video drivers were tested. VirtualBox driver from 5.0.4 guest additions should also work.
2015-09-12 | All popular gstreamer plugins are available from /hipster-encumbered. If you earlier used /sfe or /sfe-encumbered for multimedia software, you are advised to switch to /hipster-encumbered.
2015-09-11 | fftw-3 is updated to binary incompatible version 3.3.4 . All dependent software should be rebuilt.
2015-08-25 | lcms2 is integrated. All packages depending on lcms are switched to lcms2 dependency. Lcms is deprecated and can be removed after next snapshot. New packages shouldn't depend on it. Gqview was replaced by geeqie as gqview didn't support lcms2.
2015-08-24 | imagemagick is updated to binary-incompatible version 6.8.9.10. All dependent software should be rebuilt.
2015-08-23 | Text installer now creates additional ZFS filesystem in new boot environment for /var
2015-08-20 | Samba is updated to 4.1.19. Old one is preserved as service/network/samba/samba36
2015-07-28 | Perl 5.22 is integrated. Perl 5.10 is removed. This means you'll have to set PERL_VERSION="5.22" and PERL_PKGVERS="-522" in your illumos.sh to build illumos-gate. Also MySQL 5.1 and Apache 1.3 were removed. Detail message is available in oi-dev ML: http://openindiana.org/pipermail/oi-dev/2015-July/003749.html
2015-07-27 | compiz and related tools and libraries are updated to 0.8.10
2015-07-26 | inkscape 0.48.5 is added
2015-07-22 | freetype is updated to 2.5.5
2015-07-16 | libXft is updated to 2.3.2, xfs - to 1.1.4
2015-07-14 | mozilla-nss is updated to 3.19.2, mozilla-nspr - to 4.10.8
2015-07-11 | Yasm is updated to 1.3.0
2015-06-26 | GCC-48 is updated to 4.8.5
2015-06-23 | Valgrind 3.11 was added
2015-06-22 | Boost is updated to 1.58.0, MPI is enabled, 64-bit libraries are added
2015-06-12 | Gimp was updated to 2.8.14. Gegl updated to binary incompatible version 0.2.0.
2015-06-06 | Distribution constructor was modified to use Python 2.7.
2015-06-06 | IPS was updated.
2015-05-30 | icu is updated to binary incompatible version 55.1. All dependent packages should be rebuilt.
2015-05-29 | pulseaudio is integrated. gnome-volume-applet is removed. To use pulseaudio with gstreamer, launch gstreamer-properties and ensure that default output is set to "Autodetect" or "PulseAudio Sound Server". On audio output "pactl list sinks" should show /dev/dsp sink as "RUNNING".
2015-05-07 | OpenJDK is updated to 1.7.76, icedtea-web - to 1.5.2. Oracle JDK is removed. OpenJDK is default (and single) JDK now.
2015-05-05 | squid was updated to 3.5.4. Configs are incompatible. Be sure to remove manager, localhost, to_localhost acl definitions from your config files.
2015-04-02 | libtiff was updated to 4.0.3. All dependent applications should be rebuilt.
2015-03-29 | cairo was updated to 1.14.2, pango - to 1.36.8. We recommend to rebuild all dependent applications.
2015-03-25 | poppler was updated to binary incompatible 0.32 version. All dependent applications should be rebuilt.
2015-03-23 | glib2 was updated to 2.43.4. If you build glib2-dependent applications, you can expect failures as more functions were marked as deprecated.
2015-03-15 | json-c updated to binary incompatible 0.12 version. All dependent applications should be rebuilt
2015-03-11 | libid3tag was imported from SFE, so if you use sfe repository, set it to non-sticky, so that library from OI repository could be installed
2015-03-09 | Trusted desktop packages removed
2015-03-06 | Mesa updated to 10.5.0-rc3
2015-02-26 | binutils updated to 2.25
2015-02-17 | xorg-video-intel X device driver was updated to 2.99.917. It seems kernel driver don't implement some ioctls. Intel driver is useless. Use vesa for now....  Or do ' pkg freeze consolidation/X/X-incorporation ' and ' pkg freeze x11/server/xorg/driver/xorg-video-intel ', BEFORE updating to hipster-2015, (e.g. while in hipster 2014.1 or 20141010, to retain older X and intel driver in working state.
2015-02-15 | Xorg server was updated to 1.12.4. All X device drivers updated. All 32-bit-only X device drivers removed. All VirtualBox users have to update their guest additions to at least 4.3.22 version.
2015-02-13 | X video drivers xorg-video-ast, xorg-video-mach64, xorg-video-mga, xorg-video-openchrome, xorg-video-r128, xorg-video-savage, xorg-video-vesa, xorg-video-vmware were updated
2015-02-13 | nvidia proprietary driver was updated to 340.76
2015-02-07 | xf86-video-ati driver updated to 6.4.16. However, without kernel DRI support for modern ATI video adapters, performance is modest.
2015-02-06 | Mesa updated to 9.0.3
2015-02-05 | PostgreSQL 8.4 removed
2015-02-05 | Sun Studio indent in /usr/bin was replaced by GNU indent. Old one is preserved in /opt/sunstudio12.1/prod/bin/indent
2015-02-04 | X11 util-macros was updated to 1.17.1, libX11 - to 1.6.2, xcb support in libX11 enabled
2015-02-03 | X11 protocol headers were updated to fresh versions
2015-01-18 | QT 4.8.6 is added.
2015-01-16 | libdrm is updated to 2.4.58
2015-01-16 | Ruby 2.2 is added. Ruby components sitll use ruby-19.
2015-01-10 | curl is updated to 7.39.0
2015-01-07 | mesa, xorg and X11 video drivers for intel and ati cards were rearranged to match natural package boundaries
2015-01-05 | gnome-panel trusted extension patch and lockdown patch were removed during update to 2.32
2015-01-04 | Nautilus trusted extension patch was removed during update to 2.32
2015-01-03 | GTK is updated to 2.24
2014-12-19 | PostgreSQL 9.4 is added. Prepare for removal of PostgreSQL 8.4 in a month.
2014-12-16 | libncurses moved out of /usr/gnu to /usr
2014-12-15 | nwam-manager updated to 1.151.0
2014-12-14 | GNU Emacs updated to 24.3
2014-12-13 | Python 3.4 updated to 3.4.2. It is compiled with pymalloc, so locations for includes, some libraries and binary modules changed
2014-12-04 | tor updated to 0.2.4.24, rsyslog updated to 7.4.4
2014-12-02 | Studio C++ libraries are no longer supported and are going to be removed. Current  versions of libraries are available here as tarballs: <http://dlc.openindiana.org/c++-libs/>
2014-11-25 | ruby-19 is the default Ruby version. All Ruby consumers are switched to Ruby 1.9. Ruby 1.8 is dropped.
2014-10-04 | Apache OpenOffice is updated to 4.1.1
2014-09-30 | sic_team consolidation was moved from oi-build to oi-userland
2014-08-28 | ftp daemon (earlier provided by illumos-gate wu-ftpd) is replaced by proftpd. Service network/ftp is renamed to service/proftpd. Now ftp daemon is running in standalone mode (previously it was inetd-managed service).
2014-08-12 | gnome-pilot and gnome-pilot-link packages are obsolete now.
2014-08-04 | System perl (/usr/perl5/bin/perl) now links to perl-516. Perl 5.16 was recompiled without -Dperl_static_inline="static" flag, which can affect perl ABI. Most of the Perl 5.10 modules were marked obsolete. Detail message is available in oi-dev ML: http://openindiana.org/pipermail/oi-dev/2014-August/003300.html
2014-08-01 | OpenOffice 4.1.0 is available
2014-07-29 | GDB is updated to 7.6
2014-07-19 | Firefox is updated to 24.6.0 ESR
2014-07-18 | Webkit was added to oi-userland. Devhelp and yelp were switched to webkit.
2014-07-04 | OpenJDK is updated to 1.7.60
2014-07-04 | GCC 4.8.3 is a default userland compiler now
2014-06-27 | GCC is updated to 4.7.4.
2014-06-16 | OpenIndiana /hipster repository was moved to http://pkg.openindiana.org/hipster-2014.1
2014-06-16 | OpenSSL (library/security/openssl) is updated to 1.0.1h. Compatiblity bits are provided in the same package.
2014-06-04 | Updated to Python 2.7.6
2014-05-08 | Webmin is removed (no maintainer, removed upstream)
2014-04-17 | OpenSSL (library/security/openssl) is updated to 1.0.1g. Compatiblity bits are provided in the same package.
2014-04-12 | Remove LP-related desktop components (gnome-print, gnome-print-papi). ghex is also removed (it depends on them, removed upstream).
2014-03-18 | gstreamer was rebuilt. gstreamer/plugin/base and gstreamer/plugin/good are separate packages now
2014-03-12 | slim_source was rebuilt with GCC
2014-02-27 | oi-userland was switched to use new versioning scheme. If you build software, please ensure to test it with set environment variables COMPONENT_BUILD_ARGS=-j4 and USERLAND_ARCHIVES
2014-01-31 | gnome-libs are separated in several packages. text/rarian files moved from /usr to /usr/g++. For compatibility symbolic links in /usr/bin were created to point to corresponding programs in /usr/g++. The library itself is no longer compatible, as it is rebuilt with g++.
2014-01-28 | rapper binary from library/raptor was renamed to rapper-1 to avoid conflict with library/raptor2 package.
2014-01-16 | Python 2.4 is deprecated
2014-01-15 | Thunderbird is updated to 24.2.0
2014-01-08 | Firefox is updated to 17.0.6 ESR, OpenJDK 1.7.45 and icedtea-web 6ec72d653144 are used as java browser plugin.
2013-12-10 | IPS was updated. IPS GUI - package-manager and update-manager - was removed. If you hosted local IPS servers you have to recreate services, which supported these servers.  Procedure is the same, but old services just don't work after update.
2013-11-14 | PostgreSQL 8.2 and 8.3 packages removed (replaced by PostgreSQL 9.3, which is now a default PostgreSQL version)
2013-10-11 | PHP 5.2 removed (replaced by PHP 5.4)
2013-08-20 | MariaDB 5.5 is used as default MySQL provider
2013-07-20 | Perl was updated to 5.16. <br/>Update instructions: <ul><li>To install new perl-516 firstly update perl-510. Old perl-510 ships hardlinks. It was updated to install mediated links. Note, it is just old repackaged perl 5.10.0 from /dev compiled with Sun Studio, only manifest was patched to deliver mediated links. Perl 5.10 is still used while compiling illumos-gate.</li><li>If you just update old library/perl-5/database and other modules you'll receive new packages, which are just meta-packages, new packages will likely pull library/perl-5/\*-516 packages and you'll stay without old modules, so remember to install corresponding library/perl-5/\*-5100 packages after update (if someone is interested 5100 stands for perl 5.10.0). </li></ul>

# TODO

< Place holder for notes >


## Improving the OpenIndiana Project


**NOTE**

For expert community building guidance from a seasoned OpenSolaris veteran, see https://jimgrisanzio.wordpress.com/communities/[Jim Grisianzio's communities page].


### Governance Board

At this time the OpenIndiana project does not have a formal governance board.
Creating a formal governance board would help steer the OpenIndiana project.


### Code of Conduct

At this time the OpenIndiana project does not have a formal code of conduct.
Creating a formal code of conduct would be a healthy step towards ensuring harmony within the project.


### Public Relations

Public relations is an important aspect of project management, even if it's limited to updating 3rd party websites as to the current status of the project.

### 3rd party websites to keep updated
* Distrowatch
    * For the next Distrowatch update, there is a mapping from DistroWatch to Hipster names:
    * http://hub.openindiana.ninja/?q#content/distrowatch-openindiana-hipster-packages[here] - [alarcher]
* http://opensolaris.linuxfreedom.com/ - didn't see OpenIndiana here anywhere (still showing OpenSolaris)
* Unixmen
* Slashdot
* Phoronix

# Hipster News
* Current events with OI Hipster distro
* OI/illumos news stories
* Featured new packages
* Tips and Tricks

### Download mirrors
* Some of the currently listed mirrors are offline or outdated.
    * Need to update the landing pages for some of the mirrors.
* Really need a North American mirror.

### Support forum
* While the project as irc and ml, perhaps a forum would be helpful as well.


### Other Periodic Website Updates
* Publish new pictures for the Community and update the Roadmap every 6 months


### Software wish list to make the desktop more usable

* The desktop is really what makes OpenIndiana Hipster unique among all the different illumos distributions.
    * The project should really capitalize on the desktop, and by extension include lots of GUI software.


### Alternate Desktops
* http://mate-desktop.com/[Mate]
* https://www.kde.org/[KDE]
* https://github.com/linuxmint/Cinnamon[Cinnamon]

### Audio/Video Editing
* http://www.audacityteam.org/[Audacity]
* https://handbrake.fr/[Handbrake]

### Benchmarking tools
* http://www.phoronix-test-suite.com/[Phoronix Test Suite]

### Development tools
* https://atom.io/[ATOM - Text Editor]
* http://www.vim.org/[GVIM - Text Editor]
* https://eclipse.org/[Eclipse - IDE]
* http://meldmerge.org/[Meld - Diff Viewer]
* https://www.sublimetext.com/3[Sublime - Text Editor]

### Desktop publishing
* http://www.scribus.net/[Scribus]
* https://inkscape.org/en/[Inkscape]
* https://www.calligra.org/[Calligra Suite]

### Ebook Tools
* https://calibre-ebook.com/[Calibre]

### File Backup
* https://www.code42.com/crashplan/[CrashPlan]

### File Sharing
* http://deluge-torrent.org/[Deluge]

### File Storage
* http://www.dropbox.com[dropbox]

### Graphics
* https://www.blender.org/[Blender]
* https://krita.org/[Krita]
* http://www.xaraxtreme.org/[Xara]
* http://www.povray.org/[POV-Ray]
* http://www.radiance-online.org/[Radiance]

### Media Center
* https://plex.tv/Plex[Media Server & Plex Home Theater (client)]
* https://kodi.tv/[Kodi]

### Password Manager
* http://keepass.info/[Keypass]

### Photography
* http://www.darktable.org/[Darktable]
* http://rawtherapee.com/[RawTherapee]
* https://www.digikam.org/[Digikam]
* http://hugin.sourceforge.net/[Hugin]
* https://picasa.google.com/[Picasa]

### Systems Automation
* Puppet - Hipster repo has package - version 3.6.2

### System Monitoring
* Nagios (outdated - but might be a starting point) - https://www.opencsw.org/package/nagios/

### Virtualization - OpenIndiana as a Host
* https://virt-manager.org/[Virt-Manager]
* http://www.ovirt.org/[O-virt]
* https://www.virtualbox.org/[Virtualbox]

### Virtualization - OpenIndiana as a Guest
* http://www.spice-space.org/[Native Spice Protocol Support for an OpenIndiana Guest OS]
* https://my.vmware.com/web/vmware/details?productId#491&downloadGroup#VMTOOLS1000[Native Vmware tools support for an OpenIndiana Guest OS]
* Native Virtualbox support for an OpenIndiana Guest OS.

### Web browsers
* http://www.chromium.org/Home[Chromium]

### Suggestions for improving elements of the distro itself
* Updated Custom desktop background for OI - Perhaps downloads from the website, or included in distro.
* Updated Custom splash screen for grub (or Forth bootloader)
* Updated "Welcome to OpenIndiana" desktop page.
* Update the welcome HTML: https://github.com/OpenIndiana/openindiana-welcome/blob/master/data/html/en/index.html


### Wiki Improvements



#### Wiki Usability on Mobile Devices

The OpenIndiana Wiki does not render well on mobile devices.

* The left hand navigation menu is completely absent when browsing the Wiki from Android phones and tablets.

Possible solutions:

* Add in page navigation menus
* Replace the Wiki with a mobile aware Wiki
* Replace the Wiki with a user forum
* Replace the Wiki as part of a larger web presence transformation


#### Need to Create a Wiki Style Guide

Should the Wiki be retained, it may be helpful to create a Wiki style guide.
This would be very helpful by ensuring consistency between the different pages.
It may also be helpful to modify the existing CSS to help improve the aesthetics of the site.

.Possible suggestions
* This would be very helpful for providing some consistency between different pages.
    * Use horizontal lines (top and bottom) to separate code blocks from the text body.
    * Makes it easier to tell what is or isn't code.
Also provides for a more efficient use of space (don't have to use so many line breaks).
* Develop standards for displaying certain types of information...e.g. code blocks, commands, tips, warnings, info, etc.
* consider whether it's possible to enable Wiki page navigation by placing breadcrumbs navigational elements within the page itself, rather than relying entirely on Wiki navigation menu in left hand navigation pane.


* Can look at other Illumos Wikis for ideas and inspiration
    * https://Wiki.smartos.org/display/DOC/Doc+Team+Notes
    * http://omnios.omniti.com/Wiki.php/WikiStart
    * http://Wiki.illumos.org/display/illumos/illumos+Home


#### Some notes for updating Wiki pages

While replacing the Wiki with some kind of continuous integration content management system would likely be the most ideal solution, there are still things which can be done to help improve the Wiki.

.Clean up old user comments
* Many, many comments from 2010 - 2012.
    * Probably a good idea to clean these up and incorporated the information into the page as appropriate.
    * Comments with such old timestamps suggests little site activity has occurred in last 4-5 years.


.Mark old pages for deprecation
* Go through the Wiki and mark content as obsolete.
* Retain items of value and either pull them into the new handbook (if it's helpful for new users), or set it aside for reference when updating the OpenSolaris books.
* Reorganize things which are not being moved.


### WordPress Improvements

Improve the presentation of reference materials

.illumos and OpenIndiana HCL's
* Start a discussion about ways to improve and update this.
* Illumos HLC: https://www.illumos.org/hcl/

.Publishing man pages online
* Start a discussion about getting the Hipster man pages published.
    * illumos core man pages are available on illumos.org
    * OI specific man pages are not published.

```
<leoric> looking at Ubuntu dhcp.conf online man page, I thought it would be good to have automatic extractor and search interface, extracting man pages from package repository and publishing them on OI site...
<alanc> http://illumos.org/man/ covers the illumos ones, but not all the other packages
<leoric> I know about illumos man pages, but thought about all available man pages
<alanc> yeah, I figured that's what you meant
```

.Links to source code
* Talk about the links to the source code and what can be found in each repository.
    * https://hg.openindiana.org/sustaining/
    * https://hg.openindiana.org/upstream/

#### The future of OpenIndiana's web presence

* The current OI website is a marked improvement over what previously existed.
But anything that is already good can be further improved.
* We should begin a strategic discussion about the future direction of web content in general.
    * e.g. do we continue using CMS systems, or start looking at static html?
* Wondering if we can expand on the Hipster name, perhaps by theming the website in a similar manor.
* Hipster denotes something trendy, or in fashion, etc., the website theme should exploit this in some way.
* Could try something some like big fashionable buttons as follows:


| Button label | URL points to |
|---|---|
| Get it | Hipster Downloads |
|Install it| Installation Guidance/Tutorials/Instructions |
| Use it | Hipster Handbook |
| Discuss it | OI Mailing lists/IRC, etc. |
| Extend it | Developer Handbook |


#### Favicon
* Can we add the OI favicon to WordPress like we see on the Wiki?


#### Mobile Devices
*  Due to the dark blue color scheme, this menu is hard to see and easily missed.
    * Maybe we should put something on the front page mentioning the mobile menu which is available in the upper left hand corner.
    * Perhaps the color of the 3 bars mobile menu can be changed to white or something?


#### Other Thoughts (in no particular order)
* Add some links to the Community > Getting Involved page.
* [#oi-dev IRC chat archives](http://echelog.com/logs/browse/oi-dev/)
* [#openindiana IRC chat archives](http://echelog.com/logs/browse/openindiana/)
* [oi-dev mailing list archives - http://openindiana.org/pipermail/oi-dev/
* [openindiana mailing list archives] - http://openindiana.org/pipermail/openindiana-discuss/
* twitter @openindiana
<!-- [Already listed there but maybe it is more a matter of reorganizing the content for better readability - alarcher ] -->

* Have redirects (mailing lists, illumos links, etc., ) open into a new tab so OI webpage remains open.

* Move link to WIKI to a more prominent location (e.g. its own first level tab on home page). Wiki is currently listed last under documentation.
<!-- [Agreed but after the Wiki is turned into something else than a pile of obsolete or unstructured info. Currently I do not want to direct people to this mess - alarcher] -->

* More frequent updates to Latest News.
<!-- [Agreed but need people to write them... - alarcher] -->

* Community > Security Advisories is misleading.
    * This only leads to page to report problems, not view already reported advisories as the breadcrumbs would suggest.
    * Perhaps we could find a way to make this more clear (e.g. Report security issues)

* Documentation > Gallery - Lets update the screenshots - should be from Hipster.

* Remove old pingbacks.
    * They don’t look to offer any real value (e.g. the download page has 68 pingbacks).
<!-- [Already disabled, these are oldies - alarcher] -->

* Blog aggregator
* Post old OpenSolaris docs (as they are updated)
    * As the books are updated, replace them.
* Provide PDF and Epub alternatives.

* Add list of mirrors, torrents, etc., to download page on website.
    * Need to find more places to mirror, preferably some in north america too.
    * https://web.archive.org/web/20091223051956/http://www.opensolaris.com/get/index.jsp[Original list of mirrors]

<!--

The contents of this Documentation are subject to the Public Documentation License Version 1.01
(the "License"); you may only use this Documentation if you comply with the terms of this License.
A copy of the License is available at http://illumos.org/license/PDL.

The Original Documentation is _________________.

The Initial Writer of the Original Documentation is Matt Wilby Copyright (C) 2011.
All Rights Reserved. (Initial Writer contact(s):________________[Insert hyperlink/alias]).

Contributor(s):  Alexander Pyhalov, Aurelien Larcher, Deano Calver, Nikola M.

Portions created by Deano Calver are Copyright (C) 2011.
Portions created by Aurelien Larcher are Copyright (C) 2017.
Portions created by Nikola M. are Copyright (C) 2017.
Portions created by Alexander Pyhalov are Copyright (C) 2019.

Portions created by ______ are Copyright (C)_________[Insert year(s)].
All Rights Reserved. (Contributor contact(s):________________[Insert hyperlink/alias]).

-->

# Getting information about hardware

If your are running the standard MATE install of Openindiana, then Device Driver Utility (ddu), provided by `diagnostic/ddu` package, is your friend (it is located by default under Applications->System Tools).

When run, it will provide a list of hardware sorted by category and the driver (if used).

The device line can be copied into the relevant HCL table, along with which driver is being used.
If for any reason you don't want (or can't) enter it yourself into the HCL, feel free to email the details (Device, driver, OI hipster 'osnet-incorporation' and 'userland-incorporation' versions and status) to hcl-feedback@openindiana.org and the oi-dev mailing-list.

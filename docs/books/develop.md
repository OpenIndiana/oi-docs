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

# Development

## Solaris Dynamic Tracing Guide

| Item | Details
|  --- | ---
| Document Link | <a href="http://dlc.openindiana.org/docs/osol/20090715/DYNMCTRCGGD/html/dynmctrcggd.html" target="_blank">Solaris Dynamic Tracing Guide</a>
| Topics| DTrace is a comprehensive dynamic tracing framework for the Solaris™ Operating System. DTrace provides a powerful infrastructure to permit administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs.</p>The Solaris Dynamic Tracing Guide describes how to use DTrace to observe, debug, and tune system behavior. This book also includes a complete reference for bundled DTrace observability tools and the `D` programming language.
| Relevancy to OpenIndiana Hipster | To be determined
| Target Audience | If you have ever wanted to understand the behavior of your system, DTrace is the tool for you. DTrace is a comprehensive dynamic tracing facility that is built into Solaris. The DTrace facility can be used to examine the behavior of user programs. The DTrace facility can also be used to examine the behavior of the operating system.</p>DTrace can be used by system administrators or application developers, and is suitable for use with live production systems. DTrace will allow you to explore your system to understand how it works, track down performance problems across many layers of software, or locate the cause of aberrant behavior. </p>As you'll see, DTrace lets you create your own custom programs to dynamically instrument the system and provide immediate, concise answers to arbitrary questions you can formulate using the DTrace `D` programming language. </p>DTrace allows all Solaris users to:<ul><li>Dynamically enable and manage thousands of probes</li><li>Dynamically associate logical predicates and actions with probes</li><li>Dynamically manage trace buffers and buffer policies</li><li>Display and examine trace data from the live system or a crash dump</li></ul></p>DTrace allows Solaris developers and administrators to:<ul><li>Implement custom scripts that use the DTrace facility</li><li>Implement layered tools that use DTrace to retrieve trace data</li></ul>
| Requirements | Basic familiarity with a programming language such as `C` or a scripting language such as `awk(1)` or `perl(1)` will help you learn DTrace and the `D` programming language faster, but you need not be an expert in any of these areas. If you have never written a program or script before in any language, Related Information provides references to other documents you might find useful.

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Updated by the illumos project, this title is available in a more recent version:
<a href="http://dtrace.org/guide/preface.html" target="_blank">Dynamic Tracing Guide</a>
</div>


## Solaris Modular Debugger Guide

| Item | Details
|  --- | ---
| Document Link | <a href="http://dlc.openindiana.org/docs/osol/20090715/MODDEBUG/html/moddebug.html" target="_blank">Solaris Modular Debugger Guide</a>
| Topics | The Modular Debugger (MDB) is a highly extensible, general purpose debugging tool for the Solaris™ Operating System (Solaris OS). The Solaris Modular Debugger Guide describes how to use MDB to debug complex software systems, with a particular emphasis on the facilities available for debugging the Solaris kernel and associated device drivers and modules. It also includes a complete reference for and discussion of the MDB language syntax, debugger features, and MDB Module Programming API.
| Relevancy to OpenIndiana Hipster | To be determined
| Target Audience | If you were a detective and were investigating at the scene of a crime, you might interview the witnesses and ask them to describe what happened and who they saw. However, if there were no witnesses or these descriptions proved insufficient, you might consider collecting fingerprints and forensic evidence that could be examined for DNA to help solve the case.</p>Often, software program failures divide into analogous categories: problems that can be solved with source-level debugging tools, and problems that require low-level debugging facilities, examination of core files, and knowledge of assembly language to diagnose and correct.</p>MDB facilitates analysis of this second class of problems.</p>MDB is most useful when you are programming a complex low-level software system such as an operating system. The MDB debugging framework allows you to construct your own custom analysis tools to aid in the diagnosis of these low-level problems. MDB also provides a powerful set of built-in commands that enable you to analyze the state of your program at the assembly language level.
| Requirements | Familiarity with assembly language programming and debugging

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Updated by the illumos project, this title is available in a more recent version:
<a href="https://illumos.org/books/mdb/preface.html" target="_blank">Modular Debugger Guide</a>
</div>

## Device Driver Tutorial

| Item | Details
|  --- | ---
| Document Link | <a href="http://dlc.openindiana.org/docs/osol/20090715/DRIVERTUT/html/drivertut.html" target="_blank">Device Driver Tutorial</a>
| Topics | This Device Driver Tutorial is a hands-on guide that shows you how to develop a simple device driver for the Solaris™ Operating System (Solaris OS). Device Driver Tutorial also explains how device drivers work in the Solaris OS. This book is a companion to _Writing Device Drivers_.</p>_Writing Device Drivers_ is a thorough reference document that discusses many types of devices and drivers. Device Driver Tutorial examines complete drivers but does not provide a comprehensive treatment of all driver types. Device Driver Tutorial often points to Writing Device Drivers and other content for further information.
| Relevancy to OpenIndiana Hipster | To be determined
| Target Audience | You should read this tutorial if you need to develop, install, and configure device drivers for the Solaris OS. You also should read this book if you need to maintain existing drivers or add new functionality to existing Solaris OS drivers. Information about the kernel provided in this book also will help you troubleshoot any problems you might encounter installing or configuring Solaris systems.
| Requirements | To write device drivers for the Solaris OS, you should have the following background:<ul><li>Be a confident C programmer</li><li>Have experience with data structures, especially with linked lists</li><li>Understand bit operations</li><li>Understand indirect function calls</li><li>Understand caching</li><li>Understand multi-threading (see the Multi-threaded Programming Guide)</li><li>Be familiar with a UNIX® shell</li><li>Understand the basics of UNIX system and I/O architecture</li></ul></p>The most important information you need to have to write a device driver are the characteristics of the device. Get a detailed specification for the device you want to drive.</p>Experience with Solaris OS compilers, debuggers, and other tools will be very helpful to you. You also need to understand where the file system fits with the kernel and the application layer. These topics are discussed in this tutorial.


## Writing Device Drivers

| Item | Details
|  --- | ---
| Document Link | <a href="http://dlc.openindiana.org/docs/osol/20090715/DRIVER/html/driver.html" target="_blank">Writing Device Drivers</a>
| Topics | Writing Device Drivers provides information on developing drivers for:<ul><li>character-oriented devices</li><li>block-oriented devices</li><li>network devices</li><li>SCSI target and HBA devices</li><li>USB devices</li></ul></p>This book discusses how to develop multi-threaded reentrant device drivers for all architectures that conform to the Solaris OS DDI/DKI (Device Driver Interface, Driver-Kernel Interface). A common driver programming approach is described that enables drivers to be written without concern for platform-specific issues such as endianness and data ordering.</p>Additional topics include:<ul><li>hardening Solaris drivers</li><li>power management</li><li>driver auto-configuration</li><li>programmed I/O; Direct Memory Access (DMA)</li><li>device context management</li><li>compilation</li><li>installation</li><li>and testing drivers</li><li>debugging driver</li><li>porting Solaris drivers to a 64-bit environment
| Relevancy to OpenIndiana Hipster | To be determined
| Target Audience | This book is written for UNIX® programmers who are familiar with UNIX device drivers. Overview information is provided, but the book is not intended to serve as a general tutorial on device drivers.
| Requirements | To be determined

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Updated by the illumos project, this title is available in a more recent version:
<a href="https://illumos.org/books/wdd/preface.html" target="_blank">Writing Device Drivers</a>
</div>

## Application Packaging Developer's Guide

| Item | Details
|  --- | ---
| Document Link | <a href="http://dlc.openindiana.org/docs/osol/20090715/PACKINSTALL/html/packinstall.html" target="_blank">Application Packaging Developer's Guide</a>
| Topics | The Application Packaging Developers Guide provides step-by-step instructions and relevant background information for designing, building, and verifying packages. This guide also includes advanced techniques that you might find helpful during the package creation process.
| Relevancy to OpenIndiana Hipster | To be determined
| Target Audience | This book is intended for application developers whose responsibilities include designing and building packages. Though much of the book is directed towards novice package developers, it also contains information useful to more experienced package developers.
| Requirements | To be determined


## OpenSolaris Distribution Constructor Guide

| Item | Details
|  --- | ---
| Document Link | <a href="http://dlc.openindiana.org/docs/osol/20090715/DistroConst/html/distroconst.html" target="_blank">OpenSolaris Distribution Constructor Guide</a>
| Topics | The distribution constructor is a tool that application developers can use to build their own custom OpenSolaris™ image which they can then distribute to their contacts and customers.
| Relevancy to OpenIndiana Hipster | To be determined
| Target Audience | To be determined
| Requirements | To be determined


## Memory and Thread Placement Optimization Developer's Guide

| Item | Details
|  --- | ---
| Document Link | <a href="http://dlc.openindiana.org/docs/osol/20090715/MTPODG/html/mtpodg.html" target="_blank">Memory and Thread Placement Optimization Developer's Guide</a>
| Topics | The Memory and Thread Placement Optimization Developer's Guide provides information on locality groups and the technologies that are available to optimize the use of computing resources in the Solaris operating system.
| Relevancy to OpenIndiana Hipster | To be determined
| Target Audience | This book is intended for use by developers who are writing applications in an environment with multiple CPUs and a non-uniform memory architecture. The programming interfaces and tools that are described in this book give the developer control over the system's behavior and resource allocation.
| Requirements | To be determined

<i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">
Updated by the illumos project, this title is available in a more recent version:
<a href="https://illumos.org/books/lgrps/preface.html" target="_blank">Memory and Thread Placement Optimization Developer's Guide</a>
</div>

## Solaris Containers: Resource Management and Solaris Zones Developer's Guide

| Item | Details
|  --- | ---
| Document Link | <a href="http://dlc.openindiana.org/docs/osol/20090715/RSCMGRDEVGD/html/rscmgrdevgd.html" target="_blank">Solaris Containers: Resource Management and Solaris Zones Developer's Guide</a>
| Topics | The Solaris Containers: Resource Management and Solaris Zones Developer's Guide describes how to write applications that partition and manage system resources and discusses which APIs to use. This book provides programming examples and a discussion of programming issues to consider when writing an application.
| Relevancy to OpenIndiana Hipster | To be determined
| Target Audience | This book is for application developers and ISVs who write applications that control or monitor the Solaris Operating System resources.
| Requirements | To be determined


## Solaris Trusted Extensions Developer's Guide

| Item | Details
|  --- | ---
| Document Link | <a href="http://dlc.openindiana.org/docs/osol/20090715/TRSOLDEV/html/trsoldev.html" target="_blank">Solaris Trusted Extensions Developer's Guide</a>
| Topics | Describes how to develop applications with Solaris Trusted Extensions. </p>The Solaris Trusted Extensions Developer's Guide describes how to use the application programming interfaces (APIs) to write new trusted applications for systems that are configured with the Solaris™ Trusted Extensions software.
| Relevancy to OpenIndiana Hipster | To be determined
| Target Audience | Developers, administrators
| Requirements | Readers must be familiar with UNIX® programming and understand security policy concepts.


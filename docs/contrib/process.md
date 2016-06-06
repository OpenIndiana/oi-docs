== Documentation Team Processes


=== Introduction

The basic workflow process for OpenIndiana Docs is simple:

* Fork the OpenIndiana Docs repository.
* Make some changes.
* Send a pull request.


=== General Content Contributor Process

. https://github.com/[Sign up for a GitHub account].
. https://help.github.com/articles/set-up-git/[Install and configure Git].
. https://help.github.com/articles/fork-a-repo/[Fork the OpenIndiana Docs repository].
. https://help.github.com/articles/fork-a-repo/#step-2-create-a-local-clone-of-your-fork[Clone your forked version of the OpenIndiana Docs repository].
. https://help.github.com/articles/syncing-a-fork/[Add the OpenIndiana Docs repository as an _upstream_ repository]. 
. Locate a document to change or decide where in the file hierarchy a new document should be created.
. Implement your changes (e.g. create a new document or modify and existing document).
. Implement or note any menu changes required to support your changes.
. `git fetch` to pull in any available upstream changes.
. Check to see whether upstream changes have affected your proposed changes. 
. `git add` and `git commit` commit your changes.
. `git push` your changes to your forked repository.
. https://help.github.com/articles/using-pull-requests/[Send a pull request] to a content reviewer so your changes may be reviewed for inclusion into the OpenIndiana Docs master repository.

[NOTE]
To assist with the content development process, it may be helpful to visualize your changes using a live preview.
Asciidoctor live preview plugins are available for both Firefox and Chrome/Chromium.
The AsciidocFX IDE also contains a live preview.
If your changes involve modifications to HAML pages, you'll likely want to preview your changes by running Awestruct in development mode.
Running Awestruct in development mode requires a locally installed Ruby development environment.

.HAML syntax checking
You can use the `--check` flag on the HAML executable to check for proper HAML syntax without evaluating the Ruby code.

[source, console]
----
$ haml --check index.html.haml 
Syntax OK
----


=== The Content Review Process

Upon receipt of a pull request, the content reviewer performs the following steps:

. Determines whether the changes are suitable as they are or require additional modifications (providing feedback to the originator as necessary).
. Performs QA testing by running Awestruct in development mode (generally applies only for changes to HAML pages).
. Upon acceptance, merges the pull request into the mainline branch.
. Using the Awestruct framework, manually publishes the changes to the live website.

[NOTE]
At this time the content reviewer performs the role of release manager, manually publishing approved changes.
In the future OpenIndiana Docs will adopt a continuous integration model, where merging changes will automatically trigger a deployment of the website and all of it's contents.


=== Website Development Processes

Community members performing the role of Website Developer work directly with the Awestruct framework to extend the capabilities and visual aspects of the OpenIndiana Docs website.
Naturally most of their time will be spent running Awestruct in development mode.
Aside from this, the website development workflow follows the very same contributor process.


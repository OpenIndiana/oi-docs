# Documentation Team Tools

The OpenIndiana Docs website uses 2 principal technologies and several ancillary technologies:

#### Pricipal technologies:

* The MkDocs content authoring framework.
* The Markdown text markup language.

Both technologies leverage the Python programming language.

#### Ancillary techologies:
 
 * GitHub - GIT repository hosting
 * GitHub Pages - Website publishing from a GitHub repository
 * GIT - Distributed version control
 * Travis-CI - Continuous Integration toolset

## Why use GIT distributed version control for docs?

* Integrity - You can roll back to previous versions
* Mobility - You can edit docs anywhere, no Internet connection required
* Consistency - Docs are treated just like code

## Why a Text Markup Based Docs Framework?

The primary advantage of using a text markup language is:

* Readability
* Flexibility

The raw code for your authored content is simple plain text.
No need for special tools such as WYSIWYG XML editors, etc.


## What is MkDocs?

MkDocs is a modern, flexible, and feature rich content authoring framework and static website generator.
The python based MkDocs framework publishes content as HTML5.
In conjunction with the MkDocs-Pandoc module, content may also be published in the PDF and EPUB formats.

Unlike a CMS system where you are restricted to the confines of an integral editor, the OpenIndiana Docs website has no such restriction.
Here content is authored using a simple text based markup.
Because you are working with plain text files, content may be authored using Atom, EMACS, Gedit, Nano, VIM, or any other text editor.
The choice is yours; Use your favorite editor.


## MkDocs System Characteristics

* Easy to use Markdown syntax.
* Produces professional quality output.
* Extensible - accepts plugins.


## MkDocs and Markdown Informational Links

| URL | Description
|---|---
| <http://www.mkdocs.org/> | MkDocs Content Authoring Framework
| <https://pythonhosted.org/Markdown/> | Python implementation of Markdown
| <http://spec.commonmark.org/0.25/> | The CommonMark Markdown Spec
| <https://github.com/mivok/markdownlint> | Markdown Lint
| <https://travis-ci.org/> | Continuous Integration (similar to Jenkins, etc.)
| <https://pages.github.com/> | Publish from your github repo


## The OpenIndiana Docs GitHub Repository

As the OpenIndiana Docs website is still a proof of concept technology demonstration, its Github repository remains under the private control of the original author.
If the concept is approved for inclusion under OpenIndiana GitHub organizational umbrella, then it will have an official repository.

Meanwhile, you can find the OpenIndiana Docs repository here: [https://github.com/makruger/website](https://github.com/makruger/website-2.0)

The repository consists of 2 branches:

* master
* gh-pages

Development occurs in the master branch.
The gh-pages branch is used to publish the site to GitHub pages.


## Docs Site Publishing

Following the best practices of continuous integration, the OpenIndiana Docs website is fully automated using Travis-CI.
Upon a commit to the site GitHub repository, Travis-CI immediately performs a series of validation tests.
If the validation tests pass, then the website is automatically published to Github Pages.


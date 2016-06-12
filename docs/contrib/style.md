# Documentation Team Style Guide

<!-- NOTE: --> <i class="fa fa-info-circle fa-lg" aria-hidden="true"></i> **NOTE:**
<div class="well">

This style guide provides a brief introduction to the Markdown text markup syntax.

Additionally, you may find the following resources helpful:

* [The Commonmark Markdown Standard](http://spec.commonmark.org/0.25/)
* [Rules for mdl (Markdown Linter)](https://github.com/mivok/markdownlint/blob/master/docs/RULES.md)
* [Documentation Style Guide for OpenSolaris](https://web.archive.org/web/20081207155129/http://opensolaris.org/os/community/documentation/files/OSOLDOCSG.pdf) - Internet Archive - PDF (270 pages)
</div>

## Getting started with Markdown

### Headers

Headers in markdown (much like HTML) come in various sizes.

**Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
# First level header

## Second level headers

### Tertiary level header
```

In this simple example you can see some headers have less hashes then others.
The more hashes added, the smaller the header will be, for example.

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

# First level header

## Second level header

### Tertiary level header
</div>

### Ordered lists

Ordered or numbered lists are fairly simple to do in markdown.

**Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
1. First item
2. Second item
3. Third item
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

1. First item
2. Second item
3. Third item
</div>

### Unordered lists

Unordered lists are great for general lists that don't need to be done
in specific steps.

**Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
* this
* is
* unordered
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

* this
* is
* unordered
</div>

### Nested lists

**Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
* Markdown lists are:
    * awesome
    * amazing
    * really cool
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

* Markdown lists are:
    * awesome
    * amazing
    * really cool
</div>

### Tables

**Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
| Table Header 1 | Table Header 2
| --- | ---
| Row 1, Column 1 | Row 1, Column 2
| Row 2, Column 1 | Row 2, Column 2
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

| Table Header 1 | Table Header 2
| --- | ---
| Row 1, Column 1 | Row 1, Column 2
| Row 2, Column 1 | Row 2, Column 2

</div>

### URL's

**Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
[The OpenIndiana Website](http://www.openindiana.org)

or (bare url's)

<http://www.openindiana.org>
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

[The OpenIndiana Website](http://www.openindiana.org)

or (bare url's)

<http://www.openindiana.org>
</div>

### Code blocks

Code blocks are created by "fencing" the block of code using three (3) backtick marks.
For the purpose of syntax highlighting, you may also specify the programming language.

**Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
#!/bin/bash
  if [ "foo" = "foo" ]; then
    echo expression evaluated as true
  fi
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

```bash
#!/bin/bash
  if [ "foo" = "foo" ]; then
    echo expression evaluated as true
  fi
```

</div>

### In-line HTML

In addition to Markdown plain text markup, the Mkdocs frameworks also supports the inclusion of in-line HTML.
For example, sometimes you may find Markdown doesn't do quite what you need to do.
In these cases you may include some in-line HTML.

**Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
<!-- This is a single line comment -->

<!--
This comment
spans multiple
lines
-->
```

Comments are not rendered as HTML, but are very useful for adding hidden TODO lists, or other useful notes.
This is primarily for internal use by members of the OpenIndiana documentation team.

### In-line HTML - Advanced

#### Bootstrap elements

The OpenIndiana Docs website uses a CSS theme derived from Bootstrap.
More specifically it uses the Spacelab theme from Bootswatch.
This means elements from the Bootstrap framework may be used in-line right along with Markdown text markup.

In many of the examples on this page, Bootstrap HTML wells were used.

You can find a complete list of available HTML elements here: <https://bootswatch.com/spacelab/>

For further information about how to use the Bootstrap framework, see here: <http://www.w3schools.com/bootstrap/default.asp>

#### Font Awesome elements

Font Awesome is a collection of web icons which may be used within the MkDocs framework.

In many of the examples on this page, Font Awesome icons were employed.

For further information about how to use Font Awesome web icons, see here: <http://fontawesome.io/>

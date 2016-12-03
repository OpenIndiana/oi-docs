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

# Markdown Syntax Guide

### Italics and bold text

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
This is plain text

_This is italic text_

**This is bold text**
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

This is plain text

_This is italic text_

**This is bold text**

</div>


### Headers

Headers in markdown (much like HTML) come in various sizes.

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
# First level header
## Second level header
### Third level header
#### Fourth level header
##### Fifth level header
###### Sixth level header
```

In this simple example you can see some headers have less hashes then others.
The more hashes added, the smaller the header will be, for example.

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

<h1>First level header</h1>
<h2>Second level header</h2>
<h3>Third level header</h3>
<h4>Fourth level header</h4>
<h5>Fifth level header</h5>
<h6>Sixth level header</h6>

</div>


### Ordered lists

Ordered or numbered lists are fairly simple to do in markdown.

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

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

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

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

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

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

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

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


### External URL's

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

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


### Internal URL's

Internal URL's operate a little differently than external URL's.
Simply specify the relative path to the document.
You can even target a specific section of the document.

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
[The OpenIndiana Handbook - getting started](../handbook/getting-started.md)

[Handbook - Appendix - Finding Help and Support](../handbook/appendix.md#finding-help-and-support)
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

[The OpenIndiana Handbook - getting started](../handbook/getting-started.md)

[Handbook - Appendix - Finding Help and Support](../handbook/appendix.md#finding-help-and-support)

</div>

### Images

Specify the relative path to the image, just like an internal URL.

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
![openindiana logo](../Openindiana.png)
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

![openindiana logo](../Openindiana.png)

</div>


### Block quotes

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
> This is a block quote.
> And here is the 2nd line of the quote.
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

> This is a block quote.
> And here is the 2nd line of the quote.

</div>


### Code blocks

Code blocks are created by "fencing" the block of code using three (3) backtick marks.
For the purpose of syntax highlighting, you may also specify the programming language.

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

    ```markdown
    #!/bin/bash
      if [ "foo" = "foo" ]; then
        echo expression evaluated as true
      fi
    ```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>

```bash
#!/bin/bash
  if [ "foo" = "foo" ]; then
    echo expression evaluated as true
  fi
```

### In-line code

In-line code is delineated with a single backtick mark at each end of the text.

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

    Here is some plain Markdown followed by `a section of in-line code`.


**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

Here is some plain Markdown followed by `a section of in-line code`.

</div>

### In-line HTML

In addition to Markdown plain text markup, the Mkdocs frameworks also supports the inclusion of in-line HTML.
For example, sometimes you may find Markdown doesn't do quite what you need to do.
In these cases you may include some in-line HTML.

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
<!-- This is a single line comment -->

<!--
This comment
spans multiple
lines
-->
```

Comments are meant to be hidden, so they not rendered as HTML.
You'll likely find them very useful for adding TODO lists, or other useful notes.
Comments are primarily for internal use by members of the OpenIndiana documentation team.


### In-line HTML - Advanced


#### Using HTML within Markdown tables

**Markdown Code** <i class="fa fa-code fa-lg" aria-hidden="true"></i>

```markdown
| Item | Description
| --- | ---
| Item 1 | This is a single line description
| Item 2 | This is a multi line description with an unordered list:<ul><li>First item</li><li>Second item</li></ul>Lets add another paragraph to that.</p> And here it is.
| Item 3 | We can also use multiple sentences within tables. Here is the second sentence. And here is a third.
```

**Rendered HTML** <i class="fa fa-html5" aria-hidden="true"></i>
<div class="well">

| Item | Description
| --- | ---
| Item 1 | This is a single line description
| Item 2 | This is a multi line description with an unordered list:<ul><li>First item</li><li>Second item</li></ul>Lets add another paragraph to that.</p> And here it is.
| Item 3 | We can also use multiple sentences within tables. Here is the second sentence. And here is a third.

</div>


#### Bootstrap elements

The OpenIndiana Docs website uses a CSS theme derived from Bootstrap.
More specifically it uses the Spacelab theme from Bootswatch.
This means elements from the Bootstrap framework may be used in-line right along with Markdown text markup.

In many of the examples on this page, Bootstrap HTML _wells_ were used.

You can find a complete list of available HTML elements here: <https://bootswatch.com/spacelab/>

For further information about how to use the Bootstrap framework, see here: <http://www.w3schools.com/bootstrap/default.asp>


#### Font Awesome elements

Font Awesome is a collection of web icons which may be used within the MkDocs framework.

In many of the examples on this page, Font Awesome icons were employed.

For further information about how to use Font Awesome web icons, see here: <http://fontawesome.io/>


### Further reading

* [The Commonmark Markdown Standard](http://spec.commonmark.org/0.25/)
* [Rules for mdl (Markdown Linter)](https://github.com/mivok/markdownlint/blob/master/docs/RULES.md)

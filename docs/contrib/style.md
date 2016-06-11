# Documentation Team Style Guide


### Introduction

The OpenIndiana Style Guide is at this time a blank page.
Consider helping to create this important document.

Until then, the OpenSolaris Style Guide may be a helpful reference.

* [OpenSolaris Documentation Style Guide](https://web.archive.org/web/20081207155129/http://opensolaris.org/os/community/documentation/files/OSOLDOCSG.pdf) - [Internet Archive - PDF]
* [Rules for mdl(markdown linter](https://github.com/mivok/markdownlint/blob/master/docs/RULES.md)

## Getting started with markdown

### Headers

Headers in markdown (much like HTML) come in various sizes.

#### Code:

```markdown
# First level header

## Second level headers

### Tirtiary level header
```

In this simple example you can see some headers have less hashes then others.
The more hashes added, the smaller the header will be, for example.

#### Rendered:

# First level header

## Second level header

## Tirtiary level header

### Lists

####  Ordered lists

Ordered or numbered lists are fairly simple to do in markdown.

##### Code:

```markdown
1. First item
2. Second item
3. Third item
```

##### Rendered:

1. First item
2. Second item
3. Third item

#### Unordered lists

Unordered lists are great for general lists that don't need to be done
in specific steps.

##### Code:

```markdown
* this
* is
* unordered

- this
- is
- also
- unordered
```

##### Rendered

* this
* is
* unordered

- this
- is
- also
- unordered

#### Nested lists

##### Code:

```markdown

* Markdown lists are:
    * awesome
    * amazing
    * really cool

- Openindiana can run on:
   - Physical hardware
   - Virtual hardware

```

##### Rendered:

* Markdown lists are:
    * awesome
    * amazing
    * really cool

- Openindiana can run on:
    - Physical hardware
    - Virtual hardware

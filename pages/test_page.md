---
title: This is my boiler plate page
bibliography: biblio.bib
---

# My test page

Im going to test out all my markdown components in this page.

In-line formatting
------------------
The text can be <b>formatted</b> with html.

The text can *emphasized* with * or _

The text can _emphasized_ with * or _

The text can __strong_emphasized__ with ** or __

The text can **strong_emphasized** with ** or __

A part of the word can be also em**phasize**ed with only a *

A text can ~~strikethroughed~~

Subscripts and super scripts are also possible. Use ^ and ~ on both sides of the script.

H~2~0. 2^100^. Variable~a\ subscript~. Variable^N\ number^

``
this is verbatim text
``

> this is a block qoute?

You can also use `atribute` tags and also with language support. 

For example `def func_name`{.python} is a aatribute of python.

A text can be [underlined]{.underline}

A tex can be [higlighted]{.mark} too.


I can refer to the equations as . I can do inline math too - $x = y^3$
<!-- https://www.fabriziomusacchio.com/blog/2021-08-10-How_to_use_LaTeX_in_Markdown/ -->
$$
\begin{gather*}
    % C_{\{r,g,b\}} = \sum_{i \in \mathcal{N}}{c_i\alpha_iT_i}
    \tag{1}
    C = \sum_{i \in \mathcal{N}}{c_i\alpha_iT_i} \label{eq:test1} \\
    \tag{2}
    C = \sum_{i \in \mathcal{N}}{c_i\alpha_i{\prod_{j = 0}^{i}(1 - \alpha_j)}} \label{eq:test2}
\end{gather*}
$$

I can refer to the equations using eqref like this $\eqref{eq:test1}$. If you click on "$\eqref{eq:test2}$", it will jump to it.

Parses textual emojis like `:smile:` :smile: as Unicode emoticons.

Here is a footnote reference, [^1] and another. [^longnote]


This paragraph won't be part of the note, because it
isn't indented.

Here is an inline note.^[Inline notes are easier to write, since
you don't have to pick an identifier and move down to type the
note.]

Citations are also possible. 
Blah blah  said in thier paper @R-base.
The work can be found at  [@R-base, pp 2-3].

<!-- All citations should be at the end or togher to work. weird. Just use in-line footnote or cite -->
[^1]: Here is the footnote.

[^longnote]: Here's one with multiple blocks.

    The whole paragraph can be indented, or just the first
    line.  In this way, multi-paragraph footnotes work like
    multi-paragraph list items.

## level-2 heading 

level-1 heading
===============

level-2
-------
- list 
- list2
- list
  - sublist
  - sublist

1. number1
2. number2
3. number3


```python {.numberLines}
# python code 
def get_other_files(file_path):
    dir = os.path.dirname(file_path)
    dir_files = [os.path.join(dir, f) for f in os.listdir(dir) if os.path.isfile(os.path.join(dir, f))]
    dir_files.remove(file_path)
    return dir_files
```

```bash {.numberLines}
# bash code
# convert markdowns to html
find ${SOURCE} -type f -name "*.md" | while read -r file; do
    relative_path=${file#${SOURCE}}
    dest_subdir="${DEST}$(dirname "${relative_path}")"

    mkdir -p $dest_subdir

    pandoc "$file" -B ./includes/header.html -A ./includes/footer.html -H ./includes/custom.html -s -o "$dest_subdir/$(basename "${file%.md}.html")"
done
```

### level-3 heading - tables
- table

| Month    | Savings |
| -------- | -------: |
| January  | $250    |
| February | $80     |
| March    | $420    |

# In-line scripts from github
<script src="https://gist.github.com/0x536b/26792a1a3905e11515e997982420eb07.js"></script>

# References
<div id="refs"></div>
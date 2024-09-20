#!/bin/bash

SOURCE="./pages"
DEST="./public"
rm -rf $DEST
mkdir -p $DEST

# Add all blog posts to the blog.md
BLOG_TEMPLATE="./includes/blog_template.md"
BLOG_DIR="./pages/blog_posts"
BLOG_TARGET="./pages/blog.md"

rm -f $BLOG_TARGET
cat $BLOG_TEMPLATE > $BLOG_TARGET

find ${BLOG_DIR} -type f -name "*.md" | sort -r | while read -r file; do
    # echo "${file#${BLOG_DIR}}"
    # echo "${file%.md}"
    tmp="- [$(basename "${file%.md}")](/blog_posts/$(basename "${file%.md}").html)"
    echo $tmp >> $BLOG_TARGET
done

# add footer's last updated tag
rm -f ./includes/footer.html
cat ./includes/footer_template.html > ./includes/footer.html
echo "Last updated: $(TZ=America/Chicago date) </footer>" >> ./includes/footer.html

# convert markdowns to html
find ${SOURCE} -type f -name "*.md" | while read -r file; do
    relative_path=${file#${SOURCE}}
    dest_subdir="${DEST}$(dirname "${relative_path}")"

    mkdir -p $dest_subdir

    # pandoc "$file" -B ./includes/header.html -A ./includes/footer.html -H ./includes/custom.html -s -o "$dest_subdir/$(basename "${file%.md}.html")"
    # pandoc "$file" --from markdown+fenced_code_attributes+pipe_tables+emoji+citations --citeproc --mathjax -B ./includes/header.html -A ./includes/footer.html -H ./includes/custom.html -s -o "$dest_subdir/$(basename "${file%.md}.html")"
    pandoc "$file" --from markdown+fenced_code_attributes+pipe_tables+emoji --citeproc --mathjax -B ./includes/header.html -A ./includes/footer.html -H ./includes/custom.html -s -o "$dest_subdir/$(basename "${file%.md}.html")"
done


# copy all images folder to target
find ${SOURCE} -type d -name "images" | while read -r dir; do
    relative_path=${dir#${SOURCE}}

    mkdir -p "$DEST/$(dirname "$relative_path")"

    cp -r "$dir" "$DEST/$(dirname "$relative_path")"
done


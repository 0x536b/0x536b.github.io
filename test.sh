#!/bin/bash

# A file to store all my bash experiments

BLOG_TEMPLATE="./includes/blog_template.md"
BLOG_DIR="./pages/blog_posts"
BLOG_TARGET="./pages/blog.md"

rm -f $BLOG_TARGET
cat $BLOG_TEMPLATE > $BLOG_TARGET

find ${BLOG_DIR} -type f -name "*.md" | sort | while read -r file; do
    # echo "${file#${BLOG_DIR}}"
    # echo "${file%.md}"
    tmp="- [$(basename "${file%.md}")](/blog_posts/$(basename "${file%.md}").html)"
    echo $tmp >> $BLOG_TARGET
done
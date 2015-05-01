devdocs is a Jekyll site served by GH-Pages. Jekyll is a simple, blog-aware, static site generator. Jekyll uses the [Liquid](https://github.com/Shopify/liquid/wiki) templating languge to process templates. Visit the Jekyll site to learn more about [Jekyll specific tags and filters](http://jekyllrb.com/docs/templates/).

The docs site is all on the gh-pages branch.

Please make all changes on a branch and do a pull request. When you merge a change it **goes live immediately**, please ensure that you've checked spelling, grammar, and links before merging.

## Adding a Post

To create a new post, all you need to do is create a new file in the _posts directory. How you name files in this folder is important. Jekyll **requires** blog post files to be named according to the following format:

```
YEAR-MONTH-DAY-title.MARKUP
```

Where YEAR is a four-digit number, MONTH and DAY are both two-digit numbers, and MARKUP is the file extension representing the format used in the file. For example, the following are examples of valid post filenames:

```
2011-12-31-new-years-eve-is-awesome.md
```

Posts are organized in the _posts directory by topic. The folder structure in the _posts directory doesn't impact the generated site. All permalinks are generated using the post title and category:

```
/:categories/:title/
```

Category and title and other pieces of information must be set on the post's [front matter](http://jekyllrb.com/docs/frontmatter/).

Learn more about [creating posts](http://jekyllrb.com/docs/posts/) on the Jekyll site.

## Testing Locally

```
 gem install jekyll
 jekyll serve
```

If you get the error: `cannot load such file -- jekyll-sitemap (LoadError)`. Then you should also run:

    gem install jekyll-sitemap

Now browse to: `http://localhost:4000`

Have fun and write responsibly.

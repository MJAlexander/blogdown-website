# Monica Alexander's Website

Personal academic website for [Monica Alexander](https://www.monicaalexander.com/), built with [Quarto](https://quarto.org/) and deployed via GitHub Pages.

## Local development

Preview the site locally with live reload:

```bash
quarto preview
```

## How to update the site

### Edit a static page

Static pages like `about.qmd`, `news.qmd`, `research.qmd`, `teaching.qmd`, etc. are plain Markdown files with YAML frontmatter. Just edit the file and re-render.

### Add a new blog post

1. Create a new directory under `posts/` named with the date and a slug, e.g. `posts/2026-03-15-my-new-post/`
2. Add an `index.qmd` file inside it:
   ```yaml
   ---
   title: "My New Post"
   author: "Monica Alexander"
   date: "2026-03-15"
   ---

   Post content goes here.
   ```
3. If the post uses data files, place them in the same directory alongside `index.qmd`.
4. The post will automatically appear in the blog listing at `posts/index.qmd`.

### Add a new static page

1. Create a new `.qmd` file at the project root (e.g. `new-page.qmd`)
2. To add it to the navbar, edit `_quarto.yml` under `website: navbar: right:` and add an entry

### Build and deploy

```bash
quarto render
```

This renders the full site into `docs/`. Then commit and push:

```bash
git add -A
git commit -m "Update site"
git push
```

GitHub Pages serves from the `docs/` folder on the main branch. Changes go live once pushed.

## Project structure

```
_quarto.yml          # Site configuration (navbar, theme, output directory)
custom.scss          # Style customizations (colors, fonts, layout)
index.qmd            # Homepage
posts/               # Blog posts (one directory per post)
  index.qmd          # Blog listing page
  _metadata.yml      # Shared defaults for all posts
  <slug>/index.qmd   # Individual posts
women_scholars/      # Interactive scholars table (reactable + CSV)
images/              # Profile photo
img/                 # Post images (referenced from blog posts)
pdf/                 # PDFs (CV, papers)
docs/                # Rendered site output (committed for GitHub Pages)
_freeze/             # Cached R output (commit this — avoids re-running R code)
```

## Notes

- The `_freeze/` directory caches R computation results. Keep it committed so you don't need to re-run all R code on every render.
- Posts with missing R packages use `execute: eval: false` to display code without running it.
- Font Awesome icons are loaded via CDN (configured in `_quarto.yml`).
- The `.nojekyll` file tells GitHub Pages not to process the site with Jekyll.

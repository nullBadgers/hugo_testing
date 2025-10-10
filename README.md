# hugo_testing
Creating a Hugo site.

## Deploy to GitHub Pages

This repo uses GitHub Actions to build and deploy the site to GitHub Pages.

Prereqs:
- `baseURL` in `hugo.toml` must be `https://nullbadgers.github.io/`.
- Active workflow: `.github/workflows/hugo-pages.yml`.

Build and publish:
```bash
# from repo root
rm -rf public
HUGO_ENV=production hugo --minify --baseURL "https://nullbadgers.github.io/"

git add public
git commit -m "Build site"
git push
```

Notes:
- The workflow uploads `public/` and deploys to Pages.
- In repo Settings → Pages, set Source: GitHub Actions.
- If the site looks different on Pages vs local, ensure the build uses the correct baseURL (as above) and hard refresh the browser.

## Create & publish a post (from IDE)

1) Create the post

Page bundle (recommended for images beside content):
```bash
hugo new content/posts/my-post/index.md
```

Single file (images in `static/images/`):
```bash
hugo new content/posts/my-post.md
```

2) Front matter examples

Page bundle:
```yaml
---
title: "My Post Title"
slug: "my-post"
date: 2025-10-08T00:00:00Z
lastmod: 2025-10-08T00:00:00Z
authors: ["Your Name"]
tags: []
draft: false
cover:
  image: "cover.jpg"
  alt: "Cover alt text"
  relative: true
---
```

Single file:
```yaml
---
title: "My Post Title"
slug: "my-post"
date: 2025-10-08T00:00:00Z
lastmod: 2025-10-08T00:00:00Z
authors: ["Your Name"]
tags: []
draft: false
cover:
  image: "/images/cover.jpg"
  alt: "Cover alt text"
  relative: false
---
```

3) Add images
- Page bundle: place images next to `index.md` and reference `image.jpg`.
- Single file: place images under `static/images/` and reference `/images/image.jpg`.
- Optional shortcode:
```markdown
{{< figure src="image.jpg" alt="Alt" caption="Optional caption" >}}
```

4) Preview locally
```bash
hugo server -D
```
- Visit the local URL shown in the terminal.
- Set `draft: false` when ready to publish.

5) Publish via IDE Source Control
- Stage the new/changed files (post + images).
- Commit (e.g., "Publish: My Post Title").
- Push — GitHub Actions builds and deploys to Pages automatically.

6) Verify on GitHub Pages
- `https://nullbadgers.github.io/posts/my-post/`
- If images/styles are missing, wait for the workflow to finish and hard refresh.

## Troubleshooting GitHub Pages

- Page shows README instead of the site:
  - Repo Settings → Pages → set Source to "GitHub Actions" (not Branch).
  - Re-run the workflow (or push an empty commit) and hard refresh the site.
- Online looks different from local:
  - Ensure the CI build uses: `hugo --minify --baseURL "https://nullbadgers.github.io/"` (already set in `.github/workflows/hugo-pages.yml`).
  - In the deploy run, confirm the artifact contains `index.html` and `ananke/css/main.min.css`.
# Test commit for GitHub Actions

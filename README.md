# hugo_testing
Creating a Hugo site.

## Deploy to GitHub Pages

This repo uses GitHub Actions to build and deploy the site to GitHub Pages.

Prereqs:
- `baseURL` in `hugo.toml` must be `https://nullbadgers.github.io/hugo_testing/`.
- Active workflow: `.github/workflows/hugo-pages.yml`.

Build and publish:
```bash
# from repo root
rm -rf public
HUGO_ENV=production hugo --minify --baseURL "https://nullbadgers.github.io/hugo_testing/"

git add public
git commit -m "Build site"
git push
```

Notes:
- The workflow uploads `public/` and deploys to Pages.
- In repo Settings → Pages, set Source: GitHub Actions.
- If the site looks different on Pages vs local, ensure the build uses the correct baseURL (as above) and hard refresh the browser.

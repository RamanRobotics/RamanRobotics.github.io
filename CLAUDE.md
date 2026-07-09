# robotics-website

Ramana Botta's personal website. Built with [Quarto](https://quarto.org), hosted on GitHub Pages at
**https://ramanrobotics.github.io/** via repo `RamanRobotics/RamanRobotics.github.io` (remote `origin`).

## Structure

- `index.qmd` — About/Home page (Quarto `jolla` about-template: photo, bio, social links)
- `projects.qmd` + `projects/<slug>/index.qmd` — Projects grid listing
- `blog.qmd` + `posts/<slug>/index.qmd` — Blog post listing (RSS feed enabled)
- `notes.qmd` + `notes/<slug>/index.qmd` — Informal notes listing
- `profile.svg` — placeholder avatar (swap in a real photo under the same filename, or update `image:` in `index.qmd`)
- `styles.css` — site-wide styling on top of the `cosmo` Quarto theme
- `templates/post-template.qmd` — front-matter reference/template for new posts
- `scripts/new-post.sh "Title"` — scaffolds `posts/<slug>/index.qmd` from the template

## Deployment (important)

Publishing is **fully automated via GitHub Actions** (`.github/workflows/publish.yml`):
push to `main` → workflow renders with Quarto → uploads `_site/` as a Pages artifact → deploys.

- The repo is **source-only** — `.qmd`/config files are committed, rendered HTML is not.
  `_site/` is gitignored and only exists locally as a preview build.
- Repo **Settings → Pages → Build and deployment → Source** must be **"GitHub Actions"**
  (not "Deploy from a branch" — the legacy branch/Jekyll build will silently override the
  Actions deployment and serve a generic Jekyll page built from `README.md` instead of the
  real site if this is misconfigured). This was flipped correctly on 2026-07-09; if the live
  site ever reverts to showing a bare "RamanRobotics.github.io | Raman" Jekyll page, check
  this setting first.
- Do **not** use `quarto publish gh-pages` — it requires an interactive terminal for
  first-time setup and previously caused untracked session files to be silently deleted when
  run non-interactively. The GitHub Actions workflow replaced it entirely.

## Local workflow

```bash
quarto preview          # live-reload local preview while editing
quarto render            # one-off render to _site/ (gitignored, just for local sanity-checking)
scripts/new-post.sh "My New Post"   # scaffold a new blog post
git push origin main     # triggers the real deploy via GitHub Actions
```

## Known placeholders still needing real content

Search for `<!-- PLACEHOLDER` comments. As of 2026-07-09:
- `index.qmd` — bio text is a draft; LinkedIn/GitHub/X URLs are guessed (`ramanabotta`,
  `RamanaBotta`) and unconfirmed. Site contact email is `chandhra1999@gmail.com` (personal,
  not the Boson Motors work address).
- `projects/project-1/index.qmd`, `projects/project-2/index.qmd` — placeholder write-ups.
- `posts/welcome-to-the-blog/index.qmd`, `posts/test/index.qmd` — placeholder/test posts;
  `posts/test` in particular was a scaffold-script test run and can be deleted once real
  posts exist.
- `notes/first-note/index.qmd` — placeholder note.
- `profile.svg` — generated placeholder avatar (initials "RB"), not a real photo.

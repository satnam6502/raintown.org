# raintown.org

Source for [raintown.org](https://raintown.org), Satnam Singh's personal website: mostly cooking, food and whisky, plus a few personal essays and some older technical material (the Lava HDL tutorial and a System Verilog Assertions tutorial).

The site is built with [Jekyll](https://jekyllrb.com/) 4 using the `jekyll-theme-minimal` theme.

## Hosting

> **The website is served by the web server on the DigitalOcean droplet
> `oban.raintown.org`.** It is **not** served by GitHub Pages. This repository
> only holds the source; nothing is published until the built site is copied
> to oban.

`raintown.org` and `www.raintown.org` both resolve to oban (178.128.162.15), which serves the site with Apache from `satnam@oban.raintown.org:public_html`. The server also hosts pages that are not in this repository (for example `/talks/`), which is why the deploy never deletes files on the server.

Historical note: the previous deployment copied the site to user `raintow`, folder `domains/raintown.org/public_html`. That setup is no longer used.

### The `/talks/` folder

[raintown.org/talks/](https://raintown.org/talks/) exists only on oban, in `public_html/talks/`. It is not in this repository and is not built by Jekyll, so it has no copy under version control here; take care when changing anything under `public_html` on the server. Other pages link to it (for example the Ross Anderson post).

**TODO:** at some point the talks folder needs to be properly integrated, either into this site (as Jekyll source in this repository) or into the professional site [satnam6502.github.io](https://satnam6502.github.io). If it moves to satnam6502.github.io, add a redirect from `/talks/` on oban so existing links keep working.

## Layout

| Path | Contents |
|---|---|
| `_posts/` | Blog posts and recipes. Each post sets its URL with `permalink:` in its front matter. |
| `_layouts/` | Page templates. `personal.html` is the main layout, with the sidebar and the list of posts; `default.html` is a bare page (used by `pay/`); `tech.html` is used by the technical tutorials. |
| `index.md` | Home page. |
| `recipes/`, `glasgow/`, `directions/`, `pay/` | Standalone pages. |
| `lava/`, `sva/` | Lava HDL and System Verilog Assertions tutorials. |
| `images/` | Images used across the site. |
| `_config.yml` | Jekyll configuration: site title, theme and files excluded from the build. |
| `push.sh` | Deploy script (see below). |
| `_site/` | Build output. Ignored by git; do not edit. |

## Building locally

The site uses Jekyll 4.4, which needs Ruby 2.7 or later. macOS's built-in Ruby (2.6) is too old, so install Homebrew's (`brew install ruby`); the Makefile uses it automatically when present. Gems are installed into `vendor/bundle` (see `.bundle/config`).

```sh
/opt/homebrew/opt/ruby/bin/bundle install
make serve     # build, serve at http://localhost:4000 and rebuild on changes
make build     # one-off build into _site/
```

## Deploying

```sh
make push
```

This builds the site and runs `push.sh`, which uses `rsync` to copy `_site/` to oban (`satnam@oban.raintown.org:public_html`). It needs SSH access to oban as `satnam`. The sync deliberately does not use `--delete`, so pages that exist only on the server are left alone. It also means that renaming or removing a page here leaves the old copy on the server until you delete it there by hand.

## Code review

Pull requests to `main` are reviewed automatically by Claude via the GitHub Action in `.github/workflows/claude-code-review.yml`. It needs the `CLAUDE_CODE_OAUTH_TOKEN` repository secret and the Claude GitHub App installed on the repository.

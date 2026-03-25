# cv

My CV as code, built with [RenderCV](https://github.com/rendercv/rendercv) and Nix.

## Usage

Render the CV to `output/daniel-salazar.pdf`:

```bash
nix run
```

## Development

Enter the dev shell (requires [direnv](https://direnv.net)):

```bash
direnv allow
```

Or manually:

```bash
nix develop
```

Then render with:

```bash
cv
```

## Editing

CV content lives in `cv.yaml`. Edit it and re-run to regenerate.

## Skills

Update Claude Code skills and lock file:

```bash
cv-update-skills
```

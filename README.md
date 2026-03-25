# cv

My CV as code, built with [RenderCV](https://rendercv.com) and Nix.

## Usage

Render the CV to `rendercv_output/cv.pdf`:

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

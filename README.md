# RenderCV Resume

This repo stores my resume as a single RenderCV YAML file and builds a PDF from it.

## Prerequisites

- Python (managed via `uv`)
- RenderCV (installed via `uv sync` from this repo’s dependencies)

## Setup

Install dependencies:

```bash
uv sync
```

Build the resume:

```bash
.\scripts\render.sh
```

Notes:

- `--watch` watches the YAML file and re-renders on change.
- Args can override the YAML property values, which is applied within the `render.sh` script

Layout:

- `resume.yaml` - Source for resume generation
- `output/` - Generated output

Workflow:

1. Edit `resume.yaml`
2. Run the render shell script

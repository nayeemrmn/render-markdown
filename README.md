# render-markdown

A [Makefile](Makefile) example for rendering markdown to HTML and PDF.

## System Dependencies

The following binaries must be in your `PATH`:

- [pandoc](https://pandoc.org/)
- [wkhtmltopdf](https://wkhtmltopdf.org/) (only for pdf)

## Usage

Place a markdown file in `src` and run `make`. The HTML and PDF renders will be
written into `target`.

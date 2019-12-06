<!-- Pandoc markdown -->

# Title

This is a paragraph.

## Subtitle 1

This is another paragraph.

## Subtitle 2

### Maths

Inline: $e=mc^2$

Block:
$$
(x + y)(x - y) = x^2 + x \times y - x \times y - y^2
               = x^2 - y^2
$$

### Code

Inline: `printf("Hello, world!");`

Block:
```Makefile
# Tools
PANDOC = pandoc
PANDOC_FLAGS = --self-contained -c github-markdown-css/github-markdown.css
WKHTMLTOPDF = wkhtmltopdf
WKHTMLTOPDF_FLAGS =

# Files and Directories
SRC = src
TARGET = target
ALL_MD = $(shell find $(SRC) -name "*.md" -type f)
ALL_HTML = $(ALL_MD:$(SRC)/%.md=$(TARGET)/%.html)
ALL_PDF = $(ALL_MD:$(SRC)/%.md=$(TARGET)/%.pdf)

.PHONY: all clean

all: $(ALL_HTML) $(ALL_PDF)

$(TARGET)/%.html: $(SRC)/%.md
	mkdir -p $$(dirname $@)
	$(PANDOC) $(PANDOC_FLAGS) -o $@ $^

$(TARGET)/%.pdf: $(TARGET)/%.html
	$(WKHTMLTOPDF) $(WKHTMLTOPDF_FLAGS) $^ $@

clean:
	rm -rf $(TARGET)
```

### Bullets

- Hello
- Hello
    - Hi
    - Hi

1. Hello
2. Hello
3. Hi
4. Hi

### Links

Anchor: [Maths](#maths)

External: [https://www.gnu.org](https://www.gnu.org)

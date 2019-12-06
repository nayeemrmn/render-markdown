# Tools
PANDOC = pandoc
# TODO(nayeemrmn): Add `--mathml` when Chromium supports it.
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

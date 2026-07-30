BUILD_DIR = build
ENGINE = pdflatex
LATEXMK_FLAGS = -pdf -pdflatex="$(ENGINE)" -cd
SUBJECTS = c-lang

.PHONY: all clean $(SUBJECTS)

all: $(SUBJECTS)

$(SUBJECTS): %:
	@mkdir -p $(BUILD_DIR)/$*
	@find $* -type d -exec mkdir -p $(BUILD_DIR)/{} \;
	@latexmk $(LATEXMK_FLAGS) -outdir=../$(BUILD_DIR)/$* $*/main.tex
	@cp $(BUILD_DIR)/$*/main.pdf $*.pdf

clean:
	@rm -rf $(BUILD_DIR)

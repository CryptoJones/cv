LATEX  = pdflatex
FLAGS  = -interaction=nonstopmode
TARGET = cv

# The historical filename, kept so the README link and any external
# references to the old CV keep resolving after the LaTeX rewrite.
LEGACY = Clark, Aaron K. - CV.pdf

all: $(TARGET).pdf

# Two passes so fancyhdr page totals and hyperref anchors settle.
$(TARGET).pdf: $(TARGET).tex resume.cls
	$(LATEX) $(FLAGS) $(TARGET).tex
	$(LATEX) $(FLAGS) $(TARGET).tex
	cp -f $(TARGET).pdf "$(LEGACY)"

clean:
	rm -f $(TARGET).aux $(TARGET).log $(TARGET).out $(TARGET).fls \
	      $(TARGET).fdb_latexmk *.synctex.gz

distclean: clean
	rm -f $(TARGET).pdf

.PHONY: all clean distclean

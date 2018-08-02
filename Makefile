nothing:

all: notebook.pdf

notebook.pdf: notebook.md
	pandoc $^ -o $@

notebook.md: notebook.Rmd
	Rscript -e "library(knitr); knit('$^')"

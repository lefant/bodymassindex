all: index.html

index.html: index.Rmd
	Rscript -e "slidify::slidify('index.Rmd')"

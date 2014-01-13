build(){
	pdflatex -interaction=nonstopmode $1
	bibtex $2
	pdflatex -interaction=nonstopmode $1
	pdflatex -interaction=nonstopmode $1
}

# build once by default
build $1 $2

# watch for alterations
while inotifywait $1 $2; do
  build $1 $2
done

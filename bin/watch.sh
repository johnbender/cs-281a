build(){
	pdflatex -interaction=nonstopmode $1
  if ! [ -z "$2" ]; then
	  bibtex $2
	  pdflatex -interaction=nonstopmode $1
	  pdflatex -interaction=nonstopmode $1
  fi
}

# build once by default
build $1 $2

# watch for alterations
while inotifywait $1 $2; do
  build $1 $2
done

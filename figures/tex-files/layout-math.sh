filetoclipboard() {
    osascript \
        -e 'on run args' \
        -e 'set the clipboard to POSIX file (first item of args)' \
        -e end \
        "$@"
}

FILENAME=$PWD/$2

cd $(mktemp -d)
MATH=$1

cat <<EOF > math.tex
\documentclass{standalone}[crop=true]
\usepackage{amsmath}
\begin{document}
\$$MATH\$
\end{document}
EOF

pdflatex math.tex &> /dev/null
echo "Created math.pdf"

# If no second argument, save the file
if [ -z "$2" ]; then
  filetoclipboard $(realpath math.pdf)
else
  cp math.pdf "$FILENAME"
fi

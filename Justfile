check:
	java -jar /opt/homebrew/Cellar/textidote/0.8.3/libexec/textidote.jar --output html --check en_UK --dict words.dict report.tex > out.html 
	exit 0

dev:
	git ls-files | entr -c -s 'haxe -v compile.hxml && open -a "Google Chrome" http://localhost:8000'

build:
	haxe -v compile.hxml

build-watch:
	git ls-files | entr -c -s 'haxe compile.hxml && echo "compiled on `date`"'

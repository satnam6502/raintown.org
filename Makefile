.PHONY: build serve push

build:
	bundler exec jekyll build

serve:
	bundler exec jekyll serve --watch

push:	build
	./push.sh

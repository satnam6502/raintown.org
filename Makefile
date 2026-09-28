# Jekyll 4 needs Ruby >= 2.7. macOS's system Ruby is 2.6, so use Homebrew's
# Ruby when it is installed (brew install ruby).
BUNDLE := $(or $(wildcard /opt/homebrew/opt/ruby/bin/bundle),bundle)

.PHONY: build serve push

build:
	$(BUNDLE) exec jekyll build

serve:
	$(BUNDLE) exec jekyll serve --watch

push:	build
	./push.sh

.PHONY: docs
docs:
	helm-docs -c ./charts/otf -t ../../README.md.gotmpl -o ../../README.md

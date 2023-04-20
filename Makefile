.PHONY: docs
docs:
	helm-docs -c ./charts/otf -t ../../README.md.gotmpl -o ../../README.md

# bump patch in chart version
.PHONY: bump
bump:
	yq -i '.version |= (split(".") | .[-1] |= ((. tag = "!!int") + 1) | join("."))' ./charts/otf/Chart.yaml

.PHONY: all
all: deploy test

.PHONY: deploy-otf
deploy-otf:
	helm upgrade -i --create-namespace -n otf-test -f ./charts/otf/test-values.yaml otf ./charts/otf --wait

.PHONY: test-otf
test-otf: deploy-otf
	helm test -n otf-test otf

.PHONY: bump
bump:
	yq -i '.version |= (split(".") | .[-1] |= ((. tag = "!!int") + 1) | join("."))' ./charts/${CHART}/Chart.yaml

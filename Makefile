.PHONY: all
all: deploy test

.PHONY: deploy
deploy:
	helm upgrade -i --create-namespace -n otf-test -f ./charts/otf/test-values.yaml otf ./charts/otf --wait

.PHONY: test
test: lint deploy
	helm test -n otf-test otf

.PHONY: bump
bump:
	yq -i '.version |= (split(".") | .[-1] |= ((. tag = "!!int") + 1) | join("."))' ./charts/${CHART}/Chart.yaml

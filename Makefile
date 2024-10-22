.PHONY: all
all: deploy test

.PHONY: deploy-otfd
deploy-otfd:
	helm upgrade -i --create-namespace -n otfd-test -f ./charts/otfd/test-values.yaml otfd ./charts/otfd --wait

.PHONY: test-otfd
test-otfd: deploy-otfd
	helm test -n otfd-test otfd

.PHONY: bump
bump:
	yq -i '.version |= (split(".") | .[-1] |= ((. tag = "!!int") + 1) | join("."))' ./charts/${CHART}/Chart.yaml

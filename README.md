# otf-charts

Helm charts for [OTF](https://github.com/leg100/otf).

## Usage

Add the helm repository:

```bash
helm repo add otf https://leg100.github.io/otf-charts
```

Then follow instructions for installing the relevant chart:

* [otfd](./charts/otfd/README.md)
* [otf-agent](./charts/otf-agent/README.md)

## Development

### Bumping the chart version

If you make any changes to a chart you need to bump its chart version. You can either do that by hand in `Chart.yaml`, or using `make`:

```bash
# requires `yq`
#
# To update the otfd chart version
CHART=otfd make bump
#
# To update the otf-agent chart version
CHART=otf-agent make bump
```

### Generating README.md's

Each chart's `README.md` is generated from a template, `README.md.gotmpl` in the same directory, using [helm-docs](https://github.com/norwoodj/helm-docs). Therefore any changes must be made to `README.md.gotmpl` and not `README.md`. To update all templated README.md's, run the following from the root of the repo:

```bash
helm-docs
```
Any changes to the version or to the `values.yaml` file are automatically reflected in the generated `README.md`. 

### Linting

To lint the charts to check for any errors run `helm lint`:

```bash
# lint the otfd chart
helm lint ./charts/otfd
# lint the otf-agent chart
helm lint ./charts/otf-agent
```

### Deploy and test otfd chart

To deploy the `./charts/otfd` chart to a cluster to the namespace `otfd-test` with pre-configured defaults along with PostgreSQL:

```bash
make deploy-otfd
```

To test the chart (assumes release is named `otfd`):

```bash
make test-otfd
```

And to lint, deploy, and then test the chart:

```bash
make all
```

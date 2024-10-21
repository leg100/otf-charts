# otf-charts

Helm charts for [OTF](https://github.com/leg100/otf).

## Usage

Add the helm repository:

```bash
helm repo add otf https://leg100.github.io/otf-charts
```

Then follow instructions for installing the relevant chart:

* [otf](./charts/otf/README.md)
* [otf-agent](./charts/otf-agent/README.md)

## Development

If you make any changes to the chart you need to bump its version. You can either do that by hand in `Chart.yaml`, or using `make`:

```bash
# requires `yq`
make bump
```

To generate the `README.md` from its template, `README.md.gotmpl`:

```bash
# requires `helm-docs`
make readme
```

Any changes to the version or to the `values.yaml` file are automatically reflected in the generated `README.md`.

To lint the chart:

```bash
make lint
```

To deploy the chart to a cluster to the namespace `otf-test` with pre-configured defaults along with PostgreSQL:

```bash
make deploy
```

To test the chart (assumes release is named `otf`):

```bash
make test
```

And to lint, deploy, and then test the chart:

```bash
make all
```

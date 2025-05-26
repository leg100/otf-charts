# otf-charts

Helm charts for [OTF](https://github.com/leg100/otf).

NOTE: this repo only serves as a helm repository; any changes to charts are made in the [main repo](https://github.com/leg100/otf) before being automatically replicated to this repo.

NOTE: raise any issues in the [main repo](https://github.com/leg100/otf).

## Usage

Add the helm repository:

```bash
helm repo add otf https://leg100.github.io/otf-charts
```

Then follow instructions for installing the relevant chart:

* [otfd](./charts/otfd/README.md)
* [otf-agent](./charts/otf-agent/README.md)

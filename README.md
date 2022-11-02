# Helm charts for otf

Helm charts repository for [otf](https://github.com/leg100/otf).

Currently hosts one helm chart, which deploys `otfd` server(s) onto a kubernetes cluster.

## Instructions

```bash
helm repo add otf https://leg100.github.io/otf-charts
helm upgrade --install otf otf/otf
```

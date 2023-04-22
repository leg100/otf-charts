# otf-charts

![Version: 0.2.6](https://img.shields.io/badge/Version-0.2.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.36](https://img.shields.io/badge/AppVersion-0.0.36-informational?style=flat-square)

[OTF](https://github.com/leg100/otf) Helm charts.

## Instructions

Add the helm repository:

```bash
helm repo add otf https://leg100.github.io/otf-charts
```

To install the chart you need at the very minimum:

* A PostgreSQL database up and running
* A [secret string](https://docs.otf.ninja/config/flags#-secret)
* Either setup an [identity provider](https://docs.otf.ninja/auth#identity-providers) or set a [site admin token](https://docs.otf.ninja/auth#site-admin).

For example, if a PostgreSQL server is accessible via the hostname `postgres`, has a database named `otf` accessible to a user with username `postgres` and password `postgres`:

```
helm install otf otf/otf --set secret=my-secret --set site-token=my-token --set database=postgres://postgres:postgres@postgres/otf
```

Alternatively, you can use the [test-values.yaml](./charts/otf/test-values.yaml) from this repo:

```
helm install otf otf/otf -f ./charts/otf/test-values.yaml
```

This will:

* Install PostgreSQL on the cluster
* Set secret string
* Set a site token

Note: you should only use this for testing purposes.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| caCerts | bool | `false` | Mount CA certificates - if true then the otfd container will expect to find a configmap named 'ssl-certs' with a key named 'ca.pem', which should contain CA certificates. The CA certificates are then made available to otfd and to terraform. Allows terraform to communicate with API endpoints that use custom CA certs. |
| database | string | `""` | Postgres connection string |
| databasePasswordFromSecret | object | `nil` | Source database password from a secret |
| databaseUsernameFromSecret | object | `nil` | Source database username from a secret |
| fullnameOverride | string | `""` |  |
| github.clientID | string | `""` | Github OAuth client ID. See [docs](https://docs.otf.ninja/config/flags/#-github-client-id). |
| github.clientSecret | string | `""` | Github OAuth client secret. See [docs](https://docs.otf.ninja/config/flags/#-github-client-secret). |
| gitlab.clientID | string | `""` | Gitlab OAuth client ID. See [docs](https://docs.otf.ninja/config/flags/#-gitlab-client-id). |
| gitlab.clientSecret | string | `""` | Gitlab OAuth client secret. See [docs](https://docs.otf.ninja/config/flags/#-gitlab-client-secret). |
| google.audience | string | `""` | The Google JWT audience claim for validation. Validation is skipped if empty. See [docs](https://docs.otf.ninja/config/flags/#-google-jwt-audience). |
| hostname | string | `""` | Set client-accessible hostname. See [docs](https://docs.otf.ninja/config/flags/#-hostname). |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"leg100/otfd"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"Prefix"` |  |
| ingress.tls | list | `[]` |  |
| logging.format | string | `"default"` | Logging format: default, text, or json. See [docs](https://docs.otf.ninja/config/flags/#-log-format) |
| logging.http | bool | `false` | Log http requests. |
| logging.verbosity | int | `0` | Logging verbosity, the higher the number the more verbose the logs. See [docs](https://docs.otf.ninja/config/flags/#-v). |
| maxConfigSize | string | `""` | Max config upload size in bytes. See [docs](https://docs.otf.ninja/config/flags/#-max-config-size). |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` | Add annotations to otfd pod |
| podSecurityContext | object | `{}` | Set security context for otfd pod |
| postgres.enabled | bool | `false` | Install postgres chart dependency. |
| proxy | string | `nil` | Specify an https proxy for outbound connections. |
| replicaCount | int | `1` | Number of otfd nodes in cluster |
| resources | object | `{}` |  |
| sandbox | bool | `false` | Enable sandboxing of terraform apply - note, this will run pods as privileged |
| secret | string | `""` | Secret string for signing urls - required. |
| service.port | int | `80` | Service port for otf |
| service.type | string | `"ClusterIP"` | Service type for otf |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| serviceMonitor | object | `{"enabled":false}` | Collect prometheus metrics |
| siteToken | string | `""` | Site admin token - empty string disables the site admin account. See [docs](https://docs.otf.ninja/config/flags/#-site-token). |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)

## Development

If you make any changes to the chart you need to bump its version. You can either do that by hand in `Chart.yaml`, or using `make`:

```bash
# requires `yq`
make bump
```

Then re-generate the `README.md` from its template, `README.md.gotmpl`:

```bash
# requires `helm-docs`
make readme
```

Any changes to the version or to the `values.yaml` file are automatically reflected in the generated `README.md`.

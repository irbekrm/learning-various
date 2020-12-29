# Notes

To deploy (locally, on `kind`) with `kubectl` using a generated manifest:

- `istioctl manifest generate > manifest.yaml`

Because `kind` won't by default support third party tokens

- replace `third-party-jwt` with `first-party-jwt`

- remove the `istio-token` volume

- `kubectl apply -f manifest.yaml`

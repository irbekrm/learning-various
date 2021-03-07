# vault

## Deploy (in dev mode)
### Default

`./scripts/deploy.sh`

### With Venafi Vault plugin

To deploy with the [Venafi plugin](https://www.vaultproject.io/docs/secrets/venafi)

`export MODE=venafi_plugin`

`./scripts/deploy.sh`


Creates:
* A deployment with 1 replica running Vault in dev mode
* A NodePort service exposing Vault on port 8200

## Delete

### Default

`./scripts/delete.sh`

### With Venafi Vault plugin

`export MODE=venafi_plugin`

`./scripts/deploy.sh`
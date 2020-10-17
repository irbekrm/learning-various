# kind

## Pass a custom config to kind
` kind create cluster --config CONFIG_PATH`

## Exec to kind node
`docker exec -it kind-control-plane /bin/bash` // `docker exec -it <container-id> /bin/bash` would also work
# miscellaneous

# Port forwarding

`kubectl port-forward kind/name LOCAL_PORT:CONTAINER_PORT`

`kind` can be `pods`, `service`, `deployment`, `replicaset` etc and the second port will always be the container port.

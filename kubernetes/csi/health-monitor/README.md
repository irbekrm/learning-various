# The examples are based on https://github.com/kubernetes-csi/csi-test/tree/master/mock#mock-csi-driver-example and https://github.com/kubernetes-csi/external-health-monitor/tree/master/deploy/kubernetes

Create RBAC (probably could be given less permissions)
`kubectl apply -f yamls/rbac.yaml`

A pod with:
- CSI mock driver
- CSI external health monitor controller
- CSI external health monitor agent
- CSI external provisioner
- CSI node driver registrar
- sidecar for testing/debugging
A CSIDriver object
A StorageClass object

`kubectl apply -f yamls/deployment.yaml`

Create a PVC
`kubectl apply -f yamls/pvc.yaml`

Create a pod that mounts the PVC
`kubectl apply -f yamls/pod.yaml`

## Testing the health monitor with mock driver hooks
Create RBAC (probably could be given less permissions)
`kubectl apply -f yamls/rbac.yaml`

Create a configmap that contains hook definitions
`kubectl apply -f yamls/hooks.yaml`

A pod with:
- CSI mock driver
- CSI external health monitor controller
- CSI external health monitor agent
- CSI external provisioner
- CSI node driver registrar
- sidecar for testing/debugging
A CSIDriver object
A StorageClass object

`kubectl apply -f yamls/deployment-with-hooks.yaml`
This defines hooks that will be applied to the mock drive. Output of `console.log`s will appear in the logs of the mock driver container.
This particular hook will return INTERNAL grpc error code after the first 30 calls to NodeGetVolumeStats. This can be seen in the logs of `csi-external-health-monitor-agent` sidecar (also prints a message to the mock driver container's stdout)

Create a PVC
`kubectl apply -f yamls/pvc.yaml`

Create a pod that mounts the PVC
`kubectl apply -f yamls/pod.yaml`

* Note: it appears that it takes some time for the mock volume to be created, so it is likely that just after creating a pod with a PV there will be error logs in the health monitor agent's logs for  a while such as ``` 8 connection.go:186] GRPC error: rpc error: code = NotFound desc = volume "4" doest not exist on the specified path "/var/lib/kubelet/pods/61f23d66-fce7-46c6-8463-da72de1c7f52/volumes/kubernetes.io~csi/pvc-2c1d4943-659f-4bec-998b-06909dc2ef5e/mount"```



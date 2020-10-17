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


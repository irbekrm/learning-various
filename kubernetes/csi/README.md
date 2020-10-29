# CSI 

## CSI Mock driver

### Testing with mock driver hooks

A list of Javascript hooks can be passed to mock driver via a CLI flag.
There is a number of places in mock driver code where a hook can be run- https://github.com/kubernetes-csi/csi-test/blob/master/mock/service/service.go#L42

This can be used to, for example, make the mock driver return a gRPC error code when a particular RPC method is called.

The hooks have been implemented using `github.com/robertkrimen/otto/otto` package https://github.com/robertkrimen/otto

More info:
- [CSI mock driver docs](https://github.com/kubernetes-csi/csi-test/blob/master/hooks-howto.md)
- [The original PR](https://github.com/kubernetes-csi/csi-test/pull/251)
- [Example usage in a kubernetes e2e test](https://github.com/kubernetes/kubernetes/commit/a4f080861f3586aae0f235e914526807eeea5cfa)
- [Example usage in this repo](https://github.com/irbekrm/learning-various/tree/master/kubernetes/csi/health-monitor#testing-the-health-monitor-with-mock-driver-hooks)

[docs](https://kubernetes.io/docs/concepts/workloads/pods/ephemeral-containers/) and [full docs](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#ephemeralcontainer-v1-core)

Example usage (with `kubectl` v1.19.2)
* Make sure k8s EphemeralContainers [feature gate](https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/) is enabled
* Potentially enable [process namespace sharing](https://kubernetes.io/docs/tasks/configure-pod-container/share-process-namespace/) for the pod to be debugged
* `kubectl alpha debug [MY_POD] -it --image=[DEBUG_IMAGE] -- bash

From the docs it appears like volume mounting _might_ be possible if filesystem sharing is needed.

After exiting the ephemeral container appears to still exist (Appears in the pod yaml)
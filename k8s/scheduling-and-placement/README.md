# Gratitude App Scheduling and Placement Lab

This folder contains practical Kubernetes examples for:
- Resource availability (CPU/Memory)
- Node selector
- Node affinity
- Pod affinity / anti-affinity
- Taints & tolerations
- Topology spread constraints
- Priority & preemption

All workloads run in a dedicated namespace: `gratitudeapp-scheduling-lab`.

## Files

- `01-resource-availability.yml`
- `02-node-selector.yml`
- `03-node-affinity.yml`
- `04-pod-affinity-anti-affinity.yml`
- `05-taints-tolerations.yml`
- `06-topology-spread-constraints.yml`
- `07-priority-preemption.yml`

## Prerequisites

1. A running Kubernetes cluster (`kubectl` context set correctly).
2. At least 2 worker nodes recommended.
3. For zone-based spreading, multi-AZ nodes are required.

Check nodes:

```bash
kubectl get nodes -o wide
kubectl get nodes --show-labels
```

## One-time node preparation for this lab

Pick one or more nodes and label them:

```bash
kubectl label nodes <node-name> workload=gratitudeapp
```

If you want taints/tolerations behavior, taint one node:

```bash
kubectl taint nodes <node-name> dedicated=gratitudeapp:NoSchedule
```

To remove later:

```bash
kubectl taint nodes <node-name> dedicated=gratitudeapp:NoSchedule-
kubectl label nodes <node-name> workload-
```

## Apply order

```bash
kubectl apply -f 01-resource-availability.yml
kubectl apply -f 02-node-selector.yml
kubectl apply -f 03-node-affinity.yml
kubectl apply -f 04-pod-affinity-anti-affinity.yml
kubectl apply -f 05-taints-tolerations.yml
kubectl apply -f 06-topology-spread-constraints.yml
kubectl apply -f 07-priority-preemption.yml
```

## Verify scheduling decisions

```bash
kubectl get pods -n gratitudeapp-scheduling-lab -o wide
kubectl describe pod <pod-name> -n gratitudeapp-scheduling-lab
```

What to check:
- Resource availability: quotas and default limits are applied.
- Node selector: pod lands only on node(s) with `workload=gratitudeapp`.
- Node affinity: required + preferred node placement behavior.
- Pod affinity: `server-affinity-demo` co-locates with `api-gateway-affinity-demo`.
- Pod anti-affinity: scheduler tries to avoid same-node placement for `tier=server` pods.
- Tolerations: workload can run on tainted node.
- Topology spread: pods distributed across zones/hosts with skew constraints.
- Priority/preemption: high-priority pods can preempt lower-priority pods under pressure.

## Cleanup

```bash
kubectl delete -f 07-priority-preemption.yml
kubectl delete -f 06-topology-spread-constraints.yml
kubectl delete -f 05-taints-tolerations.yml
kubectl delete -f 04-pod-affinity-anti-affinity.yml
kubectl delete -f 03-node-affinity.yml
kubectl delete -f 02-node-selector.yml
kubectl delete -f 01-resource-availability.yml
```


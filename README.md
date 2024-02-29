# Appwrite K8S files

| Status | 🏗️ Semi-ready |
|--------|----------------|

## The Idea

Appwrite uses microservice-based architecture as their deployment strategy.

All the Appwrite containers are completely stateless and runner-agnostic, which makes
it straightforward to deploy Appwrite into any cluster and then horizontally scale it as needed.

Deploying HA Appwrite cluster is recommended to be done using Docker Swarm as can be seen [here](https://github.com/byawitz/scaling-appwrite).

This repo is aiming to show how to deploy Appwrite into a Kubernetes cluster while keeping the OpenRuntime in a Docker Swarm cluster, like so.

![Diagram](./assets/appwrite-k8s.drawio.svg)

> - All the Appwrite images, including the databases, are being deployed into a k8s cluster
> - The Open runtime is being deployed inside a Docker Compose environment or a Docker compose cluster.
> - Appwrite files are being saved into a S3 bucket available for both clusters.

### Few notes

1. The K8s cluster assumes you're using [Ingress-Nginx](https://kubernetes.github.io/ingress-nginx/) as your ingress provider.
2. You must use an external storage driver to give both the Docker Swarm and the Kubernetes cluster access to it.
3. For the value [`_APP_EXECUTOR_HOST`](./declarative/config/env.yml#L74) you should use a publicly available address either IP or domain, it will probably be best to use domain-name.

### How to approach

In general, Docker Swarm is still the recommended approach, and it will be suitable for 90%+ of the cases.

For percentile 95 a thin k8s client could be sufficient, the recommendation is to check something like [k3s](https://k3s.io/) by rancher.

## Deployments

You'll find two types of ways to deploy Appwrite in a k8s environments.

| Type                         | Status       |
|------------------------------|--------------|
| [Declarative](./declarative) | β - Workable |
| [Helm](./helm)               | WIP          |

## Declarative

Run the following commands to deploy Appwrite in a declarative way

```shell
git clone https://github.com/byawitz/appwrite-k8s.git
kubectl apply -R -f ./declarative
```

### Notes

<details>
<summary>Secrets</summary>
Remember to convert all your secrets to base64, for example

```shell
echo -n "your-secret-key" | base64 -i -
```

Or by deploying them one by one.

```shell
kubectl create secret generic appwrite-secrets --from-literal=_APP_OPENSSL_KEY_V1=your-secret-key
```

</details>
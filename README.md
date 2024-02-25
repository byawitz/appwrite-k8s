# Appwrite K8S files

--- NOT READY ---

You'll find two types of ways to deploy Appwrite in a k8s environments.

1. [Declarative](./declarative)
2. [Helm](./helm)

## Declarative

Run the following commands to deploy Appwrite in a declarative way

```shell
git clone https://github.com/byawitz/appwrite-k8s.git
kubectl apply -R -f ./declarative
```

## Helm

WIP

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
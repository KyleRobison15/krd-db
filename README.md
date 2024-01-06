# Welcome to KRD-DB!

This repository contains the database configurations for KRDev applications.

## KRDev Data Stores

KRDev applications follow a microservice architecture. As such, I have chosen to deploy a single database instance to the krd-general K8s cluster. Within this single instance, I can create isolated schemas that are exposed only to the "owner" microservice.

- NOTE: Database secrets are maintained in a separate, private repository.

## Notes

- spec: This section contains the specifications for the Kubernetes resource, such as the type of Service or the number of replicas for the Deployment.
- selector: This section specifies the label selector for the Service or Deployment. In this case, the Service will match pods with the app=krd-mysql label and the Deployment will select pods with the app=krd-mysql label.
- type: This section specifies the type of Service being created. In this case, the type is NodePort, which exposes the Service on a static port on each node in the cluster.
- ports: This section specifies the ports that the Service will listen on. In this case, the Service will listen on port 3306 and forward traffic to port 3306 on the pods.
- volumes: This section specifies the volumes that will be used by the container. In this case, there is one volume named krd-mysql-pv, which is created by a PersistentVolume.
- containers: This section specifies the containers that will be run by the Deployment. In this case, there is one container named krd-mysql, which is using the mysql:latest Docker image.
- env: This section specifies the environment variables that will be set for the container. In this case, there are four environment variables being set using secrets created from Kubernetes Secret resources. This was set earlier.
- volumeMounts: This section specifies the mount points for the volumes that will be used by the container. In this case, there is one volume named mysql-pv, which is mounted to the container’s /var/lib/mysql directory.
- containerPort: This section specifies the port that the container will listen on. In this case, the container will listen on port 3306.

## Kubernetes Secrets - The Problem

The problem with K8s secrets is that they really aren't encrypted and the manifests must be saved in a Git repository.. so anyone with access to the cluster or the git repo can easily view the secrets by just viewing the manifests. The more secrets and the more workloads we have, the problem intensifies and we get "secret sprawl" where sensitive information can end up all over the place. This is a BIG problem. And this is why we need to implement some kind of secrets manager to encrypt and manage sensitive information in our production environment. Currently, secrets are held in a private repository that only I can access. But this is a very low level security implementation.

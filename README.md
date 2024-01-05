# Welcome to KRD-DB!

This repository contains the database configurations for KRDev applications.

## Kubernetes Manifests for KRDev Data Stores

KRDev applications are deployed to a single node Kubernetes cluster. To expose my database stores to other KRDev applications, I have configured different Kubernetes manifests for each data store instance.

### deployment.yaml

### service.yaml

### persistent-volume.yaml

### persistent-volume-claim.yaml

## Kubernetes Secrets

Secrets, like keys, passwords, tokens, and other configuration values, must be stored correctly. If my Kubernetes cluster is compromised, the Secrets must remain secure. To follow best practices for storing sensitive information on Kubernetes, I have created secrets for each data store instance using several techniques to encrypt them and safegaurd them from potential malevelolent exploitation.

Here are some techniques to help us keep Kubernetes Secrets safe:

1. Enable encryption at rest

2. Configure RBAC rules

3. Encrypt etcd data

4. Use a centralized Secrets store for easy management

### mysql-secret

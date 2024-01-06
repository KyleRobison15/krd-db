# Welcome to KRD-DB!

This repository contains the database configurations for KRDev applications.

## KRDev Data Stores

KRDev applications follow a microservice architecture. As such, I have chosen to deploy a single database instance to the krd-general K8s cluster. Within this single instance, I can create isolated schemas that are exposed only to the "owner" microservice.

- NOTE: Database secrets are maintained in a separate, private repository.

## Kubernetes Secrets - The Problem

The problem with K8s secrets is that they really aren't encrypted and the manifests must be saved in a Git repository.. so anyone with access to the cluster or the git repo can easily view the secrets by just viewing the manifests. The more secrets and the more workloads we have, the problem intensifies and we get "secret sprawl" where sensitive information can end up all over the place. This is a BIG problem. And this is why we need to implement some kind of secrets manager to encrypt and manage sensitive information in our production environment. Currently, secrets are held in a private repository that only I can access. But this is a very low level security implementation.

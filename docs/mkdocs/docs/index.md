# Welcome to a Sample CIAM 

This repo contains a starting representation of a CIAM implementation of PingIdentity Software. This stack is designed to be deployed into a Kubernetes cluster, using Helm.

It uses the Ping DevOps chart [Ping DevOps Helm](https://helm.pingidentity.com) and layers over a CIAM-focused configuration.

It contains the following products:

| Product Name | Purpose |
| --- | --- |
| PingDirectory | User Credentials / Profiles - SCIM - Consent API |
| PingFederate | Authentication Authority - Token Provider |
| PingOne MFA | Strong Authentication |

## Pre-Requisites

In order to deply this chart, the following is required:

* A Kubernetes cluster
* Helm v3 +
* A PingOne Account (See [My Ping Integration](./sso-myping))

## Helm Deployment

This repo hosts the Helm chart that is used to deploy and configure this stack

* Install Helm (Homebrew)

    ```
    brew install helm
    ```

* Add Helm repo

    ```
    helm repo add cprice-ping https://cprice-ping.github.io/helm-charts/
    ```

* Update repo

    ```
    helm repo update
    ```

* Install chart

    ```
    helm install {releaseName} cprice-ping/ping-sample-ciam -values values.yaml
    ```

See [Sample Values](./values.md) for a basic structure for the `values.yaml` file

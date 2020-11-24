# Sample CIAM stack

This repo provides a sample CIAM configuration for PingDirectory \ PingFederate \ PingDataSync \ PingOne MFA

![Sample CIAM](sampleciam.png)

---

## Pre-Requisites

The stack will stand up without any pre-requisites, but will require manual configuration for MFA to work.

The Solution can be pre-configured for Admin SSO and PingOne MFA with details for the below injected into the configuration:

* My Ping Console:
  * [Configure](/docs/sso-myping.md)
* PingOne Ping Platform App
* PingOne MFA Native App

## Deployment

This repo contains configuration sets for deployment:

* [Kubernetes](deployment/Kubernetes)
  * [Helm](deployment/Kubernetes/helm)
  * [Helm Chart](https://cprice-ping.github.io/Sample-CIAM)

### Deployment Configuration

The bulk of the configuration is performed by a Postman API Collection:  
[Sample CIAM - Postman Collection](https://www.getpostman.com/collections/620475bf1cb1f223f78a)

## Solution Configuration

| Product | Console URL |
| ----- | ----- |
| My Ping Console | `https://console.pingone.com/index.html?env={{Your Admin EnvId}}#/home/`

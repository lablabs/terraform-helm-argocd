# ArgoCD Terraform module

[![labyrinth labs logo](ll-logo.png)](https://lablabs.io/)

We help companies build, run, deploy and scale software and infrastructure by embracing the right technologies and principles. Check out our website at https://lablabs.io/

---

![Terraform validation](https://github.com/lablabs/terraform-aws-eks-node-problem-detector/workflows/Terraform%20validation/badge.svg?branch=main)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-success?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## Description

A terraform module to deploy the ArgoCD on Amazon EKS cluster.

## Related Projects

Check out these related projects.

- [terraform-aws-eks-external-dns](https://github.com/lablabs/terraform-aws-eks-external-dns)
- [terraform-aws-eks-calico](https://github.com/lablabs/terraform-aws-eks-calico)
- [terraform-aws-eks-alb-ingress](https://github.com/lablabs/terraform-aws-eks-alb-ingress)
- [terraform-aws-eks-metrics-server](https://github.com/lablabs/terraform-aws-eks-metrics-server)
- [terraform-aws-eks-prometheus-node-exporter](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter)
- [terraform-aws-eks-kube-state-metrics](https://github.com/lablabs/terraform-aws-eks-kube-state-metrics)
- [terraform-aws-eks-node-problem-detector](https://github.com/lablabs/terraform-aws-eks-node-problem-detector)


## Examples

See [Basic example](examples/basic/README.md) for further information.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| helm | >= 1.0 |
| kubernetes | >= 2.4 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [kubernetes_manifest](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| argo\_destionation\_server | Destination server for ArgoCD Application | `string` | `"https://kubernetes.default.svc"` | no |
| argo\_info | ArgoCD info manifest parameter | `map` | `{}` | no |
| argo\_project | ArgoCD Application project | `string` | `"default"` | no |
| argo\_sync\_policy | ArgoCD syncPolicy manifest parameter | `map` | `{}` | no |
| enabled | Variable indicating whether deployment is enabled | `bool` | `true` | no |
| helm\_atomic | If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false. | `bool` | `false` | no |
| helm\_chart\_name | Helm chart name to be installed | `string` | `"argo-cd"` | no |
| helm\_chart\_version | Version of the Helm chart | `string` | `"3.17.5"` | no |
| helm\_cleanup\_on\_fail | Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false. | `bool` | `false` | no |
| helm\_create\_namespace | Create the namespace if it does not yet exist | `bool` | `true` | no |
| helm\_release\_name | Helm release name | `string` | `"argocd"` | no |
| helm\_repo\_url | Helm repository | `string` | `"https://argoproj.github.io/argo-helm"` | no |
| helm\_timeout | Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds. | `number` | `300` | no |
| helm\_wait | Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true. | `bool` | `true` | no |
| k8s\_namespace | The K8s namespace in which the ingress-nginx has been created | `string` | `"argo"` | no |
| self\_managed | If set to true, the module will create ArgoCD Application manifest in the cluster and abandon the Helm release | `bool` | `true` | no |
| settings | Additional settings which will be passed to the Helm chart values, see https://artifacthub.io/packages/helm/argo/argo-cd | `map(any)` | `{}` | no |
| values | Additional yaml encoded values which will be passed to the Helm chart. | `string` | `""` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing and reporting issues

Feel free to create an issue in this repository if you have questions, suggestions or feature requests.

### Validation, linters and pull-requests

We want to provide high quality code and modules. For this reason we are using
several [pre-commit hooks](.pre-commit-config.yaml) and
[GitHub Actions workflow](.github/workflows/main.yml). A pull-request to the
master branch will trigger these validations and lints automatically. Please
check your code before you will create pull-requests. See
[pre-commit documentation](https://pre-commit.com/) and
[GitHub Actions documentation](https://docs.github.com/en/actions) for further
details.


## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

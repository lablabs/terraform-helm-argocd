# ArgoCD Terraform module

[![labyrinth labs logo](ll-logo.png)](https://lablabs.io/)

We help companies build, run, deploy and scale software and infrastructure by embracing the right technologies and principles. Check out our website at https://lablabs.io/

---

![Terraform validation](https://github.com/lablabs/terraform-aws-eks-node-problem-detector/workflows/Terraform%20validation/badge.svg?branch=main)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-success?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## Description

A terraform module to deploy the ArgoCD on Amazon EKS cluster.

This module deploys ArgoCD in two different ways:
1. A helm release that is further managed by Helm
2. A helm release along with ArgoCD Application CRD which allows Argo to self-manage itself.

When `self_managed` variable is set to true, ArgoCD application is deployed and you're able to manage ArgoCD from ArgoCD. The helm release has a lifecycle ignore_changes rules set on it's resource, so no further changes are made to the release. It is only used for the initial ArgoCD deployment.

**Important notice**

Changing the `self_managed` variable after ArgoCD was already deployed will result in it's re-creation.

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

## ArgoCD self-managed mode

This module provides an option to deploy in self managed mode. If `self_managed` is set, the module will make an initial deployment of ArgoCD with Helm and then proceed to deploy ArgoCD Application object. The original helm release is ignored in further terraform runs and only the newly deployed, self-managed object is used.

### Potential issues with running terraform plan

When deploying Argo in self-managed mode, Kubernetes terraform provider requires access to Kubernetes cluster API during plan time. This introduces potential issue when you want to deploy the cluster with this addon at the same time, during the same Terraform run.

To overcome this issue, the module deploys the ArgoCD application object using the Helm provider, which does not require API access during plan. If you want to deploy the application using this workaround, you can set the `self_managed_use_helm` variable to `true`.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.4 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 0.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd_application](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.self_managed](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_manifest.self](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [utils_deep_merge_yaml.argo_application_values](https://registry.terraform.io/providers/cloudposse/utils/latest/docs/data-sources/deep_merge_yaml) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_application_enabled"></a> [argo\_application\_enabled](#input\_argo\_application\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_argo_application_namespace"></a> [argo\_application\_namespace](#input\_argo\_application\_namespace) | Namespace where to deploy Argo application | `string` | `"argo"` | no |
| <a name="input_argo_application_use_helm"></a> [argo\_application\_use\_helm](#input\_argo\_application\_use\_helm) | n/a | `bool` | `false` | no |
| <a name="input_argo_application_values"></a> [argo\_application\_values](#input\_argo\_application\_values) | Values to pass to the dummy helm chart installing the ArgoCD application object | `string` | `""` | no |
| <a name="input_argo_destionation_server"></a> [argo\_destionation\_server](#input\_argo\_destionation\_server) | Destination server for ArgoCD Application | `string` | `"https://kubernetes.default.svc"` | no |
| <a name="input_argo_info"></a> [argo\_info](#input\_argo\_info) | ArgoCD info manifest parameter | `list` | <pre>[<br>  {<br>    "name": "terraform",<br>    "value": "true"<br>  }<br>]</pre> | no |
| <a name="input_argo_project"></a> [argo\_project](#input\_argo\_project) | ArgoCD Application project | `string` | `"default"` | no |
| <a name="input_argo_sync_policy"></a> [argo\_sync\_policy](#input\_argo\_sync\_policy) | ArgoCD syncPolicy manifest parameter | `map` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Variable indicating whether deployment is enabled | `bool` | `true` | no |
| <a name="input_helm_atomic"></a> [helm\_atomic](#input\_helm\_atomic) | If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false. | `bool` | `false` | no |
| <a name="input_helm_chart_name"></a> [helm\_chart\_name](#input\_helm\_chart\_name) | Helm chart name to be installed | `string` | `"argo-cd"` | no |
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | Version of the Helm chart | `string` | `"3.17.5"` | no |
| <a name="input_helm_cleanup_on_fail"></a> [helm\_cleanup\_on\_fail](#input\_helm\_cleanup\_on\_fail) | Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false. | `bool` | `false` | no |
| <a name="input_helm_create_namespace"></a> [helm\_create\_namespace](#input\_helm\_create\_namespace) | Create the namespace if it does not yet exist | `bool` | `true` | no |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | Helm release name | `string` | `"argocd"` | no |
| <a name="input_helm_repo_url"></a> [helm\_repo\_url](#input\_helm\_repo\_url) | Helm repository | `string` | `"https://argoproj.github.io/argo-helm"` | no |
| <a name="input_helm_timeout"></a> [helm\_timeout](#input\_helm\_timeout) | Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds. | `number` | `300` | no |
| <a name="input_helm_wait"></a> [helm\_wait](#input\_helm\_wait) | Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true. | `bool` | `true` | no |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | The K8s namespace in which the ingress-nginx has been created | `string` | `"argo"` | no |
| <a name="input_self_managed"></a> [self\_managed](#input\_self\_managed) | If set to true, the module will create ArgoCD Application manifest in the cluster and abandon the Helm release | `bool` | `true` | no |
| <a name="input_self_managed_use_helm"></a> [self\_managed\_use\_helm](#input\_self\_managed\_use\_helm) | If set to true, the ArgoCD Application manifest will be deployed using Kubernetes provider as a Helm release. Otherwise it'll be deployed as a Kubernetes manifest. See Readme for more info | `bool` | `false` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | Additional settings which will be passed to the Helm chart values, see https://artifacthub.io/packages/helm/argo/argo-cd | `map(any)` | `{}` | no |
| <a name="input_values"></a> [values](#input\_values) | Additional yaml encoded values which will be passed to the Helm chart. | `string` | `""` | no |

## Outputs

No outputs.
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

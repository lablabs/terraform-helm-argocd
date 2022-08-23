# argocd

variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled"
}

# Helm

variable "helm_create_namespace" {
  type        = bool
  default     = true
  description = "Create the namespace if it does not yet exist"
}

variable "helm_chart_name" {
  type        = string
  default     = "argo-cd"
  description = "Helm chart name to be installed"
}

variable "helm_chart_version" {
  type        = string
  default     = "3.17.5"
  description = "Version of the Helm chart"
}

variable "helm_release_name" {
  type        = string
  default     = "argocd"
  description = "Helm release name"
}

variable "helm_repo_url" {
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
  description = "Helm repository"
}

variable "helm_wait" {
  type        = bool
  default     = true
  description = "Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true."
}

variable "helm_timeout" {
  type        = number
  default     = 300
  description = "Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds."
}

variable "helm_cleanup_on_fail" {
  type        = bool
  default     = false
  description = "Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false."
}

variable "helm_atomic" {
  type        = bool
  default     = false
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false."
}

variable "helm_skip_crds" {
  type        = bool
  default     = false
  description = "If set, no CRDs will be installed. By default, CRDs are installed if not already present. Defaults to false."
}

# K8s

variable "k8s_namespace" {
  type        = string
  default     = "argo"
  description = "The K8s namespace in which the ingress-nginx has been created"
}

variable "settings" {
  type        = map(any)
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://artifacthub.io/packages/helm/argo/argo-cd"
}

variable "self_managed" {
  type        = bool
  default     = true
  description = "If set to true, the module will create ArgoCD Application manifest in the cluster and abandon the Helm release"
}

variable "self_managed_use_helm" {
  type        = bool
  default     = false
  description = "If set to true, the ArgoCD Application manifest will be deployed using Kubernetes provider as a Helm release. Otherwise it'll be deployed as a Kubernetes manifest. See Readme for more info"
}

variable "values" {
  type        = string
  default     = ""
  description = "Additional yaml encoded values which will be passed to the Helm chart."
}

variable "argo_destionation_server" {
  type        = string
  default     = "https://kubernetes.default.svc"
  description = "Destination server for ArgoCD Application"
}

variable "argo_project" {
  type        = string
  default     = "default"
  description = "ArgoCD Application project"
}

variable "argo_info" {
  default = [{
    "name"  = "terraform"
    "value" = "true"
  }]
  description = "ArgoCD info manifest parameter"
}

variable "argo_sync_policy" {
  description = "ArgoCD syncPolicy manifest parameter"
  default     = {}
}

variable "argo_application_values" {
  description = "Values to pass to the dummy helm chart installing the ArgoCD application object"
  default     = ""
}

variable "argo_application_enabled" {
  default = false
}

variable "argo_application_use_helm" {
  default = false
}

variable "argo_application_namespace" {
  default     = "argo"
  description = "Namespace where to deploy Argo application"
}

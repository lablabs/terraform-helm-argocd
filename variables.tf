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
  type = bool
  default = true
  description = "If set to true, the module will create ArgoCD Application manifest in the cluster and abandon the Helm release"
}

variable "values" {
  type        = string
  default     = ""
  description = "Additional yaml encoded values which will be passed to the Helm chart."
}

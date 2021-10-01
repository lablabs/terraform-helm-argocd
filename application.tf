locals {
  argo_application_values = yamlencode({
    "project" : var.argo_project
    "source" : {
      "repoURL"        : var.helm_repo_url
      "chart"          : var.helm_chart_name
      "targetRevision" : var.helm_chart_version
      "helm" : {
        "releaseName" : var.helm_release_name
        "parameters"  : [for k, v in var.settings : tomap({ "forceString" : true, "name" : k, "value" : v })]
        "values"      : var.values
      }
    }
    "destination" : {
      "server"    : var.argo_destionation_server
      "namespace" : var.k8s_namespace
    }
    "syncPolicy" : var.argo_sync_policy
    "info"       : var.argo_info
  })
}

data "utils_deep_merge_yaml" "argo_application_values" {
  count = var.enabled && var.self_managed ? 1 : 0
  input = compact([
    local.argo_application_values,
    var.argo_application_values
  ])
}

resource "helm_release" "argocd_application" {
  count = var.enabled && var.self_managed ? 1 : 0

  chart     = "${path.module}/helm/argocd-application"
  name      = "${var.helm_release_name}-application"
  namespace = var.k8s_namespace

  values = [
    data.utils_deep_merge_yaml.argo_application_values[0].output
  ]

  depends_on = [
    helm_release.self_managed[0]
  ]
}
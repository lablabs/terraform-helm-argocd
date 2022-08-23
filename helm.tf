resource "helm_release" "this" {
  count            = var.enabled && !var.self_managed && !var.argo_application_enabled ? 1 : 0
  chart            = var.helm_chart_name
  create_namespace = var.helm_create_namespace
  namespace        = var.k8s_namespace
  name             = var.helm_release_name
  version          = var.helm_chart_version
  repository       = var.helm_repo_url
  wait             = var.helm_wait
  timeout          = var.helm_timeout
  cleanup_on_fail  = var.helm_cleanup_on_fail
  atomic           = var.helm_atomic
  skip_crds        = var.helm_skip_crds

  values = [
    var.values
  ]

  dynamic "set" {
    for_each = var.settings
    content {
      name  = set.key
      value = set.value
    }
  }
}

resource "helm_release" "self_managed" {
  count            = var.enabled && var.self_managed && !var.argo_application_enabled ? 1 : 0
  chart            = var.helm_chart_name
  create_namespace = var.helm_create_namespace
  namespace        = var.k8s_namespace
  name             = var.helm_release_name
  version          = var.helm_chart_version
  repository       = var.helm_repo_url
  wait             = var.helm_wait
  timeout          = var.helm_timeout
  cleanup_on_fail  = var.helm_cleanup_on_fail
  atomic           = var.helm_atomic
  skip_crds        = var.helm_skip_crds

  values = [
    var.values
  ]

  dynamic "set" {
    for_each = var.settings
    content {
      name  = set.key
      value = set.value
    }
  }

  lifecycle {
    ignore_changes = all
  }
}

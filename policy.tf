resource "nomad_acl_policy" "root" {
  name        = "root"
  description = "Cluster root role"
  rules_hcl   = file("${path.module}/policies/root.hcl")
}

resource "nomad_acl_policy" "read_only" {
  count = var.create_read_only ? 1 : 0

  name        = "read-only"
  description = "Read-only observer role"
  rules_hcl   = file("${path.module}/policies/read-only.hcl")
}

module "test" {
  source      = "../compute-mig"
  project_id  = ""
  location    = "us-central1-f"
  name        = "test-mig"
  target_size = 2
  default_version = {
    instance_template = data.google_compute_instance_template.generic.self_link
    name              = "foo"
  }
  autoscaler_config   = var.autoscaler_config
  health_check_config = var.health_check_config
  named_ports         = var.named_ports
  regional            = var.regional
  update_policy       = var.update_policy
  versions            = var.versions
}

data "google_compute_instance_template" "generic" {
  name    = "instance-template-1"
  project = "home-330415"
}

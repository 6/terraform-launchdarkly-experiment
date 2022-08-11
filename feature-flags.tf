# Create a couple new feature flags
# Docs: https://registry.terraform.io/providers/launchdarkly/launchdarkly/latest/docs/resources/feature_flag
resource "launchdarkly_feature_flag" "simple_flag" {
  project_key    = var.launchdarkly_project_key
  key            = "geegee-simple-flag-demo"
  name           = "Simple boolean flag demo"
  description    = "simple boolean flag created through terraform!"
  variation_type = "boolean"
  temporary      = true
  tags = [
    "terraform-managed"
  ]
}

resource "launchdarkly_feature_flag" "multivariate_flag" {
  project_key    = var.launchdarkly_project_key
  key            = "geegee-multi-flag-demo"
  name           = "Simple multivariate flag demo"
  description    = "simple multivariate flag created through terraform!"
  variation_type = "string"
  temporary      = true
  tags = [
    "terraform-managed"
  ]

  variations {
    name        = "Pedro Martinez"
    description = "In 1999, Martínez became just the 9th modern pitcher to have a second 300-strikeout season."
    value       = "pedro"
  }
  variations {
    name  = "Nomar Garciaparra"
    value = "nomar"
  }
  variations {
    name  = "Manny Ramirez"
    value = "manny"
  }
}

# Next, turn on targeting for the simple flag in development environment:
# Docs: https://registry.terraform.io/providers/launchdarkly/launchdarkly/latest/docs/resources/feature_flag_environment
resource "launchdarkly_feature_flag_environment" "simple_flag_env" {
  flag_id = launchdarkly_feature_flag.simple_flag.id
  env_key = "development"
  on      = true

  targets {
    values = ["user-pedro"]
    # Individually target user-pedro
    variation = 0
  }

  # (Required) Nested block describing the default variation to serve if no prerequisites, target, or rules apply.
  fallthrough {
    # by default, off (1 = off, 0 = on)
    variation = 1
  }

  # (Required) The index of the variation to serve if targeting is disabled.
  off_variation = 1
}

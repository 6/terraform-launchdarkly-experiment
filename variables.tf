variable "launchdarkly_access_token" {
  description = "An access token for LaunchDarkly with 'writer' permissions"
  type        = string
  sensitive   = true
}

variable "launchdarkly_project_key" {
  description = "The project key. See projects at https://app.launchdarkly.com/settings/projects"
  type        = string
  sensitive   = false
}

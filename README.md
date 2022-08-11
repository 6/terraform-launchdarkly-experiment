Simple proof-of-concept showing how to manage [LaunchDarkly](https://launchdarkly.com/) feature flags using [terraform](https://www.terraform.io/).

**Example usage:**

Set required env vars ([project key is found here](https://app.launchdarkly.com/settings/projects), and [access token is found here](https://app.launchdarkly.com/settings/authorization))

```
export TF_VAR_launchdarkly_project_key=default
export TF_VAR_launchdarkly_access_token=...your-access-token...
```

Next, optionally modify the `feature-flags.tf` file to customize what kind of feature flags you want to add/modify and how you want to target them.

Finally, plan (review changes) and apply the changes:

```
terraform plan
terraform apply
```

By default, this will:

1. Create two new feature flags: a "simple" boolean flag and an "advanced" multivariate flag.
2. Turn on targeting for the simple flag in the `development` environment.

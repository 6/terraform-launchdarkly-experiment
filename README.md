Simple proof-of-concept showing how to manage [LaunchDarkly](https://launchdarkly.com/) feature flags using [Terraform](https://www.terraform.io/), using the official [terraform-provider-launchdarkly](https://registry.terraform.io/providers/launchdarkly/launchdarkly/latest) provider.

**Example usage:**

Set required env vars ([project key is found here](https://app.launchdarkly.com/settings/projects), and [access token is found here](https://app.launchdarkly.com/settings/authorization))

```
export TF_VAR_launchdarkly_project_key=default
export TF_VAR_launchdarkly_access_token=...your-access-token...
```

Run `terraform init` to initialize Terraform and install the LaunchDarkly provider.

Next, optionally modify the `feature-flags.tf` file to customize what kind of feature flags you want to add/modify and how you want to target them.

Finally, plan (review changes) and apply the changes:

```
terraform plan
terraform apply
```

By default, this will:

1. Create two new feature flags: a "simple" boolean flag and an "advanced" multivariate flag.
2. Turn on targeting for the simple flag in the `development` environment.

<img width="765" src="https://user-images.githubusercontent.com/158675/184227742-41553180-3195-4f83-bb78-835f259ad26b.png">

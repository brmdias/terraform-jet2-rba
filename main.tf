terraform {
  required_providers {
    rundeck = {
      source  = "rundeck/rundeck"
      version = "0.4.5"
    }
  }
}

provider "rundeck" {
  url         = "https://jet2.runbook.pagerduty.cloud/"
  api_version = "45"
  auth_token  = "IYFzKlLcll7vuYP9dlHhJYAJxbeb3OLm"
}

data "local_file" "acl" {
  filename = "${path.cwd}/user-credentials.yml"
}

resource "rundeck_acl_policy" "example" {
  name = "user-credentials.aclpolicy"

  policy = "${data.local_file.acl.content}"
}

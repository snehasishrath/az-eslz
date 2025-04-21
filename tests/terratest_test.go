package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformBasicExample(t *testing.T) {
	t := terraform.Options{
		TerraformDir: "../examples/dev",
		Vars: map[string]interface{}{
			"location": "eastus",
		},
	}

	// Clean up resources with `terraform destroy` at the end of the test.
	defer terraform.Destroy(t, &t)

	// Run `terraform init` and `terraform apply`.
	terraform.InitAndApply(t, &t)

	// Validate outputs.
	output := terraform.Output(t, &t, "management_group_id")
	assert.NotEmpty(t, output)
}
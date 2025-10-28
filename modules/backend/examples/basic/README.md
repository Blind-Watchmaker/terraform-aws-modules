# Basic Backend Example

This example demonstrates how to use the backend module to create the necessary AWS infrastructure for Terraform remote state storage and locking.

## What This Example Creates

- S3 bucket for storing Terraform state files
- DynamoDB table for state locking
- Proper encryption and versioning configuration

## Usage

1. Update the variables in `variables.tf` with your desired values
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Review the plan:
   ```bash
   terraform plan
   ```
4. Apply the configuration:
   ```bash
   terraform apply
   ```

## Configuration

The example uses these default values:
- AWS Region: `ca-central-1`
- S3 Bucket: `my-terraform-state-bucket`
- DynamoDB Table: `my-terraform-locks`

You can override these by setting the corresponding variables or updating the defaults in `variables.tf`.

## Important Notes

- Ensure the S3 bucket name is globally unique
- The DynamoDB table name must be unique within your AWS account and region
- These resources should be created before configuring Terraform to use remote state
- The S3 bucket is protected from accidental deletion
# Terraform-AWS-Example

This is an example app deployed using terraform.

## Pre-requisites for deploying from local machine

* Install terraform locally. ([Download](https://www.terraform.io/downloads.html))
* Create an AWS account. ([Create An AWS account](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/))
* Setup authentication to your AWS account via one of the methods described [here](https://www.terraform.io/docs/providers/aws/index.html#authentication)
  * **Tip:** An easy way to do this is by:
    ```bash
    export AWS_ACCESS_KEY_ID=(your access key id)
    export AWS_SECRET_ACCESS_KEY=(your secret access key)
    export AWS_DEFAULT_REGION=(your aws region)
    ```

## Instructions for deploying from local machine

1. Clone this repo & navigate to it's root directory
2. Initialize terraform:
   ```bash
   terraform init
   ```
3. (Optional) See what changes terraform will make:
   ```bash
   terraform plan 
   ```
4. Apply changes:
   ```bash
   terraform apply
   ```
   **Note:** This will use the default variable, you can use environment specific variables with:
   ```
5. Once the above command completes it will print something like:
   ```
   Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

   Outputs:

   http_endpoint = http://<ip>:<port>/
   ```
   And if you navigate to your [EC2 instances page](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Instances:) you'll see a new instance starting.
6. You can verify that the web server is working by running the following command:
   ```bash
   curl <http_endpoint>
   ```
   Replacing `<http_endpoint>` with the output of http_endpoint in the output above.
   **Note:** It may take a little while before the web server becomes available 
7. Once complete you can destroy the created resources with:
   ```bash
   terraform destroy
   ```



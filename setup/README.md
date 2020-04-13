# Setup

## Prereqs:

- Pick a aws region, which I'll refer to as `<my-aws-region>` for the rest of this doc.
- Pick a globally unique backend name, which I'll refer to as `<my-backend-name>` for the rest of this doc.
- Make sure you have an EC2 Key Pair locally on your machine, which I'll refer to as `<my-key-pair>`. (See [this documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-keypairs.html) for how to create one)

## Steps

1. Update `/backend.tf` replacing:
   - `terraform-example-app` with `<my-backend-name>`
   - `us-east-1` with `<my-aws-region>`
2. Apply Terraform in this directory
   1. Initialize terraform:
   ```bash
   terraform init
   ```
   2. Apply terraform:
   ```bash
   terraform apply -var 'region=<my-aws-region>' -var 'backend_name=<my-backend-name>' -var 'ssh_key_name=<my-key-pair>'
   ```
3. Finish Jenkins configuration
   1. Follow step 1 of `next_steps` from the output above to get the initialAdminPassword
   2. Follow step 2 of `next_steps` from the output above to navigate to the jenkins server in your browser.
   3. Paste the initialAdminPassword into the "Administrator password" dialog and press "continue"
   4. Select "Install suggested plugins"
   5. Fill in approriote information for the "Create First Admin User" dialog then press "Save and Continue". (And make sure to remember it for later!)
   6. Leave the Jenkins URL as it's default and press "Save and Finish"
   7. Jenkins is ready! Press "Start using Jenkins" & continue to the next step.
4. Create Github Personal Access Tokens:
   1. Navigate to (github.com)[https://github.com/] & login if neccicary.
   2. Press your picture in the top right > "Settings" > "Developer Settings" > "Personal access tokens"
   3. Create "jenkins-hooks" token:
      1. Press "Generate new token" and fill in the following:
         - "Note": "jenkins-hooks" (or whatever you like)
         - "repo": ☑️
         - "admin:repo_hook": ☑️
      2. Press "Generate token" and copy the token somewhere safe, we'll use it later.
      3. Back in Jenkins, navigate to "Credentials" > "Jenkins" > "Global credentials (unrestricted)"
      4. Press "Add Credentials" and fill in the following:
         - "Kind": "Secret text"
         - "Secret": The personal access token generated above.
         - "ID": "jenkins-hooks"
      5. Press "OK"
   4. Create "jenkins-pull" token:
      1. Press "Generate new token" and fill in the following:
         - "Note": "jenkins-pull" (or whatever you like)
         - "repo": ☑️
      2. Press "Generate token" and copy the token somewhere safe, we'll use it later.
      3. Back in Jenkins, navigate to "Credentials" > "Jenkins" > "Global credentials (unrestricted)"
      4. Press "Add Credentials" and fill in the following:
         - "Kind": "Username with password"
         - "Username": Your github username
         - "Password": The personal access token generated above.
         - "ID": "jenkins-pull"
      5. Press "OK"

## Old stuff

3. Setup Jenkins server

   1. Create EC2 Instance
   2. Configure Elastic IP
   3. Install Docker
   4. Install Docker-Compose
   5. `docker-compose` up.

2) Configure Github Hooks to Jenkins

   1. Create Github "Personal Access Tokens"
   2. Add "Personal Access Tokens" as github secrets
   3. Configure Jenkins to create hooks.

3) Configure IAM Role with proper access for EC2 Instance
   1. Create role
   2. Apply Policy.json to the EC2 Instance

## Option 2: Manual Setup

<h1 align="center">Static Web Hosting on AWS Series: Terraform Modules & GitHub Actions</h1>


## Tech Stack
- Terraform
- GitHub Actions
- AWS (IAM, S3,)

## Project Steps Overview

1. **Initialize GitHub Repository and Local Setup:**

   - Set up a development environment with Visual Studio Code after cloning the GitHub repository to my local workstation.

2. **Terraform Remote Backend Setup:**

   - Configured a remote backend on AWS using a custom Terraform module, involving resources like an IAM user and S3 bucket.

3. **AWS S3 Static Website Hosting Module:**

   - Set up an AWS S3 bucket to serve a static website, managing the bucket creation and public access configurations.

## Modules explained 

- We have three modules: 

     1. remote_backend - We created reusable remote backend that compromises resoirces like IAM user,s3 bucket, s3 bucket policy. There are 3 configuration files:
        - main.tf - Defining the necessery resources for AWS remote_backend.
        - variables.tf - Customizing settings for AWS remote_backend configuration.
        - outputs.tf - Allows us to easily access and view inmportant information the resources.

     2. s3_web_main - Set up and configuration on AWS s3 bucket for hosting a static website.
        - main.tf - Creating and configuring the AWS s3 bucket (website configuration, public access, bucket policy).
        - variables.tf - Defining variables for AWS s3 bucket.
        - outputs.tf - Defining outputs which will be used in outputs.tf root module. 

     3. Root module - Terraform configuration located in the root directory, collection of all the files in our root directory. 
        - main.tf - Defining the AWS provider, referencing to remote_backend module and s3_web_module to use the terraform configurations defined in those modules.
        - variables.tf - Declared variables that are used in main.tf file.
        - terraform.tfvars - Specifying values for our variables separately from our main configuration files.
        - backend.tf - Configured an s3 bucket as backend for storing terraform.tfstate (terraform State file).
        - outputs.tf - Organizing output variables into a dedicated file.
       


## How it works

#terraform init  :


#terraform plan  :


#terraform apply -auto-approve :


#terraform output :

Successfully created s3 buckets: 

Enter the static website via the "web_url" link :

Opps doesn't work:


NO WORRIES use the aws s3 cp <index.html path> s3://<bucket_id>:


HERE WE GO!!! 


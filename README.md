<h1 align="center">Static Web Hosting on AWS S3 </h1>


## Tech Stack
- Terraform
- AWS (IAM, S3)

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
![terraform init](https://github.com/MDimitrovski/aws-terraform-static-website-task/assets/165828369/e3783386-6bdf-47af-938f-a93bb54e306c)

#terraform plan  :
![terraform plan](https://github.com/MDimitrovski/aws-terraform-static-website-task/assets/165828369/294249b1-4aef-4d04-a2da-0f40baec3598)

#terraform apply -auto-approve :
![terraform apply -auto-approve](https://github.com/MDimitrovski/aws-terraform-static-website-task/assets/165828369/02a482e3-8787-4ee3-86ae-a90376ebb565)

#terraform output :
![terraform output](https://github.com/MDimitrovski/aws-terraform-static-website-task/assets/165828369/585f382d-852a-4e9a-b074-3b26cf88e384)

Successfully created s3 buckets: 
![S3 buckets in AWS ](https://github.com/MDimitrovski/aws-terraform-static-website-task/assets/165828369/3f427791-ee0a-43ac-8c87-8a85d1cdb2a3)

Enter the static website via the "web_url" link :
![web url](https://github.com/MDimitrovski/aws-terraform-static-website-task/assets/165828369/48cd44f6-0163-4713-a9ba-4a71dc974acd)

Error 404 :
![error 404](https://github.com/MDimitrovski/aws-terraform-static-website-task/assets/165828369/8a46a4f9-a009-47ed-a762-24e6474f6b2b)

NO WORRIES use the "aws s3 cp <index.html path> s3://<bucket_id>" :
<img width="1007" alt="AWS cp command" src="https://github.com/MDimitrovski/aws-terraform-static-website-task/assets/165828369/7327e7b6-7b2a-44d0-b330-e42b5198dafb">

HERE WE GO!!! 

<img width="699" alt="Hello World!!" src="https://github.com/MDimitrovski/aws-terraform-static-website-task/assets/165828369/03798e7e-d4eb-4b8e-9e0e-909e169261ff">

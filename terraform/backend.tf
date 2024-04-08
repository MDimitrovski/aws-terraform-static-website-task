terraform {
    backend "s3" {
        bucket = "terraform-task-bucket-mdimitrovski"
        key = "web/terrafortm.tfstate"
        region = "eu-central-1"
    }
}
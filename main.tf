#configure provider
provider "aws" {
    #profile = "default"??
    version = "~> 3.0"
    region =  "us-east-1"
}
provider "aws" {
    #profile = "default"??
    version = "~> 3.0"
    region =  "us-west-2"
    alias = "west"
}

terraform {
    backend "s3" {
        bucket = "descomplicando-terraform-matheus-22-12-20"
        dynamodb_table = "terraform-state-lock-dynamo"
        key = "terraform-tests.tfstate"
        region = "us-east-1"

   }
}
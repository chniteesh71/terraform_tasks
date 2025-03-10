# Temp CW Synthetics
/*resource "aws_synthetics_canary" "some" {
  
}*/

##  Use Terraform Import
/*
1. Create temp resource as above
2. Take terraform.tfstate backup
cp terraform.tfstate terraform.tfstate_before_canary
terraform import aws_synthetics_canary.some app1-canary-test
*/

resource "aws_synthetics_canary" "sswebsite2" {
  name                 = "sswebsite2"
  artifact_s3_location = "s3://cw-syn-results-18078653422222-us-east-1/canary/us-east-1/sswebsite2"
  execution_role_arn   = "arn:aws:iam::1877878964235673:role/service-role/CloudWatchSyntheticsRole-app1-canary-test-eaf-ff4568986644189c99"
  handler              = "sswebsite2.handler"
  zip_file             = "sswebsite2/sswebsite2v1.zip"
  runtime_version      = "syn-nodejs-puppeteer-6.0"
  start_canary = true

  run_config {
    active_tracing = true
    memory_in_mb = 960
    timeout_in_seconds = 60
  }
  schedule {
    expression = "rate(1 minute)"
  }
}
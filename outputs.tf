# 
#output "vpc_security_group_ids" {
#  value = "${aws_security_group.instance.id}"
#}
#
output "elb_dns_name" {
 value = "${aws_elb.example.dns_name}"
}


output "s3_bucket_arn" {
value = "${aws_s3_bucket.terraform_state.arn}"
}
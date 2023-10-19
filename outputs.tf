# 
#output "vpc_security_group_ids" {
#  value = "${aws_security_group.instance.id}"
#}
#
output "elb_dns_name" {
 value = "${aws_elb.example.dns_name}"
}

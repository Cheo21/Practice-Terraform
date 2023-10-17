provider "aws" {
  region = "us-east-1"  # Cambia esto a la región que desees
}


# Grupo de seguridad
resource "aws_security_group" "beanstalk" {
  name_prefix = "beanstalk-"
}

# Regla de entrada SSH al grupo de seguridad
resource "aws_security_group_rule" "ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.beanstalk.id
}

# Bucket S3
resource "aws_s3_bucket" "my_bucket" {
  bucket = "mi-bucket-unico"  # Nombre único del bucket
}

# Dev Elastic Beanstalk Environment
resource "aws_elastic_beanstalk_application" "dev_eb_application" {
  name        = "DevElasticBeanstalkApp"
  description = "Entorno de Desarrollo"
}

resource "aws_elastic_beanstalk_environment" "dev_eb_environment" {
  name                = "DevElasticBeanstalkEnv"
  application        = aws_elastic_beanstalk_application.dev_eb_application.name
  solution_stack_name = "solution_stack_name = "64bit Amazon Linux 2 v4.5.0 running Node.js 14"
  platform_arn        = "arn:aws:elasticbeanstalk:us-east-1::platform/Node.js 14 running on 64bit Amazon Linux 2/4.5.0"
  instance_profile    = "aws-elasticbeanstalk-ec2-role"
  security_groups     = [aws_security_group.beanstalk.name]
  settings = {
    "aws:autoscaling:launchconfiguration" = jsonencode({
      "InstanceType" = "t2.micro",
    })
  }
}

# Stage Elastic Beanstalk Environment
resource "aws_elastic_beanstalk_application" "stage_eb_application" {
  name        = "StageElasticBeanstalkApp"
  description = "Entorno de Staging"
}

resource "aws_elastic_beanstalk_environment" "stage_eb_environment" {
  name                = "StageElasticBeanstalkEnv"
  application        = aws_elastic_beanstalk_application.stage_eb_application.name
  solution_stack_name = "solution_stack_name = "64bit Amazon Linux 2 v4.5.0 running Node.js 14"
  platform_arn        = "arn:aws:elasticbeanstalk:us-east-1::platform/Node.js 14 running on 64bit Amazon Linux 2/4.5.0"
  instance_profile    = "aws-elasticbeanstalk-ec2-role"
  security_groups     = [aws_security_group.beanstalk.name]
  settings = {
    "aws:autoscaling:launchconfiguration" = jsonencode({
      "InstanceType" = "t2.micro",
    })
  }
}

# Prod Elastic Beanstalk Environment
resource "aws_elastic_beanstalk_application" "prod_eb_application" {
  name        = "ProdElasticBeanstalkApp"
  description = "Entorno de Producción"
}

resource "aws_elastic_beanstalk_environment" "prod_eb_environment" {
  name                = "ProdElasticBeanstalkEnv"
  application        = aws_elastic_beanstalk_application.prod_eb_application.name
  solution_stack_name = "solution_stack_name = "64bit Amazon Linux 2 v4.5.0 running Node.js 14"
  platform_arn        = "arn:aws:elasticbeanstalk:us-east-1::platform/Node.js 14 running on 64bit Amazon Linux 2/4.5.0"
  instance_profile    = "aws-elasticbeanstalk-ec2-role"
  security_groups     = [aws_security_group.beanstalk.name]
  settings = {
    "aws:autoscaling:launchconfiguration" = jsonencode({
      "InstanceType" = "t2.micro",
    })
  }
}

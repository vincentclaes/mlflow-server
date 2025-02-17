variable "name" {
  description = "(Optional) A name for the application (e.g. mlflow)."
  type = string
  default = "mlflow"
}

variable "environment" {
  description = "(Optional) Environment. It will be part of the application name and a tag in AWS Tags."
  type = string
  default = "dev"
}

variable "region" {
  description = "(Optional) AWS Region."
  type = string
  default = "us-east-1"
}

variable "tags" {
  type = map(string)
  description = "(Optional) AWS Tags common to all the resources created."
  default = {}
}

variable "service_cpu" {
  type        = number
  default     = 1024
  description = "The number of CPU units reserved for the MLflow container."
}

variable "service_memory" {
  type        = number
  default     = 2048
  description = "The amount (in MiB) of memory reserved for the MLflow container."
}

variable "mlflow_username" {
  description = "Username used in basic authentication provided by nginx."
  type = string
  default = "mlflow"
}

variable "mlflow_password" {
  description = "Password used in basic authentication provided by nginx. If not specified, this module will create a strong password for you."
  type = string
  default = null
}

variable "artifact_bucket_id" {
  type        = string
  default     = null
  description = "If specified, MLflow will use this bucket to store artifacts. Otherwise, this module will create a dedicated bucket. When overriding this value, you need to enable the task role to access the root you specified."
}

variable "db_skip_final_snapshot" {
  type        = bool
  default     = false
  description = "(Optional) If true, this module will not create a final snapshot of the database before terminating."
}

variable "db_instance_class" {
  type        = string
  default     = "db.t2.micro"
  description = "(Optional) The instance type of the RDS instance."
}

# variable "vpc_id" {
#   type        = string
#   description = "AWS VPC to deploy MLflow into"
# }

# variable "db_subnet_ids" {
#   type        = list(string)
#   description = "List of subnets where the RDS database will be deployed"
# }

# variable "db_auto_pause" {
#   type        = bool
#   default     = true
#   description = "If true, the Aurora Serverless cluster will be paused after a given amount of time with no activity. https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html#aurora-serverless.how-it-works.pause-resume"
# }

# variable "db_auto_pause_seconds" {
#   type        = number
#   default     = 300
#   description = "The number of seconds to wait before automatically pausing the Aurora Serverless cluster. This is only used if rds_auto_pause is true."
# }

# variable "db_min_capacity" {
#   type        = number
#   default     = 1
#   description = "The minimum capacity for the Aurora Serverless cluster. Aurora will scale automatically in this range. See: https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html"
# }

# variable "db_max_capacity" {
#   type        = number
#   default     = 256
#   description = "The maximum capacity for the Aurora Serverless cluster. Aurora will scale automatically in this range. See: https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/aurora-serverless.how-it-works.html"
# }
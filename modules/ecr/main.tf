resource "aws_ecr_repository" "ecr_image1" {
  name                 = lower("${var.repository_name1}")
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "ecr_image2" {
  name                 = lower("${var.repository_name2}")
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "ecr_image3" {
  name                 = lower("${var.repository_name3}")
  image_tag_mutability = "MUTABLE"
}
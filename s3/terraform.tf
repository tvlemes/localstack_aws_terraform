resource "aws_s3_bucket" "meu_bucket" {
  bucket = "meu-bucket-local-terraform-exemplo"
  acl    = "private" # acl está depreciado mas não gera erro
}
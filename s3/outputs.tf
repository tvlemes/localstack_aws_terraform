output "bucket_name" {
    description = "Nome do bucket S3 criado"
    value = aws_s3_bucket.meu_bucket.bucket
}

output "bucket_arn" {
    description = "ARN do bucket"
    value = aws_s3_bucket.meu_bucket.arn
}
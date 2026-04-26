output "cloudfront_url" {
  description = "Your live site URL — share this on LinkedIn and GitHub"
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "s3_bucket_name" {
  description = "Bucket name — use in upload and CI/CD commands"
  value       = aws_s3_bucket.site.bucket
}

output "cloudfront_distribution_id" {
  description = "Distribution ID — use for cache invalidations"
  value       = aws_cloudfront_distribution.site.id
}

output "upload_command" {
  description = "Run this after apply to upload your site files"
  value       = "aws s3 sync ../src/ s3://${aws_s3_bucket.site.bucket}/ --delete"
}

output "invalidate_command" {
  description = "Run this after uploading to clear CloudFront cache"
  value       = "aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.site.id} --paths '/*'"
}

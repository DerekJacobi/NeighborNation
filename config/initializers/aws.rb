
AWS.config(
   :bucket => ENV['S3_BUCKET_NAME'],
   :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
   :secret_access_key => ENV['SECRET_ACCESS_KEY'],
)

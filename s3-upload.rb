#!/usr/bin/env ruby

require 'rubygems'
require 'aws-sdk'

AWS.config(
    :access_key_id => 'AKIAJ6ZQ3YPWY7QQPQ2Q',
    :secret_access_key => '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'
)

bucket_name = 'aws-training-s3-upload-day3'
file_name = '500MB-file'

# Get an instance of the S3 interface.
s3 = AWS::S3.new

# Upload a file.
key = File.basename(file_name)
s3.buckets[bucket_name].objects[key].write(:file => file_name)
puts "Uploading file #{file_name} to bucket #{bucket_name}."
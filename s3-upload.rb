#!/usr/bin/env ruby

require 'rubygems'
require 'aws-sdk'

puts 'config aws with access account'
AWS.config(
    :access_key_id => 'AKIAJ6ZQ3YPWY7QQPQ2Q',
    :secret_access_key => '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'
)
puts 'config finished'

bucket_name = 'aws-training-s3-upload-day3-1'
file_name = '500MB-file'

s3 = AWS::S3.new
puts "get an instance of the S3 interface."

puts "remove bucket #{bucket_name} if exist"

bucket = s3.buckets[bucket_name]
if bucket.exists?
  bucket.clear!
  bucket.delete
end

key = File.basename(file_name)
puts "object key is #{key}"
puts "create bucket"
bucket = s3.buckets.create(bucket_name)
puts "bucket #{bucket_name} is created "

puts "uploading object"
bucket.objects[key].write(:file => file_name)
puts "Object file #{file_name} has uploaded to #{bucket_name}"
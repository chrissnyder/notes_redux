module.exports =
  local: 'build'
  bucket: 'zooniverse-demo'
  prefix: 'n2n'
  key: process.env.S3_ACCESS_ID
  secret: process.env.S3_SECRET_KEY
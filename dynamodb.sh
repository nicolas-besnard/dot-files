wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest -O dynamodb.tar.gz

mkdir dynamodb
tar -xvf dynamodb.tar.gz -C dynamodb/
rm dynamodb.tar.gz

mv dynamodb /Applications/
brew install python
pip install awscli
pit install boto
wget https://s3.amazonaws.com/elasticbeanstalk/cli/AWS-ElasticBeanstalk-CLI-2.6.3.zip
unzip AWS-ElasticBeanstalk-CLI-2.6.3.zip
rm WS-ElasticBeanstalk-CLI-2.6.3.zip
mv AWS-ElasticBeanstalk-CLI-2.6.3/ /Applications/AWS_beanstalk/
echo "PATH=$PATH:/Applications/AWS_beanstalk/eb/macosx/python2.7" >> .zshrc
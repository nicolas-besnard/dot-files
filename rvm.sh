curl -L https://get.rvm.io | bash -s stable
rvm requirements
rvm get head
rvm install 2.2.0
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc

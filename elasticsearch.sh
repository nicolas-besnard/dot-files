#wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.0.zip
#wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.2.zip
#unzip elasticsearch-1.1.2.zip
#rm elasticsearch-1.1.2.zip
#elasticsearch-1.1.2/bin/plugin -install mobz/elasticsearch-head
#mv elasticsearch-1.1.2 /Applications/elasticsearch
brew install elasticsearch
cd /usr/local/Cellar/elasticsearch/1.4.0/bin
./plugin -install mobz/elasticsearch-head
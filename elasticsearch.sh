wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.0.zip
unzip elasticsearch-1.3.0.zip
rm elasticsearch-1.3.0.zip
elasticsearch-1.3.0/bin/plugin -install mobz/elasticsearch-head
mv elasticsearch-1.3.0 /Applications/elasticsearch
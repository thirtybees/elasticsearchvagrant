# ELASTICSEARCH

# install openjdk-8
apt-get purge openjdk*
add-apt-repository ppa:webupd8team/java -y
apt-get update -y
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
apt-get install oracle-java8-installer -y

# install ES
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.4.0.tar.gz

tar -xvf elasticsearch-5.4.0.tar.gz

sudo sysctl -w vm.max_map_count=262144
echo "vagrant soft     nofile         65536" | sudo tee --append /etc/security/limits.conf
echo "vagrant hard     nofile         65536" | sudo tee --append /etc/security/limits.conf
echo "session required pam_limits.so" | sudo tee --append /etc/pam.d/common-session
sudo -H -u vagrant bash -c 'ulimit -n'

# either of the next two lines is needed to be able to access "localhost:9200" from the host os
echo "network.bind_host: 0" >> elasticsearch-5.4.0/config/elasticsearch.yml
echo "network.host: 0.0.0.0" >> elasticsearch-5.4.0/config/elasticsearch.yml
# enable dynamic scripting
echo "script.inline: on" >> elasticsearch-5.4.0/config/elasticsearch.yml
# enable cors (to be able to use Sense)
echo "http.cors.enabled: true" >> elasticsearch-5.4.0/config/elasticsearch.yml
echo "http.cors.allow-origin: /https?:\/\/.*/" >> elasticsearch-5.4.0/config/elasticsearch.yml

sudo chown -R vagrant:vagrant elasticsearch-5.4.0

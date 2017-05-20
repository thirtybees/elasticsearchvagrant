# elasticsearch settings and run
sudo sysctl -w vm.max_mapy_count=262144
su vagrant --shell /bin/bash --command "ulimit -n 65536"
sudo -H -u vagrant bash -c 'elasticsearch-5.4.0/bin/elasticsearch'

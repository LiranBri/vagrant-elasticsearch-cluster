# install oracle java
echo "installing oracle java"
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java7-installer oracle-java7-set-default

# Setting ES version to install
ES_VERSION="elasticsearch-1.5.2"
ES_PLUGIN_INSTALL_CMD="sudo elasticsearch/bin/plugin -install"

echo "installing " $ES_VERSION
# Downloading the version to install
wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_VERSION.tar.gz
tar -xvf $ES_VERSION.tar.gz
rm -rf $ES_VERSION.tar.gz

# Renaming extracted folder to a generic name to avoid changing ES commands (elasticsearch/bin/...)
mv $ES_VERSION elasticsearch

# Internal ES plugins

# Supervision/Dashboards ES Plugins
${ES_PLUGIN_INSTALL_CMD} mobz/elasticsearch-head
#${ES_PLUGIN_INSTALL_CMD} karmi/elasticsearch-paramedic
${ES_PLUGIN_INSTALL_CMD} lukas-vlcek/bigdesk
#${ES_PLUGIN_INSTALL_CMD} elasticsearch/marvel/latest
#${ES_PLUGIN_INSTALL_CMD} royrusso/elasticsearch-HQ

echo "installation completed :-)"

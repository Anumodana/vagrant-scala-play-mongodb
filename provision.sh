JAVA_VERSION=7
PLAY_VERSION=2.2.6
SCALA_VERSION=2.11.4

# Configure apt for mongodb
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

# Configure apt for java
# http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
apt-get update
apt-get install -y python-software-properties
add-apt-repository -y ppa:webupd8team/java
echo oracle-java$JAVA_VERSION-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# Update apt sources
apt-get update

# Install stuff available through apt-get
apt-get install -y unzip wget git vim mongodb-10gen oracle-java$JAVA_VERSION-installer oracle-java$JAVA_VERSION-set-default

# Install scala and play manually
cd /opt
wget http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.tgz
tar -zxvf scala-$SCALA_VERSION.tgz
wget http://downloads.typesafe.com/play/$PLAY_VERSION/play-$PLAY_VERSION.zip
unzip play-$PLAY_VERSION.zip
chmod +x /opt/play-$PLAY_VERSION/play
chmod +x /opt/play-$PLAY_VERSION/framework/build
chmod -R a+rw /opt/play-$PLAY_VERSION/*

echo 'PATH=${PATH}:/opt/scala-${SCALA_VERSION}/bin:/opt/play-${PLAY_VERSION}' >> /etc/profile

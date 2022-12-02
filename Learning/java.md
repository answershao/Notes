https://docs.datastax.com/en/jdk-install/doc/jdk-install/installOracleJdkDeb.html

# download
FILE=jdk-8u301-linux-x64.tar.gz
VERSION=301-b09
HASH=d3c52aa6bfa54d3ca74e617f18309292
URL="https://javadl.oracle.com/webapps/download/GetFile/1.8.0_$VERSION/$HASH/linux-i586/$FILE"
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" $URL

# install
sudo mkdir -p /usr/lib/jvm
sudo tar zxvf jdk-version-linux-x64.tar.gz -C /usr/lib/jvm

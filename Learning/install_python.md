# docker install new version python

# install 
sudo wget https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tgz
sudo tar xzf Python-3.9.13.tgz
cd Python-3.9.13
sudo ./configure --enable-optimizations
sudo make altinstall
# rm 
rm -f Python-3.9.13.tgz
# check
python3.9

mkdir -p /opt/source/mwget
cd /opt/source/mwget

#wget -q http://d.139.sh/2250743895/ez_setup.py
#wget -q https://bootstrap.pypa.io/ez_setup.py
#python ez_setup.py

wget http://d.139.sh/2250743895/setuptools-28.7.1.zip
uzip setuptools-28.7.1.zip
cd setuptools-28.7.1.zip
python setup.py install

wget http://d.139.sh/2250743895/pip-1.5.5.tar.gz
tar zvxf pip-1.5.5.tar.gz
cd pip-1.5.5/
python setup.py install

cd ..
wget http://d.139.sh/2250743895/mwget-master.zip
uzip mwget-master.zip
cd mwget-master
pip install mwget

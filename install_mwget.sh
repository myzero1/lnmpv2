mkdir -p /opt/source/mwget
cd /opt/source/mwget

#wget http://d.139.sh/2250743895/ez_setup.py
wget -q https://bootstrap.pypa.io/ez_setup.py
python ez_setup.py

wget http://d.139.sh/2250743895/pip-1.5.5.tar.gz
tar zvxf 1.5.5.tar.gz
cd pip-1.5.5/
python setup.py install

cd ..
wget http://d.139.sh/2250743895/mwget-master.zip
uzip mwget-master.zip
cd mwget-master
pip install mwget

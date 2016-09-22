mkdir -p /opt/source/
cd /opt/source/
wget http://soft.vpser.net/lnmp/lnmp1.3.tar.gz
tar -zxvf lnmp1.3.tar.gz
cd lnmp1.3

sed -i "s|read|#read|g" include/main.sh
sed -i "s|DBSelect=\"2\"|DBSelect=\"3\"|g" include/main.sh
sed -i "s|OLDCONFIG=`stty -g`|#OLDCONFIG=`stty -g`|g" include/main.sh
sed -i "s|stty -icanon -echo min 1 time 0|#stty -icanon -echo min 1 time 0|g" include/main.sh
sed -i "s|dd count=1 2\>\/dev\/null|dd count=1 2\>\/dev\/null|g" include/main.sh


bash /opt/source/lnmp1.3/install.sh

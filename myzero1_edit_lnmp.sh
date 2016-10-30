mkdir -p /opt/source/
cd /opt/source/
#wget http://soft3.vpser.net/lnmp/lnmp1.3.tar.gz
#tar -zxvf lnmp1.3.tar.gz
#cd lnmp1.3

mwget http://d.139.sh/2250743895/lnmp1.3-full.tar.gz -f lnmp1.3-full.tar.gz
#wget http://pan.plyz.net/d.asp?u=2250743895&p=lnmp1.3-full.tar.gz
tar -zxvf lnmp1.3-full.tar.gz
cd lnmp1.3-full


#sed -i "s|Download_Mirror=\'http://soft.vpser.net\'|Download_Mirror=\'http://soft3.vpser.net\'|g" include/main.sh

sed -i "s|read|#read|g" include/main.sh
sed -i "s|DBSelect=\"2\"|DBSelect=\"3\"|g" include/main.sh
sed -i "s|OLDCONFIG=`stty -g`|#OLDCONFIG=`stty -g`|g" include/main.sh
sed -i "s|stty -icanon -echo min 1 time 0|#stty -icanon -echo min 1 time 0|g" include/main.sh
sed -i "s|dd count=1 2\>\/dev\/null|dd count=1 2\>\/dev\/null|g" include/main.sh


bash /opt/source/lnmp1.3/install.sh

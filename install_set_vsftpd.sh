#安装vsftpd,安装ftp客服端
yum install -y vsftpd.x86_64
yum install -y ftp.x86_64

#实现虚拟用户的访问
mkdir vu_dir
cd vu_dir
echo "local_root=/home/woogle" >> woogle
echo "write_enable=YES" >> woogle
echo "anon_umask=022" >> woogle
echo "anon_world_readable_only=NO" >> woogle
echo "anon_upload_enable=YES" >> woogle
echo "anon_mkdir_write_enable=YES" >> woogle
echo "anon_other_write_enable=YES" >> woogle

cd /etc/vsftpd

echo "woogle" >> vuser
echo "123456" >> vuser
db_load -T -thash -f vuser vuser.db

useradd -d/opt/vuser -s /sbin/nologin vuser

echo "auth required /lib64/security/pam_userdb.so db=/etc/vsftpd/vuser" >> /etc/pam.d/vsftpd.vu
echo "account required /lib64/security/pam_userdb.so db=/etc/vsftpd/vuser" >> /etc/pam.d/vsftpd.vu

sed -i "s|pam_service_name=vsftpd|#pam_service_name=vsftpd |g" vsftpd.conf
echo "guest_enable=YES" >> vsftpd.conf
echo "guest_username=vuser" >> vsftpd.conf
echo "pam_service_name=vsftpd.vu" >> vsftpd.conf
echo "user_config_dir=/etc/vsftpd/vu_dir" >> vsftpd.conf

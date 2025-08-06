#!/bin/sh

echo -e "\n====================================================="
echo -e "\n================ Setting up FTP Server =============="
echo -e "\n====================================================="

adduser --disabled-password --gecos "" "${FTP_USER_NAME}"

echo "${FTP_USER_NAME}:${FTP_USER_PASSWD}" | chpasswd

mkdir -p "${FTP_USER_HOME}"
chown -R "${FTP_USER_NAME}:${FTP_USER_NAME}" "${FTP_USER_HOME}"
chmod 775 "${FTP_USER_HOME}"

mkdir -p /var/run/vsftpd/empty

exec vsftpd /etc/vsftpd.conf
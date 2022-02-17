#install and configure VNC Server on CentOS

# Disable SELinux 

setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux````````````````````````````````````````````````````````````````````````````````````````````````````````````````

# install VNC server (tigervnc-server)

dnf install tigervnc-server tigervnc-server-module -y
su - $USER
vncpasswd

# Setup VNC Server configuration file
# /etc/systemd/system/vncserver@.service

vim /etc/systemd/system/vncserver@.service

[Unit]
Description=Remote desktop service (VNC)
After=syslog.target network.target
[Service]
Type=forking
ExecStartPre=/bin/sh -c '/usr/bin/vncserver -kill %i > /dev/null 2>&1 || :'
ExecStart=/sbin/runuser -l $USER -c "/usr/bin/vncserver %i -geometry 1280x1024"
PIDFile=/home/$USER/.vnc/%H%i.pid
ExecStop=/bin/sh -c '/usr/bin/vncserver -kill %i > /dev/null 2>&1 || :'
[Install]
WantedBy=multi-user.target

#By default, VNC server listen on tcp port 5900+n, where n is the display number, 
# if the display number is “1” then VNC server will listen its request on TCP port 5901.

systemctl daemon-reload
systemctl start  vncserver@:1.service
systemctl enable  vncserver@:1.service
netstat -tunlp | grep 5901
systemctl status vncserver@:1.service
firewall-cmd --permanent --add-port=5901/tcp

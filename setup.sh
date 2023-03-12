# install epel
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# download wget
sudo yum install wget

# nano
yum install -y nano

# download, install, and verify R
export R_VERSION=4.1.3
curl -O https://cdn.rstudio.com/r/centos-7/pkgs/R-${R_VERSION}-1-1.x86_64.rpm
sudo yum install R-${R_VERSION}-1-1.x86_64.rpm
/opt/R/${R_VERSION}/bin/R --version

# create symlink (only do for first R installation)
sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R     
sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript

# download and install rstudio server
wget https://download2.rstudio.org/server/centos7/x86_64/rstudio-server-rhel-2022.12.0-353-x86_64.rpm
sudo yum install rstudio-server-rhel-2022.12.0-353-x86_64.rpm

# (optional) add following line to /etc/rstudio/rserver.conf
# www-port=80

# for wsl, we want to enable systemctl and have cron start automatically. Add following lines to /etc/wsl.conf 
# [boot]
# systemd=true
# command="service cron start"


# RStudio Server Testing Project

This is a project with a simple code to be used for testing RStudio Server, cron jobs in CentOS7, pack rat, and other things.

## RStudio Server Setup

These steps are taken from [here](https://posit.co/download/rstudio-server/).

1.  [Install R](https://docs.posit.co/resources/install-r/)
    -   Enable the Extra Packages for Enterprise Linux (EPEL) repository
        -   `sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm`
    -   Enable Optional repository
        -   On Premise
            -   `sudo subscription-manager repos --enable "rhel-*-optional-rpms"`
        -   Public Cloud
            -   `# Optional repository from Red Hat Update Infrastructure (RHUI)sudo yum install yum-utilssudo yum-config-manager --enable "rhel-*-optional-rpms"`
    -   Specify R Version
        -   `export R_VERSION=4.1.3`
    -   Download and Install R
        -   `curl -O https://cdn.rstudio.com/r/centos-7/pkgs/R-${R_VERSION}-1-1.x86_64.rpmsudo yum install R-${R_VERSION}-1-1.x86_64.rpm`
    -   Verify Installation
        -   `/opt/R/${R_VERSION}/bin/R --version`
    -   Create Symlink to R (only for first R installation)
        -   `$ sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R     $ sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript`
2.  Install RStudio Server
    -   `sudo yum install wget`

    -   `wget https://download2.rstudio.org/server/centos7/x86_64/rstudio-server-rhel-2022.12.0-353-x86_64.rpm`

    -   `sudo yum install rstudio-server-rhel-2022.12.0-353-x86_64.rpm`

    -   Verify

        -   [http://server-ip](http://%3Cserver-ip){.uri}:8787
        -   Other useful commands
            -   Status
                -   `service rstudio-server status`
            -   Stop
                -   `service rstudio-server stop`
            -   Start
                -   `service rstudio-server start`
            -   Restart
                -   `service rstudio-server restart`

## User Setup

RStudio Server works for all users other than root, so we need to create users and a group to use for scoping what RStudio Server will allow in.

-   `useradd sam`

-   `passwd sam`

Users then need to be put into the rstudio-users group

-   `sudo groupadd rstudio-users`

-   `usermod -g rstudio-users sam`

See who's in a group (lid is in libuser)

-   `lid -g rstudio-users`

Edit user's main group

-   `usermod -g rstudio-users sam`

Remove user from group (when not main group)

-   `gpasswd -d sam rstudio-users`\

\* \* \* \* \* (cd /home/sam/Test\\ RStudio\\ Server\\ Project && /usr/local/bin/Rscript /home/sam/Test\\ RStudio\\ Server\\ Project/Trying\\ to\\ Schedule\\ A\\ Thing.R)

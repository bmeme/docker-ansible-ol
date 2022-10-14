FROM oraclelinux:9
LABEL   com.bmeme.project.family='Oracle Linux Docker Image' \
        com.bmeme.project.version='8.6' \
        com.bmeme.maintainer.1='Daniele Piaggesi <daniele.piaggesi@bmeme.com>' \
        com.bmeme.maintainer.2='Roberto Mariani <roberto.mariani@bmeme.com>' \
        com.bmeme.maintainer.3='Michele Mondelli <michele.mondelli@bmeme.com>' \
        com.bmeme.refreshedat='2022-10-13'

env LC_CTYPE "en_US.UTF-8"
env LC_ALL "en_US.UTF-8"
env LANG "en_US.UTF-8"

# Install systemd -- See https://hub.docker.com/_/oraclelinux/
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install requirements.
RUN dnf makecache \
 && dnf -y install \
        initscripts \
        sudo \
        which \
        python3 \
        python3-libs \
        python3-pip \
 && dnf clean all

# Upgrade Pip, install and configure Ansible.
RUN python3 -m pip install --upgrade pip; \
    python3 -m pip install ansible; \
    sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers; \
    mkdir -p /etc/ansible; \
    echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/lib/systemd/systemd"]

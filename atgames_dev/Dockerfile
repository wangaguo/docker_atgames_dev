FROM ubuntu:16.04
MAINTAINER WangAguo "wangaguo@gmail.com"

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y memcached
RUN apt-get install -y redis-server
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y ffmpeg
RUN apt-get install -y sphinxsearch # for D2D
RUN apt-get install -y imagemagick # for D2D

# instqll qt for capybara-webkit
RUN apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

# system
RUN apt-get install -y net-tools
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN apt-get install -y sudo
RUN locale-gen "zh_TW.UTF-8" # fix git log display UTF-8

# RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN apt-get install -y curl
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN echo "source /usr/local/rvm/scripts/rvm" >> ~/.bashrc
RUN /bin/bash -l -c "rvm install 2.0.0-p481" # for D2D
RUN /bin/bash -l -c "rvm install 2.1.10" # for ADS

# NVM
RUN \curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | PROFILE=/etc/bash.bashrc NVM_DIR=/usr/local/nvm bash
RUN groupadd nvm
RUN sudo chmod g+w /usr/local/nvm/
RUN sudo chown -R root:nvm /usr/local/nvm/
RUN /bin/bash -l -c "source /usr/local/nvm/nvm.sh; nvm install 5.6.0"

# Add user
RUN useradd -m -G sudo,root,rvm,nvm -s /bin/bash ubuntu
RUN echo ubuntu:atgames | chpasswd
RUN echo 'ubuntu\tALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers.d/90-cloud-users
RUN sudo -uubuntu mkdir -p /home/ubuntu/.ssh

# Setting Environment
RUN echo "source /usr/local/rvm/scripts/rvm" >> /etc/bash.bashrc

# Define mountable directories.
VOLUME ["/work"]
VOLUME ["/docker"]

# Define working directory.
WORKDIR /work

# Expose port
EXPOSE 22

# Entrypoint
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]

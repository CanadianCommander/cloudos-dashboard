FROM centos:7

ARG BUILD_MODE="prod"

# Install packages for building ruby
RUN yum update -y
RUN yum install -y openssl-devel readline-devel zlib-devel
RUN yum groupinstall -y "Development tools"

# Install rbenv (copied from, github.com/tcnksm/dockerfile-rbenv)
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc

# install ruby
RUN rbenv install 2.6.3
RUN rbenv global 2.6.3 && rbenv rehash
RUN /bin/bash -c "~/.rbenv/shims/gem install bundler"

# install node / yarn
RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN yum install -y yarn
RUN yarn global add n
RUN n 10.9.0
RUN yarn global add @angular/cli@8.3.5

# install postgres
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum install -y postgresql11 postgresql11-server postgresql-devel
RUN mkdir -p /var/log/pgsql && chmod 777 /var/log/pgsql

# setup httpd
RUN yum install -y httpd
COPY ./010-http-proxy.conf /etc/httpd/conf.d/

# copy app
RUN mkdir /app/ && chmod 777 /app
ADD . /app/

ENV BUILD_MODE $BUILD_MODE
CMD ["sh", "-c", "/app/docker_boot.sh"]

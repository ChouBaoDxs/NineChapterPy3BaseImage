FROM centos:centos7.5.1804
LABEL maintainer=dongxuesen

# 安装软件包
RUN yum -y install openssl-devel zlib-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel && \
    yum -y install gcc mysql-devel gcc-devel python-devel automake autoconf libtool make wget vim net-tools

# 安装unrar
RUN wget http://www.rarlab.com/rar/rarlinux-x64-5.3.0.tar.gz && \
    tar -xzvf rarlinux-x64-5.3.0.tar.gz && \
    cp -r rar /usr/local/rar && \ 
    ln -s /usr/local/rar/rar /usr/local/bin/rar && \
    ln -s /usr/local/rar/unrar /usr/local/bin/unrar

# 安装python365
RUN wget http://mirrors.sohu.com/python/3.6.5/Python-3.6.5.tgz && \
    tar xfz Python-3.6.5.tgz && \
    rm -f Python-3.6.5.tgz && \
    cd Python-3.6.5  && \
    mkdir /usr/local/python365  && \
    ./configure --prefix=/usr/local/python365  && \
    make && make install  && \
    ln -s /usr/local/python365/bin/python3 /usr/bin/python365  && \
    ln -s /usr/local/python365/bin/pip3 /usr/bin/pip365  && \
    pip365 install --upgrade pip setuptools -i https://pypi.tuna.tsinghua.edu.cn/simple

# 设置为上海时间
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 设置语言
ENV LANG en_US.UTF-8  
ENV LC_ALL en_US.UTF-8 

# 安装node10
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash - && yum install -y nodejs

COPY centos-py365/requirements.txt .

# RUN pip365 install -r requirements.txt --timeout=300 -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip365 install -r requirements.txt --timeout=300

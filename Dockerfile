FROM ubuntu:18.04
WORKDIR /root

RUN apt update && apt install -y git python3 python3-pip net-tools iputils-ping locales
RUN python3 -m pip install aiomysql aiohttp protobuf qqwry-py3 wolframalpha lxml numpy jieba cssselect
RUN python3 -m pip install pyxdameraulevenshtein

RUN git clone https://github.com/openjudge/sandbox
RUN cd /root/sandbox/libsandbox && ./configure && make install && ln -s /usr/local/lib/libsandbox.so /lib/libsandbox.so
RUN cd /root/sandbox/pysandbox && python3 setup.py install

ENV TZ "Asia/Shanghai"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN locale-gen && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

ENV LC_ALL "zh_CN.UTF-8"
ENV PYTHONIOENCODING utf-8

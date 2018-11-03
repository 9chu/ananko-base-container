FROM ubuntu:18.04
WORKDIR /root

RUN apt update && apt install -y git python3 python3-pip net-tools iputils-ping
RUN python3 -m pip install aiomysql aiohttp protobuf qqwry wolframalpha lxml numpy jieba pyxdameraulevenshtein

RUN git clone https://github.com/openjudge/sandbox
RUN cd /root/sandbox/libsandbox && ./configure && make install && ln -s /usr/local/lib/libsandbox.so /lib/libsandbox.so
RUN cd /root/sandbox/pysandbox && python3 setup.py install

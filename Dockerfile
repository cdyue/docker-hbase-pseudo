FROM openjdk:8
MAINTAINER yu zhao <nido.zhao@gmail.com>

#prepare system
ENV HBASE_HOME=/hbase-0.98.6-hadoop2

#download hbase
RUN wget https://archive.apache.org/dist/hbase/hbase-0.98.6/hbase-0.98.6-hadoop2-bin.tar.gz
RUN tar -zxvf hbase-0.98.6-hadoop2-bin.tar.gz
RUN rm hbase-0.98.6-hadoop2-bin.tar.gz

#update hbase configuration
COPY config/* /config/
COPY config/hbase-site.xml ${HBASE_HOME}/conf

#start hbase in pseudo distributed mode
COPY script/* /script/
CMD ["sh","/script/start-pseudo.sh"]

FROM openjdk:8
MAINTAINER yu zhao <nido.zhao@gmail.com>

#prepare system
RUN echo "vm.swappiness = 0" >> /etc/sysctl.conf
ENV HBASE_HOME=/hbase-1.2.0

#download hbase
RUN wget https://archive.apache.org/dist/hbase/1.2.0/hbase-1.2.0-bin.tar.gz
RUN tar -zxvf hbase-1.2.0-bin.tar.gz
RUN rm hbase-1.2.0-bin.tar.gz 

#update hbase configuration
COPY config/* /config/
COPY config/hbase-site.xml ${HBASE_HOME}/conf

#start hbase in pseudo distributed mode
COPY script/* /script/
CMD /bin/bash /script/start-pseudo.sh && /bin/bash

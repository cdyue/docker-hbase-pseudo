FROM openjdk:8
MAINTAINER yu zhao <nido.zhao@gmail.com>

#prepare system
RUN echo "vm.swappiness = 0" >> /etc/sysctl.conf
ENV HBASE_HOME=/hbase-0.98.12-hadoop2

#download hbase
RUN wget https://archive.apache.org/dist/hbase/hbase-0.98.12/hbase-0.98.12-hadoop2-bin.tar.gz
RUN tar -zxvf hbase-0.98.12-hadoop2-bin.tar.gz
RUN rm hbase-0.98.12-hadoop2-bin.tar.gz

#update hbase configuration
COPY config/* /config/
COPY config/hbase-site.xml ${HBASE_HOME}/conf

#start hbase in pseudo distributed mode
COPY script/* /script/
CMD sysctl -p
CMD /bin/bash /script/start-pseudo.sh && /bin/bash

FROM openshift/logstash-base:5.4.2

RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-translate
#ADD pipeline/ /usr/share/logstash/pipeline/
#ADD config/ /usr/share/logstash/config/
ADD log4j2.properties /usr/share/logstash/config/
ADD logstash.yml /usr/share/logstash/config/
RUN rm -f /usr/share/logstash/pipeline/logstash.conf && \
    chown 1001:0 /usr/share/logstash/config/log4j2.properties /usr/share/logstash/config/logstash.yml && \
    chmod og+rw /usr/share/logstash/config/log4j2.properties /usr/share/logstash/config/logstash.yml 
    
ADD GeoLite2-City.mmdb /etc/logstash/
USER 1001

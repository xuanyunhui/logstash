FROM openshift/logstash-base:5.4.2

RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-translate
#ADD pipeline/ /usr/share/logstash/pipeline/
#ADD config/ /usr/share/logstash/config/

RUN rm -f /usr/share/logstash/pipeline/logstash.conf && \
    chown 1001:0 /usr/share/logstash/data && chmod og+rw /usr/share/logstash/data
    
ADD GeoLite2-City.mmdb /etc/logstash/
USER 1001

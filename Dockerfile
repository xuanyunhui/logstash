FROM openshift/logstash-base:5.4.2

RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-translate
#ADD pipeline/ /usr/share/logstash/pipeline/
#ADD config/ /usr/share/logstash/config/

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
    
ADD GeoLite2-City.mmdb /etc/logstash/
USER logstash
RUN chown -R 1001:0 /usr/share/logstash/config && chmod -R og+rw /usr/share/logstash/config

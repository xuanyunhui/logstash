FROM docker.elastic.co/logstash/logstash:5.4.2

RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-translate
#ADD pipeline/ /usr/share/logstash/pipeline/
#ADD config/ /usr/share/logstash/config/

RUN rm -f /usr/share/logstash/pipeline/logstash.conf && \
    chmod -R og+rw /var/lib/logstash /var/log/logstash
    
COPY GeoLite2-City.mmdb /usr/share/GeoIP/GeoLite2-City.mmdb
USER default

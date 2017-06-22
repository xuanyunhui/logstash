RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-translate
#ADD pipeline/ /usr/share/logstash/pipeline/
#ADD config/ /usr/share/logstash/config/

RUN rm -f /usr/share/logstash/pipeline/logstash.conf && \
    chmod -R og+rw /var/lib/logstash /var/log/logstash && \
    mkdir /usr/share/GeoIP/
    
COPY GeoLite2-City.mmdb /usr/share/GeoIP/GeoLite2-City.mmdb
USER default

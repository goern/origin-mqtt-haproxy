FROM openshift/origin-haproxy-router

ADD haproxy-config.template  /var/lib/haproxy/conf/
   #   or you can use a diff name for the template.

#  Note: For the custom errorfiles, make sure you add those files in at the appropriate location.
#  Example:
#   ADD  custom/patrick/errors/400.http   /etc/haproxy/errors/400.http
ADD error-page-503.html /var/lib/haproxy/conf/
ADD error-page-502.html /var/lib/haproxy/conf/
WORKDIR  /var/lib/haproxy.conf

EXPOSE   80
EXPOSE 1883
ENV TEMPLATE_FILE=/var/lib/haproxy/conf/haproxy-config.template  
 #   or use a custom name from above if needed.
ENV RELOAD_SCRIPT=/var/lib/haproxy/reload-haproxy
ENTRYPOINT ["/usr/bin/openshift-router"]

#RUN rm -f /var/lib/haproxy/conf/*.html

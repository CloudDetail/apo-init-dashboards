FROM busybox:1.36.1

RUN mkdir -p /app/dashboards
RUN mkdir -p /app/plugins

COPY dashboards /app/dashboards
COPY plugins /app/plugins
COPY ./dashboardproviders.yaml /app/

WORKDIR /app

CMD ["sh", "-c", "cp -r ./dashboards/* /var/lib/grafana/dashboards/ && echo 'Dashboards copied' || echo 'Failed to copy dashboards'; \
      cp ./dashboardproviders.yaml /etc/grafana/provisioning/dashboards/ && echo 'Dashboard providers copied' || echo 'Failed to copy dashboard providers'; \
      cp -r ./plugins/ /var/lib/grafana/plugins/ && echo 'Plugins copied' || echo 'Failed to copy plugins'"]

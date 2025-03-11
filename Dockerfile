FROM busybox:1.36.1

RUN mkdir -p /app/dashboards
RUN mkdir -p /app/plugins

COPY dashboards /app/dashboards
COPY plugins /app/plugins
COPY ./dashboardproviders.yaml /app/

WORKDIR /app

CMD ["sh", "-c", "cp -r ./dashboards /var/lib/grafana/dashboards &\
      cp ./dashboardproviders.yaml /etc/grafana/provisioning/dashboards/ &\
      cp -r ./plugins/ /var/lib/grafana/plugins/"]

FROM busybox:1.36.1

RUN mkdir -p /app/dashboards
RUN mkdir -p /app/plugins

COPY dashboards /app/dashboards
COPY plugins /app/plugins

WORKDIR /app

CMD ["sh", "-c", "cp -r ./dashboards/${LANGUAGE}/default /var/lib/grafana/dashboards/ &\
      cp -r ./dashboards/${LANGUAGE}/middleware /var/lib/grafana/dashboards/ &\
      cp ./dashboards/${LANGUAGE}/dashboardproviders.yaml /etc/grafana/provisioning/dashboards/ &\
      cp -r ./plugins/ /var/lib/grafana/plugins/"]

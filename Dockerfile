# Verwende die aktuellste Node.js-Version (Node 20 ist die neueste LTS, aber "latest" ist auch okay)
FROM node:latest

# Setze das Arbeitsverzeichnis
WORKDIR /app

# Installiere Git, um Repositories klonen zu können
RUN apt-get update && apt-get install -y git

# Kopiere das Startskript
COPY bootstrap.sh /usr/local/bin/bootstrap.sh
RUN chmod +x /usr/local/bin/bootstrap.sh

# Definiere Standard-Umgebungsvariablen (überschreibbar)
ENV GIT_URL=https://github.com/janhajk/fronius_2_influx.git \
    APP_STARTUP=logData.js \
    FRONIUS_IP=192.168.1.92 \
    LOG=false \
    INFLUX_HOST=influxdb \
    INFLUX_PORT=8086 \
    # InfluxDB 1.x Variablen
    INFLUX_USER=grafana \
    INFLUX_PSW=11pMw0 \
    INFLUX_DB=grafana \
    # InfluxDB 2.x Variablen
    INFLUX_TOKEN=your-influxdb-token \
    INFLUX_ORG=your-org \
    INFLUX_BUCKET=your-bucket

# Starte das Skript beim Container-Start
ENTRYPOINT ["/usr/local/bin/bootstrap.sh"]
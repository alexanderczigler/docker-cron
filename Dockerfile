FROM debian:12.10

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install cron

CMD printenv > /etc/environment && crontab /etc/cron.d/crontab && chmod -R 0644 /etc/cron.d && cron && sh -c "touch /var/log/cron.log && tail -f /var/log/cron.log"

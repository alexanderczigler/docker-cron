# docker-cron
A debian-based docker image for producing images running cronjob(s).

```bash
docker pull alexanderczgiler/cron
```

When using this, base your image on the `alexanderczgiler/cron` and create a file named `crontab` that you add to the image you are building. The file needs to be named `/etc/cron.d/crontab`. Unless you override the **CMD** of the image, it will tail the `/var/log/cron.log` so that you can see the output of your job(s).

Example crontab

```crontab
0 0,6,12,18 * * * /bin/sh /your-script.sh >> /var/log/cron.log
# NOTE: keep an empty line at the end

```

Example Dockerfile

```Dockerfile
FROM alexanderczgiler/cron
ADD ./crontab /etc/cron.d/crontab # NOTE: Keep the filename "crontab".
```
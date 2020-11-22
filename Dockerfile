FROM alpine:3.9

RUN set -xe && \
    apk add --no-cache python3 tzdata git && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache && \
    pip install icloudpd && \
    icloudpd --version && \
    icloud -h | head -n1

RUN set -xe && \
    echo -e "#!/bin/sh\nicloudpd --directory /data --username \${USERNAME} --size original --recent \${RECENT} --folder-structure \${FOLDERSTRUCTURE} " > /home/icloud.sh && \
    chmod +x /home/icloud.sh && \
    echo -e "#!/bin/sh\ncp /usr/share/zoneinfo/\${TZ} /etc/localtime\necho -e \"\${CRON} /home/icloud.sh\" > /home/icloud.crontab\n/usr/bin/crontab /home/icloud.crontab\n/usr/sbin/crond -f -l 8" > /home/entry.sh && \
    chmod +x /home/entry.sh

CMD ["/home/entry.sh"]





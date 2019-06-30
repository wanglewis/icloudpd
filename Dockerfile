FROM alpine:3.9

RUN set -xe && \
    apk add --no-cache python3 tzdata git && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache && \
    pip install git+https://github.com/PeterHedley94/pyicloud.git@6e1d1ff3698eaccd841c5c977ffad77421c3f04e && \
    pip install git+https://github.com/shuixin536/icloud_photos_downloader.git@1867d74a8da04344a99dea10766f0d7cf6fbbd64 && \
    icloudpd --version && \
    icloud -h | head -n1

RUN set -xe && \
    echo -e "#!/bin/sh\nicloudpd /data --username \${USERNAME} --password \${PASSWORD} --size original --recent \${RECENT} --album \${ALBUM} --folder-structure \${FOLDERSTRUCTURE} " > /home/icloud.sh && \
    chmod +x /home/icloud.sh && \
    echo -e "#!/bin/sh\ncp /usr/share/zoneinfo/\${TZ} /etc/localtime\necho -e \"\${CRON} /home/icloud.sh\" > /home/icloud.crontab\n/usr/bin/crontab /home/icloud.crontab\n/usr/sbin/crond -f -l 8" > /home/entry.sh && \
    chmod +x /home/entry.sh

CMD ["/home/entry.sh"]





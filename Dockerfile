FROM alpine:latest

RUN set -xe && \
    apk add --no-cache python3 tzdata git && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

ARG ICLOUDPD_VERSION

COPY dist/* /tmp
RUN set -xe \
  && pip install wheel==0.35.1 \
  && pip install /tmp/icloudpd-${ICLOUDPD_VERSION}-py2.py3-none-any.whl \
  && icloudpd --version \
  && icloud -h | head -n1

RUN set -xe && \
    echo -e "#!/bin/sh\nicloudpd --directory /data --cookie-directory /config --username \${USERNAME} --folder-structure \${FOLDERSTRUCTURE} \${CLIFOPTIONS} " > /home/icloud.sh && \
    chmod +x /home/icloud.sh && \
    echo -e "#!/bin/sh\ncp /usr/share/zoneinfo/\${TZ} /etc/localtime\necho -e \"\${CRON} /home/icloud.sh\" > /home/icloud.crontab\n/usr/bin/crontab /home/icloud.crontab\n/usr/sbin/crond -f -l 8" > /home/entry.sh && \
    chmod +x /home/entry.sh && \
    echo -e "#!/bin/sh\nicloud --username \${USERNAME} " > /home/savepassword.sh && \
    chmod +x /home/savepassword.sh
    
    
    
CMD ["/home/entry.sh"]





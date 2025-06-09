FROM python:3.12
RUN <<EOF
pip install git+https://github.com/samanamonitor/samm-xen-exporter.git
EOF
COPY config.json /app/config.json
ENTRYPOINT [ "/usr/local/bin/python3", "/usr/local/bin/exporter.py" ]

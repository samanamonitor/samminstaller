FROM python:3.12
RUN <<EOF
pip install git+https://github.com/samanamonitor/samm-xen-exporter.git
EOF
ENTRYPOINT [ "/usr/local/bin/exporter.py" ]

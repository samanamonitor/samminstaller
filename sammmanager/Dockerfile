FROM python:3.12
RUN <<EOF
pip install git+https://github.com/samanamonitor/pysammmanager.git
EOF
ENTRYPOINT [ "/usr/local/bin/uwsgi", "--http", ":9090", "--wsgi-file", "/usr/local/bin/manager.py" ]

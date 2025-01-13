FROM python:3.12
RUN <<EOF
apt update
apt install -y libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev libsnmp-dev
pip install git+https://github.com/samanamonitor/pysamm.git
pip install git+https://github.com/samanamonitor/pysammsnmp.git
pip install git+https://github.com/samanamonitor/pysammwr.git
pip install git+https://github.com/samanamonitor/pysammodata.git
pip install git+https://github.com/samanamonitor/pysammaws.git
EOF

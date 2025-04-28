FROM python:3.12
RUN <<EOF
apt update
apt install -y libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev libsnmp-dev libsasl2-modules-ldap libsasl2-modules-gssapi-mit
pip install git+https://github.com/samanamonitor/pysamm.git
pip install git+https://github.com/samanamonitor/pysammsnmp.git
pip install git+https://github.com/samanamonitor/pysammwr.git
pip install git+https://github.com/samanamonitor/pysammodata.git
pip install git+https://github.com/samanamonitor/pysammaws.git
pip install pykerberos
EOF
COPY mibs/* /usr/share/snmp/mibs

FROM ansibleplaybookbundle/apb-base

LABEL "com.redhat.apb.version"="0.1.0"
LABEL "com.redhat.apb.spec"=\
"dmVyc2lvbjogMS4wCm5hbWU6IGtleWNsb2FrLWpvc2UtYXBiCmRlc2NyaXB0aW9uOiBLZXljbG9h\
ayAtIE9wZW4gU291cmNlIElkZW50aXR5IGFuZCBBY2Nlc3MgTWFuYWdlbWVudApiaW5kYWJsZTog\
VHJ1ZQphc3luYzogb3B0aW9uYWwKdGFnczogCiAgLSBtb2JpbGUtc2VydmljZQptZXRhZGF0YToK\
ICBkaXNwbGF5TmFtZTogS2V5Y2xvYWsgSm9zZQogIGltYWdlVXJsOiAiaHR0cHM6Ly9wYnMudHdp\
bWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzcwMjExOTgyMTk3OTM0NDg5Ny9vQUMwNWNFQl80MDB4NDAw\
LnBuZyIKICBkb2N1bWVudGF0aW9uVXJsOiAiaHR0cDovL3d3dy5rZXljbG9hay5vcmcvZG9jdW1l\
bnRhdGlvbi5odG1sIgogIHByb3ZpZGVyRGlzcGxheU5hbWU6ICJSZWQgSGF0LCBJbmMuIgogIGRl\
cGVuZGVuY2llczogWydQb3N0Z3Jlc3FsOjkuNSddCiAgc2VydmljZU5hbWU6IGtleWNsb2FrLWpv\
c2UKcGxhbnM6CiAgLSBuYW1lOiBkZWZhdWx0CiAgICBkZXNjcmlwdGlvbjogRGVwbG95IGtleWNs\
b2FrCiAgICBmcmVlOiBUcnVlCiAgICBtZXRhZGF0YToge30KICAgIHBhcmFtZXRlcnM6IAogICAg\
LSBuYW1lOiBBRE1JTl9OQU1FCiAgICAgIHJlcXVpcmVkOiBUcnVlCiAgICAgIGRlZmF1bHQ6IGFk\
bWluCiAgICAgIHR5cGU6IHN0cmluZwogICAgICB0aXRsZTogS2V5Y2xvYWsgYWRtaW4gdXNlcm5h\
bWUKICAgIC0gbmFtZTogQURNSU5fUEFTU1dPUkQKICAgICAgcmVxdWlyZWQ6IFRydWUKICAgICAg\
ZGVmYXVsdDogYWRtaW4KICAgICAgdHlwZTogc3RyaW5nCiAgICAgIHRpdGxlOiBLZXljbG9hayBh\
ZG1pbiBwYXNzd29yZAogICAgYmluZF9wYXJhbWV0ZXJzOgogICAgLSBuYW1lOiBzZXJ2aWNlCiAg\
ICAgIHRpdGxlOiBUaGUgc2VydmljZSB0aGUgY2xpZW50IGlzIGZvcgogICAgICB0eXBlOiBzdHJp\
bmcK"



COPY playbooks /opt/apb/actions
COPY roles /opt/ansible/roles
COPY vars /opt/ansible/vars
RUN ansible-galaxy install -r /opt/apb/actions/requirements.yml -p /opt/ansible/roles
RUN chmod -R g=u /opt/{ansible,apb}
USER apb

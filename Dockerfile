FROM centos:7

RUN yum update -y \
  && yum install -y epel-release yum-plugin-priorities \
  && curl -o /etc/yum.repos.d/powerdns-auth-43.repo https://repo.powerdns.com/repo-files/centos-auth-43.repo \
  && yum install -y pdns pdns-backend-mysql \
  && rm -rf /var/cache/yum \
  && yum clean all

CMD ["/usr/sbin/pdns_server"]

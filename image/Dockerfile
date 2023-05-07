FROM phusion/baseimage:master
MAINTAINER Mailtop <joao.scotto@mailtop.com.br>
LABEL versao="2.7.7"

ADD . /pd_build
RUN /pd_build/install.sh
CMD ["/sbin/my_init"]
EXPOSE 80 443

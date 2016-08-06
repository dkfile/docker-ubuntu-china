FROM ubuntu

COPY ./opt/* /opt/

RUN sed -i 's/archive.ubuntu.com/mirrors.yun-idc.com/g' /etc/apt/sources.list && \
  cd /opt/ && \
  mv /opt/locale /etc/default/locale

RUN mkdir -p /var/lib/locales/supported.d

ENV TZ="Asia/Shanghai"

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
  echo "zh_CN.UTF-8 UTF-8" > /var/lib/locales/supported.d/local && \
  echo "en_US.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local && \
  echo "en_GB.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local && \
  locale-gen

ENV LANG=en_GB.UTF-8
ENV LANGUAGE=en_GB:en
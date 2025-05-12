FROM ubuntu:22.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y  curl  && curl -fsSL https://get.htcondor.org | /bin/bash -s -- --no-dry-run  && apt-get clean  && rm -rf /var/lib/apt/lists/*

COPY condor/  /etc/condor


CMD ["/usr/sbin/condor_master", "-f"]

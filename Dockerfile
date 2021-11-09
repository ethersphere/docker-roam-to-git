FROM ubuntu:20.04 as roam-to-git-build-stage

RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends python3-pip git unzip && \
	apt-get clean && \
	pip3 install git+https://github.com/MatthieuBizien/roam-to-git.git@master

ADD https://github.com/borkdude/jet/releases/download/v0.1.0/jet-0.1.0-linux-amd64.zip /tmp
RUN unzip -d /usr/local/bin /tmp/jet-0.1.0-linux-amd64.zip

# Real image
FROM ubuntu:20.04
RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends python3-pip git firefox-geckodriver && \
	apt-get clean 
COPY --from=roam-to-git-build-stage /usr/local/ /usr/local
COPY backup-roam.sh /backup-roam.sh
RUN chmod +x /backup-roam.sh

ENTRYPOINT [ "/backup-roam.sh" ]


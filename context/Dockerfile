FROM andzuc/debian-base
LABEL maintainer "Andrea Zuccherelli <andrea@zuccherelli.net>"

ARG DOWNDIR=/tmp/download
ARG INSTDIR=/opt/vscodium
# https://github.com/microsoft/vscode/issues/133449
#ARG REPOAPI="https://api.github.com/repos/VSCodium/vscodium/releases/latest"
ARG REPOAPI="https://api.github.com/repos/VSCodium/vscodium/releases/tags/1.55.0"

RUN apt-get install -y --no-install-recommends --no-install-recommends --no-install-suggests --allow-unauthenticated \
    gnupg \
    ca-certificates \
    curl \
    && mkdir -p ${DOWNDIR} ${INSTDIR} \
    && cd ${DOWNDIR} \
    && curl -vs ${REPOAPI} \
	| grep browser_download_url \
	| grep linux-x64 \
	| cut -d '"' -f 4 \
	| head -n1 \
	| xargs -n 1 curl -OL \
    && tar xvf ${DOWNDIR}/VSCodium*.gz -C ${INSTDIR} \
    && apt-get install -y --no-install-recommends --no-install-recommends --no-install-suggests --allow-unauthenticated \
    libglib2.0-0 \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libgtk2.0-0 \
    libgbm1 \
    libasound2 \
    libx11-xcb1 \
    libgtk-3-0 \
    && apt-get remove --purge -y \
	       gnupg \
	       curl \
    && apt-get -y autoremove \
    && apt-get -y clean

#COPY VSCode-linux-x64 /opt/vscodium/

RUN useradd -m vscodium
USER vscodium
ENV HOME /home/vscodium
WORKDIR $HOME
VOLUME $HOME
ENTRYPOINT ["/opt/vscodium/bin/codium"]

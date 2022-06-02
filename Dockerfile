FROM python:3.9

ARG OPENVSCODE_SERVER_VERSION=1.67.2

RUN curl -fOL https://github.com/gitpod-io/openvscode-server/releases/download/openvscode-server-v${OPENVSCODE_SERVER_VERSION}/openvscode-server-v${OPENVSCODE_SERVER_VERSION}-linux-x64.tar.gz && \
    mkdir -p /opt/openvscode-server && \
    tar -xvf openvscode-server-v${OPENVSCODE_SERVER_VERSION}-linux-x64.tar.gz -C /opt/openvscode-server --strip-components=1 && \
    chown -R root:root /opt/openvscode-server && \
    rm openvscode-server-v${OPENVSCODE_SERVER_VERSION}-linux-x64.tar.gz

RUN useradd -s /bin/bash -r vscode
RUN mkdir -p /home/vscode && chown -R vscode /home/vscode
WORKDIR /home/vscode

USER vscode
RUN python -m pip install poetry && echo "export PATH=/home/vscode/.local/bin:${PATH}" >> ~/.bashrc
RUN /opt/openvscode-server/bin/openvscode-server --install-extension ms-python.python

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

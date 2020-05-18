# Version 1.0 template-transformer-simple

FROM ubuntu:18.04

LABEL maintainer="Emmanuel Gonzalez <emmanuelgonzalez@email.arizona.edu>"

WORKDIR /opt
COPY . /opt

COPY requirements.txt packages.txt /home/extractor/

USER root

RUN apt-get install -y python3.6-dev \
                       python3-pip \

RUN [ -s /home/extractor/packages.txt ] && \
    (echo 'Installing packages' && \
        apt-get update && \
        cat /home/extractor/packages.txt | xargs apt-get install -y --no-install-recommends && \
        rm /home/extractor/packages.txt && \
        apt-get autoremove -y && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*) || \
    (echo 'No packages to install' && \
        rm /home/extractor/packages.txt)

RUN [ -s /home/extractor/requirements.txt ] && \
    (echo "Install python modules" && \
    python3 -m pip install -U --no-cache-dir pip && \
    python3 -m pip install --no-cache-dir setuptools && \
    python3 -m pip install --no-cache-dir -r /home/extractor/requirements.txt && \
    rm /home/extractor/requirements.txt) || \
    (echo "No python modules to install" && \
    rm /home/extractor/requirements.txt)

ENTRYPOINT [ "/usr/bin/python3", "/opt/plot_clip.py" ]

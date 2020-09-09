#FROM ubuntu:20.04
FROM debian:bullseye-slim

# Maintainer:
MAINTAINER DataSpott

RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && apt-get -y install python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install python-modules:
RUN pip3 install install pandas \
    && pip3 install altair \
    && pip3 install xlrd \
    && pip3 install scipy \
    && pip3 install tabulate \
    && pip3 install IPython \
    && pip3 install tqdm \
    && pip3 install widgetsnbextension \
    && pip3 install webencodings \
    && mkdir /results

# Copy the SGT_Analyser-directory:
COPY ./ /SGT_Analyser/


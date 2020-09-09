# Initialize OS:
FROM debian:bullseye-20200803-slim

# Labels:
LABEL maintainer="DataSpott"

# Update OS:
RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && apt-get -y install python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install python-modules:
RUN pip3 install install pandas==1.1.2 \
    && pip3 install altair==4.1.0 \
    && pip3 install xlrd==1.2.0 \
    && pip3 install scipy==1.5.2 \
    && pip3 install tabulate==0.8.7 \
    && pip3 install IPython==7.18.1 \
    && pip3 install tqdm==4.48.2 \
    && pip3 install widgetsnbextension==3.5.1 \
    && pip3 install webencodings==0.5.1 \
    && mkdir /results

# Copy the SGT_Analyser-directory:
COPY ./ /SGT_Analyser/


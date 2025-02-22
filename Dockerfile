FROM ubuntu:latest

EXPOSE 8555
EXPOSE 8444

# chia start {all | node | harvester | farmer | farmer-no-wallet | farmer-only | timelord
# timelord-only | timelord-launcher-only | wallet | wallet-only | introducer | simulator}
# keys {mnemonic | new | file | ca} - my proposal

ENV keys="generate" \ 
  harvester="false" \
  farmer="false" \
  plots_dir="/plots" \
  farmer_address="null" \
  farmer_port="null" \
  testnet="false" \
  full_node_port="8555" \
  CHIA_BRANCH=latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  acl \
  ansible \
  apt \
  bash \
  build-essential \
  ca-certificates \
  curl \
  git \
  jq \
  nfs-common \
  openssl \
  python-is-python3 \
  python3 \
  python3-dev \
  python3-pip \
  python3.8-distutils \
  python3.8-venv \
  sudo \
  tar \
  tzdata \
  unzip \
  vim \
  wget \
  && git clone --branch ${CHIA_BRANCH} https://github.com/Chia-Network/chia-blockchain.git \
  && cd chia-blockchain \
  && git submodule update --init mozilla-ca \
  && chmod +x install.sh \
  && /usr/bin/sh ./install.sh

WORKDIR /chia-blockchain
ADD ./entrypoint.sh entrypoint.sh

ENTRYPOINT ["bash", "./entrypoint.sh"]

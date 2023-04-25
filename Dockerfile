FROM ubuntu:22.04

# For opencontainers label definitions, see:
#    https://github.com/opencontainers/image-spec/blob/master/annotations.md

LABEL org.opencontainers.image.title="hello"
LABEL org.opencontainers.image.description="demo the packing python project docker image"
LABEL org.opencontainers.image.authors="Jiang Zhu"

# Dynamic lables to define at build time via `docker build --label`

RUN apt update \
    && apt upgrade -y \
    && apt install -y python3 python3-pip \
	wget git vim \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /demo_hello/

ARG CONDA_GID=1001
ARG CONDA_UID=1001

RUN groupadd -g "${CONDA_GID}" --system conda \
    && useradd -l -u "${CONDA_UID}" -g "${CONDA_GID}" --system -d /home/conda -m -s /bin/bash conda

USER ${CONDA_UID}
SHELL ["/bin/bash", "-l", "-c"]

WORKDIR /home/conda/

ENTRYPOINT ["python3","/demo_hello/demo_hello/hello.py"]

CMD ["-h"]

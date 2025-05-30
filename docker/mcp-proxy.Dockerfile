FROM ubuntu:22.04

# 设置环境变量，确保后续的命令不会等待用户输入
ENV DEBIAN_FRONTEND=noninteractive

### change the system source for installing libs
ARG USE_SRC_INSIDE=true
RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list ; \
    sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list ; \
    echo "Use aliyun source for installing libs" ;

RUN apt-get update && apt-get install -y --no-install-suggests --no-install-recommends  vim wget curl python3 python3-pip  python3-venv

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple 

# make some useful symlinks that are expected to exist
RUN ln -sf /usr/bin/pydoc3 /usr/local/bin/pydoc
RUN ln -sf /usr/bin/python3 /usr/local/bin/python

# setup jupyter
RUN pip install jupyterlab
RUN pip install jupyter-core
RUN pip install --upgrade jupyter
RUN pip install --upgrade ipykernel
RUN pip install ipywidgets
COPY jupyter_lab_config.py /root/.jupyter/jupyter_lab_config.py

# setup uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# setup mcp-proxy
RUN uv tool install mcp-proxy
# RUN uv tool install git+https://github.com/sparfenyuk/mcp-proxy

ENV PATH="/root/.local/bin:${PATH}"
WORKDIR /workspace
COPY mcp-servers.json /workspace

# alias
RUN echo "alias ll='ls $LS_OPTIONS -l'" >> /root/.bashrc

# timezone
RUN echo 'export LANG="C.UTF-8"'>>/root/.bashrc; \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    echo "Asia/Shanghai" > /etc/timezone

COPY entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["sh", "/opt/entrypoint.sh"]
# Co-coded with Deepseek V3
# 构建阶段
FROM python:3.12-alpine as builder

# 安装构建依赖和git
RUN apk add --no-cache \
    git \
    build-base \
    libffi-dev \
    openssl-dev

# 安装uv到系统Python
RUN pip install --no-cache-dir uv

# 创建并切换到工作目录
WORKDIR /app

# 复制项目文件（假设需要git clone，这里改为复制本地文件）
RUN git clone https://github.com/Genshin-bots/gsuid_core.git --depth=1 --single-branch

# 使用uv创建虚拟环境并安装依赖
RUN python -m uv venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# 安装项目依赖（如果有requirements.txt）
WORKDIR /app/gsuid_core
RUN uv sync && uv run python -m ensurepip

# 清理不需要的文件
RUN find /opt/venv -type d -name '__pycache__' -exec rm -rf {} + && \
    find /opt/venv -type f -name '*.pyc' -delete

# 最终阶段
FROM python:3.12-alpine

# 从构建阶段复制虚拟环境和项目文件
COPY --from=builder /opt/venv /opt/venv \
                    /app/gsuid_core /app/gsuid_core

# 设置环境变量和工作目录
ENV PATH="/opt/venv/bin:$PATH"
WORKDIR /app/gsuid_core

# 合并所有安装操作为一个RUN指令
RUN apk add --no-cache git && \
    pip install --no-cache-dir uv

# 设置容器启动命令
CMD ["uv", "run", "core"]

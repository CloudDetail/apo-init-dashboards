# 使用 busybox 作为基础镜像
FROM busybox:1.36.1

# 创建目标目录 /dashboard
RUN mkdir -p /dashboards

# 将当前目录下的 dashboard 复制到 /dashboard
COPY dashboards /dashboards

# 设置工作目录
WORKDIR /dashboards

# 默认展示 dashboard 目录内容
CMD ["sh", "-c", "cp -r /dashboards/ /tmp/"]

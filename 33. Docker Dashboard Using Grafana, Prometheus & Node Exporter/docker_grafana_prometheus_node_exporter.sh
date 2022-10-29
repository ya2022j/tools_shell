


https://dbt3ch.com/books/prometheus-grafana-dashboard

三、使用Docker部署Grafana步骤
1、使用 docker pull grafana/grafana:7.3.6 拉取镜像
我这里使用的是7.3.6版本，各位看官请随意



2、启动容器
docker run \
--user root \
-d \
-p 3000:3000 \
--name=grafana \
-v /home/grafana:/var/lib/grafana \
grafana/grafana:7.3.6


3、访问服务器域名/IP:3000
注意：默认账号和密码都是admin，登录后会提示是否修改默认密码

注意：默认账号和密码都是admin，登录后会提示是否修改默认密码

1.安装Node Exporter


docker run -d -p 9100:9100 \
-v "/proc:/host/proc" \
-v "/sys:/host/sys" \
-v "/:/rootfs" \
-v "/etc/localtime:/etc/localtime" \
--net=host \
prom/node-exporter \
--path.procfs /host/proc \
--path.sysfs /host/sys \
--collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"


 docker ps|grep exporter

 2.安装cAdvisor
 所有服务器安装
cAdvisor 收集docker信息，用于展示docker的cpu、内存、上传下载等信息
–net=host，这样 Prometheus Server 可以直接与 cAdvisor 通信

docker run -d \
-v "/etc/localtime:/etc/localtime" \
--volume=/:/rootfs:ro \
--volume=/var/run:/var/run:rw \
--volume=/sys:/sys:ro \
--volume=/var/lib/docker/:/var/lib/docker:ro \
--volume=/dev/disk/:/dev/disk:ro \
--publish=18104:8080 \
--detach=true \
--name=cadvisor \
--privileged=true \
google/cadvisor:latest

3.安装 Prometheus Server
监控端安装

1）编辑配置文件

首先在本地创建 prometheus.yml 这是普罗米修斯的配置文件
将下方内容写入到文件中
将监听的地址改为自己本机地址



# my global config
global:
  scrape_interval:     15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).

# Alertmanager configuration
alerting:
  alertmanagers:
  - static_configs:
    - targets:
      # - alertmanager:9093

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  # - "first_rules.yml"
  # - "second_rules.yml"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: 'prometheus'

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
    #监听的地址
    - targets: ['localhost:9090','192.168.188.129:8088','192.168.188.129:9090']


mkdir Prometheus

 cd  Prometheus

 vim prometheus.yml
global:
  scrape_interval: 5s
  external_labels:
    monitor: 'node'
scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['192.168.188.129:9090'] ## IP Address of the localhost. Match the port to your container port
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['192.168.188.129:9100'] ## IP Address of the localhost

docker run -d --name prometheus -p 9090:9090 -v /home/Prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus



global:
  scrape_interval:     60s
  evaluation_interval: 60s

scrape_configs:

  - job_name: prometheus
    static_configs:
      - targets: ['localhost:9090']
        labels:
          instance: prometheus

  - job_name: linux
    static_configs:
      - targets: ['192.168.188.129:9100']
        labels:
          instance: localhost
  - job_name: cadvisor
    static_configs:
      - targets: ['192.168.188.129:8080']
        labels:
          instance: cAdvisor

  - job_name: mysqld
    static_configs:
      - targets: ['192.168.188.129:9104']
        labels:
          instance: mysql-exporter

docker run  -d --name prometheus --restart=always -p 9090:9090 -v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus



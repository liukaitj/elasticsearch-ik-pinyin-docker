# elasticsearch-ik-pinyin-docker
根据已有的 [docker镜像](https://github.com/hangxin1940/docker-elasticsearch-cn) 扩展出的支持 [ik-pinyin](https://github.com/liukaitj/elasticsearch-analysis-ik-pinyin) 插件的docker镜像。

## 基础镜像
java:8-jre

## 部署方法
### 获取镜像
    docker pull liukaitj/elasticsearch-ik-pinyin-docker:1.6.0P

### 启动镜像
    docker run --name esdocker -p 9200:9200 -p 9300:9300 -v /path/to/data:/data -v /path/to/logs:/logs -e CLUSTER_NAME=elasticsearch --rm=false -d liukaitj/elasticsearch-ik-pinyin-docker:1.6.0P

* -e 参数说明

传入docker container的环境变量对应着elasticsearch.yml中的配置信息，如：

    CLUSTER_NAME  对应  cluster.name
    NODE_NAME     对应  node.name

等等。详细可配置参数请参考 [docker-entrypoint.sh](https://github.com/liukaitj/elasticsearch-ik-pinyin-docker/blob/master/docker-entrypoint.sh) 中的环境变量信息。


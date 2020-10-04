## 다중 웹 서버 인스턴스 만들기

Nginx 웹 서버 클러스터를 만들려면 다음을 만드세요.

- 모든 가상 머신 인스턴스 시작 시 Nginx 서버를 설정하는 데 사용할 시작 스크립트
- 시작 스크립트를 사용하기 위한 인스턴스 템플릿
- 대상 풀
- 인스턴스 템플릿을 사용하는 관리형 인스턴스 그룹

```bash
# 시작 스크립트 만들기
cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF
```

```bash
# 위의 스크립트를 사용하는 템플릿 만들기
gcloud compute instance-templates create nginx-template \
         --metadata-from-file startup-script=startup.sh
```

```bash
# 대상 풀 만들기
gcloud compute target-pools create nginx-pool
```

```bash
# 관리형 인스턴스 그룹 만들기
gcloud compute instance-groups managed create nginx-group \
         --base-instance-name nginx \
         --size 2 \
         --template nginx-template \
         --target-pool nginx-pool
```

```bash
# 인스턴스 확인
gcloud compute instances list
```

```bash
# 방화벽 구성 (포트:80)
gcloud compute firewall-rules create www-firewall --allow tcp:80
```



## 네트워크 부하 분산기 만들기

네트워크 부하 분산을 사용하면 주소, 포트, 프로토콜 유형과 같은 수신 IP 프로토콜 데이터를 기준으로 시스템의 부하를 분산할 수 있습니다. 

```bash
# L3 부하 분산기 만들기
gcloud compute forwarding-rules create nginx-lb \
         --region us-central1 \
         --ports=80 \
         --target-pool nginx-pool
```

```bash
# 전달 규칙 목록 확인
gcloud compute forwarding-rules list
```



## HTTP/HTTPS 부하 분산기 만들기

HTTP/HTTPS 부하 분산은 인스턴스를 대상으로 하는 HTTP(S) 요청에 관한 글로벌 부하 분산을 제공합니다. 

```bash
# 상태 확인
gcloud compute http-health-checks create http-basic-check
```

```bash
# 포트 이름 매핑
gcloud compute instance-groups managed \
       set-named-ports nginx-group \
       --named-ports http:80
```

```bash
# 백엔드 서비스 생성
gcloud compute backend-services create nginx-backend \
      --protocol HTTP --http-health-checks http-basic-check --global
```

```bash
# 백엔드 서비스에 인스턴스 그룹 추가
gcloud compute backend-services add-backend nginx-backend \
    --instance-group nginx-group \
    --instance-group-zone us-central1-a \
    --global
```

```bash
# 기본 URL 맵 생성
gcloud compute url-maps create web-map \
    --default-service nginx-backend
```

```bash
# HTTP 프록시 생성
gcloud compute target-http-proxies create http-lb-proxy \
    --url-map web-map
```

```bash
# 라우팅 규칙 생성
gcloud compute forwarding-rules create http-content-rule \
        --global \
        --target-http-proxy http-lb-proxy \
        --ports 80
```

```bash
# 구성 확인
gcloud compute forwarding-rules list
```


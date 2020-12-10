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


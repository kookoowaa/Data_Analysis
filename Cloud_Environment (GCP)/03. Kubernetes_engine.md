## Google Kubenetes Engine

- **GKE**에서는 Google 인프라를 사용하여 컨테이너식 앱을 배포, 관리 및 확장할 수 있는 관리형 환경을 제공

- GKE 환경은 컨테이너 클러스터를 형성하도록 여러 머신으로 구성되어 있음 (Compute Engine 등 1개 이상의 마스터와 노드 머신 여러개)

- GKE의 클러스터를 실행하면 다음과 같은 관리 기술의 이점을 활용 가능

  > 1. Compute Engine 인스턴스를 위한 부하 분산
  > 2. 노드 풀로 하위 노드 집합을 지정하여 유연성 강화
  > 3. 자동 확장 및 업그레이드
  > 4. 로깅 및 모니터링 (stackdriver)

## 컴퓨팅 영역 설정

- 앞서 학습하였듯이 기본적으로 다음과 같이 기본 설정을 확인 가능:

  ```bash
  gcloud auth list
  
  Credentialed accounts:
  - <myaccount>@<mydomain>.com (active)
  ```

  ```bash
  gcloud config list project
  
  [core]
  project = <project_ID>
  ```

- 기본 컴퓨팅 영역은 `gcloud` 명령어로 설정 가능:

  ```bash
  gcloud config set compute/zone us-central1-a
  
  Updated property [compute/zone].
  ```

## Kubernetes 클러스터 만들기

- Kubernetes 클러스터 역시 `gcloud` 명령어로 생성 가능:

  ```bash
  gcloud container clusters create [CLUSTER-NAME]
  ```

- 이때 기본으로 생성되는 Kubernetes 클러스터는 기본 컴퓨팅 영역에 3개의 NODE를 갖고 있는 클러스터로 설정됨:

  ```
  NAME        LOCATION       ...   NODE_VERSION  NUM_NODES  STATUS
  my-cluster  us-central1-a  ...   1.13.11-gke.9  3          RUNNING
  ```

- 만들어진 클러스터와 상호작용하려면 사용자 인증 정보를 얻어야 하며, 이때 `gcloud` 환경에서 인증 가능:

  ```bash
  gcloud container clusters get-credentials [CLUSTER-NAME]
  ```

## 클러스터에 앱 배포하기

- 클러스터가 생성된 후에는 **컨테이너식 애플리케이션**을(사전 빌드된 배포 템플릿이 포함된) 배포할 수 있음

- 이 앱들은 단순한 컨테이너 이미지가 아니라, Google에서 빌드한 오픈소스 상용 앱들인 만큼 생산성을 높일 수 있다는 장점이 있음

- 앱 배포는 배포 객체를 생성하는 단계와 서비스를 생성하는 단계가 있음

- 먼저 배포 객체는 다음과 같이 생성:

  ```bsh
  kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
  
  deployment.apps/hello-server created
  ```

  > 1. 위의 Kubernetes 명령어를 사용하면 `hello-server`를 나타내는 배포 객체가 생성 
  > 2. `--image`는 배포할 컨테이너 이미지를 지정하며  [Google Container Registry](https://cloud.google.com/container-registry/docs) 버킷에서 예시 이미지를 가져옴

- Kubernetes 서비스를 생성하는 명령어는 다음과 같음:

  ```bash
  kubectl expose deployment hello-server --type=LoadBalancer --port 8080
  
  service/hello-server exposed
  ```

  > 1. `--port`를 통해 컨테이너가 노출될 포트를 지정
  > 2. `type=LoadBalancer`는 부하 분산기를 생성

- 이렇게 생성된 클러스터 서비스는 다음 명령어로 상태를 확인할 수 있음:

  ```bash
  kubectl get service
  
  NAME           TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)          AGE
  hello-server   LoadBalancer   10.3.241.64   35.239.187.97   8080:32387/TCP   51s
  kubernetes     ClusterIP      10.3.240.1    <none>          443/TCP          3m46s
  ```

- 외부 IP 주소와 노출된 포트를 사용하면 서비스 출력 여부를 확인할 수 있음
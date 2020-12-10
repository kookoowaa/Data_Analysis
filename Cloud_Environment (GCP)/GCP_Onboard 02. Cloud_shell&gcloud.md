## Cloud Shell 사용하기

- GCP Console에서는 Cloud Shell 세션을 제공
- Cloud Shell에서는 Cloud SDK의 `gcloud` 명령어나 가상머신 인스턴스에서 사용할 수 있는 다른 도구를 호출 가능
- 또한 영구 디스크 저장소에서 사용되는 `$HOME` 디렉터리가 부여됨

## 리전 및 영역

- Compute Engine 리소스틑 리전(region) and/or 영역(zone)에 있으며, 각 리전에는 하나 이상의 영역이 있음

- Cloud Shell에서 다음 명령어를 사용하면, 기본 리전 및 영역을 확인할 수 있음:

  ```bash
  gcloud compute project-info describe --project <your_project_ID>
  ```

- 기본 리전을 변경할 때에는 다음과 같이 변경 가능:

  ```bash
  gcloud compute project-info add-metadata \
  	--metadata google-compute-default-region=<your_preferred_region>, google-compute-default-zone=<your_preferred_zone>
  ```

  이후 `gcloud init` 명령어를 실행하여 default 구성을 초기화

- `gcloud compute regions list`로 리전 리스트를 확인 가능

## gcloud로 가상머신 만들기

- 직전 강의에서 진행해 보았듯이, 다음 명령어로 가상 머신 생성가능:

  ```bash
  gcloud compute instances create gcelab2 --machine-type n1-standard-2 --zone <your_zone>
  ```

- 참고로 환경변수 설정 시 조금더 편하게 명령어 반복 실행 가능:

  ```bash
  export PROJECT_ID=<your_project_ID>
  export ZONE=<your_zone>
  
  echo $PROJECT_ID
  echo $ZONE
  ```

## gcloud 명령어 사용

- `gcloud` 사용 시 호출 명령어의 끝에 `-h`플래그를 추가하면 참고할 수 있는 설명이 함께 표시되며, 상세한 도움말이 필요할 때에는 `--help` 플래그를 추가

  ```bash
  gcloud -h
  
  gcloud --help
  ```

## gcloud interactive

- `gcloud`에서는 명령어 및 플래그를 자동으로 추천하는 인라인 도움말 스니펫을 표시하는 기능도 있음

- 이는 `google-cloud-sdk`를 설치해서 사용 가능하며, 다음 명령어로 `interactive`모드 전환이 가능:

  ```bash
  gcloud beta interactive
  ```

- `interactive` 모드에서는 자동완성 기능을 지원하며 **Tab**키 및 **스페이스바**를 사용하여 원하는 항목을 선택함

## VM 인스턴스에 SSH 사용

- `gcloud compute`를 사용하면 인스턴스에 쉽게 연결할 수 있음

- `gcloud compute ssh` 명령어는 SSH에 래퍼 기능까지 제공하여 인증 및 인스턴스 이름과 IP주소의 매핑을 처리함

- `gcloud`로 SSH에 연결하는 방법은 다음과 같음:

  ```bash
  gcloud compute ssh gcelab2 --zone <your_zone>
  ```

- 처음 접속 시 암호를 설정할 수 있으며 **Enter**키를 눌러 암호를 공백으로 둘 수도 있음

- SSH 연결 종료는 `exit`으로 가능
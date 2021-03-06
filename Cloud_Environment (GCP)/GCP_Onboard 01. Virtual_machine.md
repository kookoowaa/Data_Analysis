## VM 인스턴스 만들기

- VM 인스턴스는 GCP 콘솔에서, 혹은 command-line interface를 통해서 만들 수 있음
- 우선 GCP 콘솔에서 만드는 방법은, `메뉴 > Compute Engine > VM 인스턴스`에서 생성 가능
- 실행 시 설정할 수 있는 파라미터는 이름, 리전 및 영역, CPU와 RAM, 부팅디스크, 방화벽 등이 있음
- 방화벽에서 `HTTP 트래픽 허용`을 선택하면, 80 포트에서 HTTP 트래픽을 허용하기 위한 방화벽 규칙을 적용

## NGINX 웹서버 설치

- VM 인스턴스가 생성되면, SSH를 통해 인스턴스에 접속 가능

- `root` 사용자 권한을 획득해 두면 이후 프로세스가 편리

  ```bash
  sudo su -
  ```

- 기본적으로 OS를 업데이트를 한차례 진행할 필요가 있음

  ```bash
  apt update
  ```

- 업데이트 후에는 NGINX를 설치

  ```bash
  apt install nginx
  ```

- NGINX 설치 여부는 다음 명령어로 확인 가능

  ```bash
  ps auwx | grep nginx
  
  root      2330  0.0  0.0 159532  1628 ?        Ss   14:06   0:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
  www-data  2331  0.0  0.0 159864  3204 ?        S    14:06   0:00 nginx: worker process
  www-data  2332  0.0  0.0 159864  3204 ?        S    14:06   0:00 nginx: worker process
  root      2342  0.0  0.0  12780   988 pts/0    S+   14:07   0:00 grep nginx
  ```

- `nginx: master process`, `nginx: worker process`를 통해 정상적으로 NGINX가 돌아가고 있음을 확인 가능

## gcloud로 새 인스턴스 만들기

- 콘솔의 `Google Cloud Shell`, 혹은 `Cloud SDK`의 Command-line interface를 통해서도 새로운 인스턴스를 만들 수 있음

- 예제로 살펴보면 다음과 같음:

  ```bash
  gcloud compute instances create gcelab2 --machine-type n1-standard-2 --zone us-central1-c
  #gcloud compute instances create {인스턴스 이름} --machine-type {프리셋 머신 이름} --zone {영역}
  ```

- 기본 값을 확인 하려면 다음 명령어로 확인 가능

  ```bash
  gcloud compute instances create --help
  ```

- 상세한 gcloud 명령어는 다음 [페이지](https://cloud.google.com/sdk/gcloud/)에서 확인 가능

## gcloud에서 인스턴스 접속하기

- gcloud 명령어로 SSH를 통해 인스턴스에 연결할 수도 있음:

  ```bash
  gcloud compute ssh gcelab2 --zone us-central1-c
  # gcloud compute ssh {인스턴스 이름} --zone {영역}
  ```

- 처음 접속 시 비밀번호 설정에 대해 묻는데, 공란으로 둘 경우에는 **엔터**로 공백을 전달

- 연결을 종료할 때에는 셸에서 `exit`으로 SSH 연결을 해제

## Windows VM 인스턴스 만들기

- GCP에서는 windows VM 인스턴스도 지원하고 있음
- Windows 기반의 VM 인스턴스를 만들 때에는, "VM 인스턴스 만들기"에서 부팅디스크를 default인 Debian에서 변경
- Windows, Debian 외에도 원하는 OS 이미지로 VM 인스턴스 생성 가능

## 인스턴스에 연결

- Windows Server는 GUI를 지원하며, 해당 인스턴스는 RDP<sup>Remote Desktop Protocol</sup>를 통해 연결 가능

- 이때 다음 세단계를 거치게 됨:

  > 1. OS 구성요소를 초기화 하여 Windows server가 RDP 연결을 수락할 수 있도록 준비시킴
  >
  >    ```bash
  >    gcloud compute instances get-serial-port-output instance-1 --zone us-central1-a
  >    # Activation successful이 뜨면 준비가 되었다고 볼 수 있음
  >    ```
  >
  > 2. 비밀번호 설정
  >
  >    비밀번호는 "VM 인스턴스" 메뉴에서 {Instance 이름}을 클릭하면, **Set Windows Password**라는 버튼을 클릭하서 설정 가능
  >
  > 3. RDP로 인스턴스에 접속
  >
  >    다시 "VM 인스턴스" 메뉴, 혹은 {Instance 이름}의 하위 메뉴에서 RDP 버튼을 클릭하면, RDP 확장 프로그램을 통해 (크롬 제공) GUI에 연결 가능 (*위에서 설정한 비밀번호 필요*)

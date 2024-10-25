# 소프트웨어 장인 정신 이야기 테스트 환경

## jdk 설치
```bash
$ sudo mkdir -p /opt/jdk
$ sudo chown $USER:$USER /opt/jdk
$ wget -O - https://corretto.aws/downloads/resources/17.0.13.11.1/amazon-corretto-17.0.13.11.1-linux-x64.tar.gz | tar zx -C /opt/jdk
```
Makefile의 BIN 경로를 맞춰주면 어디에 설치하든 상관 없음

## 실행
```bash
# 사용 가능한 테스트 확인
$ make usage
usage: make <stack>

# 특정 테스트 실행
# make <테스트 이름>
$ make stack

# 간편 실행
$ vi Makefile
all: stack    # usage를 stack으로 변경
$ make        # make stack과 같음
```

## 라이브라리 수동 설치
```bash
$ wget -P lib https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.11.2/junit-platform-console-standalone-1.11.2.jar
$ wget -P lib https://repo1.maven.org/maven2/org/hamcrest/hamcrest/3.0/hamcrest-3.0.jar
```

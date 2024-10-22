# 소프트웨어 장인 정신 이야기 테스트 환경

## 소스 코드
- Stack.java, StackTest.java - 46 페이지 // 시간: 01:09 Stack.java
- PrimeFactorsTest.java - 60 페이지

## jdk 설치
```bash
$ sudo mkdir -p /opt/jdk
$ sudo chown $USER:$USER /opt/jdk
# Makefile의 BIN 경로를 맞춰주면 버전은 아무 것이나 사용 가능
$ wget -O - https://corretto.aws/downloads/resources/17.0.13.11.1/amazon-corretto-17.0.13.11.1-linux-x64.tar.gz | tar zx -C /opt/jdk
```

## 실행
```bash
# stack 테스트
$ make stack

# prime 테스트
$ make prime

# make 만으로 stack 테스트
$ vi Makefile
all: stack  # stack 추가
$ make
```


## 라이브라리 수동 설치
```bash
$ wget -P lib https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.11.2/junit-platform-console-standalone-1.11.2.jar
$ wget -P lib https://repo1.maven.org/maven2/org/hamcrest/hamcrest/3.0/hamcrest-3.0.jar
```

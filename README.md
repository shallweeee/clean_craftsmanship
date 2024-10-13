# 소프트웨어 장인 정신 이야기 테스트 환경

46 페이지까지의 상태
// 시간: 01:09 Stack.java

## jdk 설치
```bash
$ sudo mkdir -p /opt/jdk
$ sudo chown $USER:$USER /opt/jdk
$ wget -O - https://corretto.aws/downloads/resources/17.0.13.11.1/amazon-corretto-17.0.13.11.1-linux-x64.tar.gz | tar zx -C /opt/jdk
```

## junit 설치
```bash
$ mkdir lib
$ wget -P ./lib https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.11.2/junit-platform-console-standalone-1.11.2.jar
```

## 실행
```bash
$ make
```

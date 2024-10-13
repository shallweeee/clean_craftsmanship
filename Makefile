BIN = /opt/jdk/amazon-corretto-17.0.13.11.1-linux-x64/bin
JAVA = $(BIN)/java
JAVAC = $(BIN)/javac

JUNIT = lib/junit-platform-console-standalone-1.11.2.jar

NOERR = | grep -v '^make:'

all: usage

usage:
	@[ -z "$<" ] && echo "usage: make <stack>" || true

clean:
	rm -rf out

$(JUNIT):
	wget -P lib https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.11.2/junit-platform-console-standalone-1.11.2.jar

stack: $(JUNIT)
	$(eval OUT=out/$@)
	$(JAVAC) -d $(OUT) src/$@/Stack.java
	$(JAVAC) -d $(OUT) -cp $(OUT):$(JUNIT) test/$@/StackTest.java
	$(JAVA) -jar $(JUNIT) execute -cp $(OUT) --scan-class-path $(NOERR)

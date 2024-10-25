BIN = /opt/jdk/amazon-corretto-17.0.13.11.1-linux-x64/bin
JAVA = $(BIN)/java
JAVAC = $(BIN)/javac

JUNIT = lib/junit-platform-console-standalone-1.11.2.jar
HAMCREST = lib/hamcrest-3.0.jar

NOERR = | grep -v '^make:'

all: usage

usage:
	@[ -z "$<" ] && echo "usage: make <stack|prime|bowling>" || true

clean:
	rm -rf out

$(JUNIT):
	wget -P lib https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.11.2/junit-platform-console-standalone-1.11.2.jar

$(HAMCREST):
	wget -P lib https://repo1.maven.org/maven2/org/hamcrest/hamcrest/3.0/hamcrest-3.0.jar

stack: $(JUNIT)
	$(eval OUT=out/$@)
	$(JAVAC) -d $(OUT) src/$@/Stack.java
	$(JAVAC) -d $(OUT) -cp $(OUT):$(JUNIT) test/$@/StackTest.java
	$(JAVA) -jar $(JUNIT) execute -cp $(OUT) --scan-class-path $(NOERR)

prime: $(JUNIT) $(HAMCREST)
	$(eval OUT=out/$@)
	$(JAVAC) -d $(OUT) -cp $(JUNIT):$(HAMCREST) test/PrimeFactorsTest.java
	$(JAVA) -jar $(JUNIT) execute -cp $(OUT):$(HAMCREST) --scan-class-path $(NOERR)

bowling: $(JUNIT)
	$(eval OUT=out/$@)
	$(JAVAC) -d $(OUT) src/$@/Game.java
	$(JAVAC) -d $(OUT) -cp $(OUT):$(JUNIT) test/$@/BowlingTest.java
	$(JAVA) -jar $(JUNIT) execute -cp $(OUT) --scan-class-path $(NOERR)

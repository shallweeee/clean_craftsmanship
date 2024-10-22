BIN = /opt/jdk/amazon-corretto-17.0.13.11.1-linux-x64/bin
JAVA = $(BIN)/java
JAVAC = $(BIN)/javac

JUNIT = lib/junit-platform-console-standalone-1.11.2.jar
HAMCREST = lib/hamcrest-3.0.jar

all:
	@[ -z "$<" ] && echo "usage: make <stack|prime>" || true

stack: $(JUNIT)
	$(eval OUT=out_$@)
	$(JAVAC) -d $(OUT) Stack.java
	$(JAVAC) -d $(OUT) -cp $(OUT):$(JUNIT) StackTest.java
	$(JAVA) -jar $(JUNIT) execute -cp $(OUT) --scan-class-path

prime: $(JUNIT) $(HAMCREST)
	$(eval OUT=out_$@)
	$(JAVAC) -d $(OUT) -cp $(JUNIT):$(HAMCREST) PrimeFactorsTest.java
	$(JAVA) -jar $(JUNIT) execute -cp $(OUT):$(HAMCREST) --scan-class-path

$(JUNIT):
	wget -P lib https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.11.2/junit-platform-console-standalone-1.11.2.jar

$(HAMCREST):
	wget -P lib https://repo1.maven.org/maven2/org/hamcrest/hamcrest/3.0/hamcrest-3.0.jar

clean:
	rm -rf out_*

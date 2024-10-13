LIBS = lib/junit-platform-console-standalone-1.11.2.jar 
BIN = /opt/jdk/amazon-corretto-17.0.13.11.1-linux-x64/bin
JAVA = $(BIN)/java
JAVAC = $(BIN)/javac

all:
	$(JAVAC) -d out Stack.java
	$(JAVAC) -d out -cp out:$(LIBS) StackTest.java
	$(JAVA) -jar $(LIBS) execute -cp out --scan-class-path

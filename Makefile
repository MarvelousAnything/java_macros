SRC=src
PROC=preproc
OUT=build

JC=javac
JVM=java
CPP=cpp

MAIN=Main

.SUFFIXES: .java .class

CLASSES = Main.java

.java.class:
	$(JC) $*.java -d $(OUT)

$(PROC)/%.java: $(patsubst %,$(SRC)/%.java,%)
	$(CPP) -P $^ $@
		
default: build
 
build: $(PROC)/$(CLASSES) $(PROC)/$(CLASSES:.java=.class)

run: build
	$(JVM) -cp $(OUT) $(MAIN)
	

.PHONY: clean

clean:
	$(RM) $(PROC)/**/*.java
	$(RM) $(OUT)/**/*.class
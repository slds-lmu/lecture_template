SHELL:=/bin/bash
CHAPTER=$(shell find . -mindepth 2 -maxdepth 2 -type f -name 'Makefile' -exec dirname "{}" \;)
FCHANGED=$(shell git diff-tree --no-commit-id --name-only -r HEAD)

all:
	@for i in $(CHAPTER) ; do\
		echo "processing $$i";\
		cd $$i;\
	  echo "hello from $$(pwd)";\
		cd ..;\
	done

changes:
	@for i in $(CHAPTER); do\
		DN=$$(echo $$i | sed -e "s/\.//g");\
		GF=$$(git diff-tree --no-commit-id --name-only -r HEAD);\
    GLC=$$(echo $$GF | grep $$DN | grep "[.]tex" | wc -l);\
		echo "processing $$DN";\
		if [[ $$GLC != 0 ]]; then\
			cd $$i;\
			echo "hello from $$(pwd)";\
			cd ..;\
    fi;\
	done

all-pdf:
	@for i in $(CHAPTER); do\
		echo "processing $$i";\
		cd $$i;\
		echo "hello from $$(pwd)";\
		make;\
		cd ..;\
	done

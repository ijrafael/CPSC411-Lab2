PROJECT_NAME		:= VolunteerManager
MIN_INSERTIONS		:= 10
MIN_COMMITS		:= 4
COMMITS			:= $(shell git rev-list --count HEAD)
FIRST_COMMIT_REV	:= $(shell git rev-list --max-parents=0 HEAD)
LAST_COMMIT_REV		:= $(shell git rev-list HEAD | head -n1)
INSERTIONS		:= $(shell git diff $(FIRST_COMMIT_REV) $(LAST_COMMIT_REV) --shortstat | sed -E 's/.* ([0-9]+) insertion.*/\1/')


.PHONY: verify_implementation test stylecheck test1 test2 test3 test4 test5 test6

verify_implementation:
	@ if [ $(COMMITS) -lt $(MIN_COMMITS) ] ; then \
		echo "No changes commited."; \
		exit 1; \
	fi
	@ if [ $(INSERTIONS) -lt $(MIN_INSERTIONS) ] ; then \
		echo "Implementation does not seem to solve the problem."; \
		exit 1; \
	fi
		@echo "Implemented a solution to the problem"

stylecheck:\
	@swiftformat --lint --swiftversion 5.6 .	

test1:
	@ cp $(PROJECT_NAME)/$(PROJECT_NAME).swift .github/classroom/student.swift; \
	  cp .github/classroom/v1.swift $(PROJECT_NAME)/$(PROJECT_NAME).swift; \
	  xcodebuild test -quiet -project $(PROJECT_NAME).xcodeproj -scheme $(PROJECT_NAME) -sdk iphonesimulator -destination 'name=iPhone 12,OS=15.5'; \
	  if [ $$? -eq 0 ] ; then \
            echo "[ Test 1: Unit test is missing some test cases. Check the lab exercise specifications. ]\n"; \
	    exit 1; \
          else \
	    echo "[ Test 1: Unit test correctly caught a bug. ]\n"; \
          fi          

test2:
	@ cp .github/classroom/v2.swift $(PROJECT_NAME)/$(PROJECT_NAME).swift; \
	  xcodebuild test -project $(PROJECT_NAME).xcodeproj -scheme $(PROJECT_NAME) -sdk iphonesimulator -destination 'name=iPhone 12,OS=15.5'; \
	  if [ $$? -eq 0 ] ; then \
            echo "[ Test 2: Unit test is missing some test cases. Check the lab exercise specifications ]\n"; \
	    exit 1; \
	  else \
	    echo "[ Test 2: Unit test correctly caught a bug. ]\n"; \
          fi          

test3:
	@ cp .github/classroom/v3.swift $(PROJECT_NAME)/$(PROJECT_NAME).swift; \
	  xcodebuild test -project $(PROJECT_NAME).xcodeproj -scheme $(PROJECT_NAME) -sdk iphonesimulator -destination 'name=iPhone 12,OS=15.5'; \
	  if [ $$? -eq 0 ] ; then \
            echo "[ Test 3: Unit test is missing some test cases. Check the lab exercise specifications ]\n"; \
	    exit 1; \
	  else \
	    echo "[ Test 3: Unit test correctly caught a bug. ]\n"; \
          fi          

test4:
	@ cp .github/classroom/v4.swift $(PROJECT_NAME)/$(PROJECT_NAME).swift; \
	  xcodebuild test -project $(PROJECT_NAME).xcodeproj -scheme $(PROJECT_NAME) -sdk iphonesimulator -destination 'name=iPhone 12,OS=15.5'; \
	  if [ $$? -eq 0 ] ; then \
            echo "[ Test 4: Unit test is missing some test cases. Check the lab exercise specifications ]\n"; \
	    exit 1; \
	  else \
	    echo "[ Test 4: Unit test correctly caught a bug. ]\n"; \
          fi          

test5:	 
	@ cp .github/classroom/solve.swift $(PROJECT_NAME)/$(PROJECT_NAME).swift; \
	  xcodebuild test -project $(PROJECT_NAME).xcodeproj -scheme $(PROJECT_NAME) -sdk iphonesimulator -destination 'name=iPhone 12,OS=15.5'; \
	  if [ $$? -ne 0 ] ; then \
            echo "[ Test 5: Unit test contains some incorrect test cases. Check lab exercise specifications ]\n"; \
            exit 1; \
	  else \
	    echo "[ Test 5: Unit test correctly caught all bugs. ]\n"; \
          fi

test6:
	@ cp .github/classroom/student.swift $(PROJECT_NAME)/$(PROJECT_NAME).swift; \
	  cp .github/classroom/ut.swift $(PROJECT_NAME)Tests/$(PROJECT_NAME)Tests.swift; \
	  xcodebuild test -project $(PROJECT_NAME).xcodeproj -scheme $(PROJECT_NAME) -sdk iphonesimulator -destination 'name=iPhone 12,OS=15.5'; \
	  if [ $$? -ne 0 ] ; then \
            echo "[ Test 6: There are still some bugs in VolunteerManager.swift. You may be missing some test cases that will uncover the bugs. Check lab exercise specifications. ]\n"; \
            exit 1; \
	  else \
	    echo "[ Test 6: Unit test correctly caught all bugs. ]\n"; \
          fi

test: test1 test2 test3 test4 test5 test6

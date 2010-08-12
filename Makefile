SOLUTIONSPOLICY = .solutionspolicy
EDITNOTEPOLICY  = .editnotepolicy
PROBLEMSPOLICY  = .problemspolicy

SUBDIRS = book problems spring10

.PHONY: clean veryclean

clean veryclean:
	for dir in $(SUBDIRS); do \
	    $(MAKE) -C $$dir $@; \
	done

.PHONY: showpolicy

showpolicy:
	@ cat $(SOLUTIONSPOLICY)
	@ cat $(EDITNOTEPOLICY)
	@ cat $(PROBLEMSPOLICY)

.PHONY: shownotes

shownotes:
	echo '\showeditingnotestrue' > $(EDITNOTEPOLICY)

.PHONY: hidenotes

hidenotes:
	echo '\showeditingnotesfalse' > $(EDITNOTEPOLICY)

.PHONY: togglenotes

togglenotes:
	sed -i -e "s/false/true/;t;s/true/false/" $(EDITNOTEPOLICY)

.PHONY: showproblems

showproblems:
	echo '\showproblemstrue' > $(PROBLEMSPOLICY)

.PHONY: hideproblems

hideproblems:
	echo '\showproblemsfalse' > $(PROBLEMSPOLICY)

.PHONY: toggleproblems

toggleproblems:
	sed -i -e "s/false/true/;t;s/true/false/" $(PROBLEMSPOLICY)

.PHONY: showsolutions

showsolutions:
	echo '\showsolutions' > $(SOLUTIONSPOLICY)

.PHONY: staffsolutions

staffsolutions:
	echo '\staffsolutions' > $(SOLUTIONSPOLICY)

.PHONY: hidesolutions

hidesolutions:
	echo '\hidesolutions' > $(SOLUTIONSPOLICY)

.PHONY: togglesolutions

togglesolutions:
	sed -i -e "s/hide/show/;t;s/show/hide/" $(SOLUTIONSPOLICY)

.PHONY: asksolutions

asksolutions:
	-rm -f $(SOLUTIONSPOLICY)


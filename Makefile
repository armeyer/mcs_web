SOLUTIONSPOLICY = .solutionspolicy

SUBDIRS = book problems spring10

.PHONY: clean veryclean

clean veryclean:
	for dir in $(SUBDIRS); do \
	    $(MAKE) -C $$dir $@; \
	done

.PHONY: showpolicy

showpolicy:
	@ cat $(SOLUTIONSPOLICY)

.PHONY: showsolutions

showsolutions:
	echo '\showsolutions' > $(SOLUTIONSPOLICY)

.PHONY: hidesolutions

hidesolutions:
	echo '\hidesolutions' > $(SOLUTIONSPOLICY)

.PHONY: togglesolutions

togglesolutions:
	sed -i -e "s/hide/show/;t;s/show/hide/" $(SOLUTIONSPOLICY)

.PHONY: asksolutions

asksolutions:
	-rm -f $(SOLUTIONSPOLICY)


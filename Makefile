SUBDIRS = book problems fall09

.PHONY: clean veryclean

clean veryclean:
	for dir in $(SUBDIRS); do \
	    $(MAKE) -C $$dir $@; \
	done

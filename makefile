TAR = mcpat

.PHONY: dbg opt depend clean clean_dbg clean_opt

all: opt

dbg: $(TAR).mk obj_dbg
	@$(MAKE) TAG=dbg -C . -f $(TAR).mk

opt: $(TAR).mk obj_opt
	@$(MAKE) TAG=opt -C . -f $(TAR).mk

obj_dbg:
	mkdir -p $@

obj_opt:
	mkdir -p $@

clean: clean_dbg clean_opt

clean_dbg: obj_dbg
	@$(MAKE) TAG=dbg -C . -f $(TAR).mk clean
	rm -rf $<

clean_opt: obj_opt
	@$(MAKE) TAG=opt -C . -f $(TAR).mk clean
	rm -rf $<


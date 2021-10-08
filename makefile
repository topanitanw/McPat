TAR = mcpat

.PHONY: dbg opt depend clean clean_dbg clean_opt

# opt has the deadlock issue when testing with the Xeon.xml
all: dbg

# Note that CXX and CC are changed with the -m64 flags, not -m32 since
# MacOS does not support 32-bit programs.
dbg: $(TAR).mk obj_dbg
	@$(MAKE) TAG=dbg -C . -f $(TAR).mk CXX="g++ -m64 -g" CC="gcc -m64 -g"

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


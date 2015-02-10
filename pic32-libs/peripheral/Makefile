#
# Makefile for PIC32-MX libp.a
#
# This makefile will only work with GNU make
#

ROOT := $(shell pwd)

include $(ROOT)/../defines.mk

MAKEFILE = -f $(ROOT)/libp.mk

PROCESSORS_11X := $(subst P32MX11,32MX11,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx11\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_12X := $(subst P32MX12,32MX12,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx12\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_13X := $(subst P32MX13,32MX13,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx13\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_15X := $(subst P32MX15,32MX15,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx15\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_17X := $(subst P32MX17,32MX17,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx17\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_21X := $(subst P32MX21,32MX21,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx21\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_22X := $(subst P32MX22,32MX22,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx22\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_23X := $(subst P32MX23,32MX23,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx23\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_25X := $(subst P32MX25,32MX25,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx25\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_27X := $(subst P32MX27,32MX27,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx27\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_3XX := $(subst P32MX3,32MX3,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx3\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_4XX := $(subst P32MX4,32MX4,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx4\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_5XX := $(subst P32MX5,32MX5,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx5\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_6XX := $(subst P32MX6,32MX6,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx6\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))

PROCESSORS_7XX := $(subst P32MX7,32MX7,$(basename $(notdir $(shell find $(ROOT)/../include/proc -name p32mx7\*.h ! -name p32mxgeneric.h | tr [:lower:] [:upper:]))))


all install:
	@$(MAKE) doall T=$@

install-baseline:
	@$(MAKE) doall T=install

install-src:
	mkdir -p $(TGTLIBSRC)/peripheral
	cp Makefile $(TGTLIBSRC)/peripheral
	cp libp.mk $(TGTLIBSRC)/peripheral
	 $(foreach dir,$(shell find . -type d  | grep -v .svn | grep -v OBJ), \
	   mkdir -p $(TGTLIBSRC)/peripheral/$(dir); \
	   cp $(dir)/* ${TGTLIBSRC}/peripheral/$(dir) 2>>/dev/null; )


install-proc:

clean:
	@$(MAKE) doall T=$@
	[ ! -d OBJ ] || rm -r OBJ
	rm -f *[~#]

doall: dodir
# Build libraries for 11X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
				$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
				$(foreach P,$(PROCESSORS_11X), \
					PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
					pdir=OBJ/$$rdir/$P; \
					[ -d $$pdir ] || mkdir -p $$pdir; \
					$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		else \
		    echo "Skipping -mmicromips for $$flags"; \
		fi; )
# Build libraries for 12X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
				$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
				$(foreach P,$(PROCESSORS_12X), \
					PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
					pdir=OBJ/$$rdir/$P; \
					[ -d $$pdir ] || mkdir -p $$pdir; \
					$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		else \
		    echo "Skipping -mmicromips for $$flags"; \
		fi; )
# Build libraries for 13X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
				$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
				$(foreach P,$(PROCESSORS_13X), \
					PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
					pdir=OBJ/$$rdir/$P; \
					[ -d $$pdir ] || mkdir -p $$pdir; \
					$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		else \
		    echo "Skipping -mmicromips for $$flags"; \
		fi; )
# Build libraries for 15X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
				$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
				$(foreach P,$(PROCESSORS_15X), \
					PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
					pdir=OBJ/$$rdir/$P; \
					[ -d $$pdir ] || mkdir -p $$pdir; \
					$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		else \
		    echo "Skipping -mmicromips for $$flags"; \
		fi; )
# Build libraries for 17X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
				$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
				$(foreach P,$(PROCESSORS_17X), \
					PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
					pdir=OBJ/$$rdir/$P; \
					[ -d $$pdir ] || mkdir -p $$pdir; \
					$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		else \
		    echo "Skipping -mmicromips for $$flags"; \
		fi; )
# Build libraries for 21X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_21X), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )
# Build libraries for 22X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_22X), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )
# Build libraries for 23X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_23X), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )
# Build libraries for 25X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_25X), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )
# Build libraries for 27X devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_27X), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )
# Build libraries for 3XX devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_3XX), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )
# Build libraries for 4XX devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_4XX), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )
# Build libraries for 5XX devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_5XX), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )
# Build libraries for 6XX devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_6XX), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )
# Build libraries for 7XX devices
	$(foreach ML,$(shell $(CC) --print-multi-lib), \
		set -e; \
		rdir=`echo "$(ML)" | sed -e 's/;.*$$//'`; \
		dir=OBJ/$$rdir; \
		[ -d $$dir ] || mkdir -p $$dir; \
		flags=`echo "$(ML)" | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
		if echo "$$flags" | egrep -v 'mmicromips' | egrep -v '$(SKIPARCHS)' >/dev/null; then \
			if echo "$$flags" | grep 'mips16' >/dev/null; then \
				makevar="CODESIZEOPT=1"; \
			else \
				makevar=""; \
			fi; \
			$(MAKE) -C $$dir $(MAKEFILE) $$makevar VAR="$$flags" SUBDIR=$$rdir $F $T; \
			$(foreach P,$(PROCESSORS_7XX), \
				PROCESSOR_LIB=${patsubst %,libmchp_peripheral_%.a, $(P)}; \
				pdir=OBJ/$$rdir/$P; \
				[ -d $$pdir ] || mkdir -p $$pdir; \
				$(MAKE) -C $$pdir $(MAKEFILE) $$makevar VAR="$$flags -mprocessor=$P" SUBDIR=$$rdir PLIB=$$PROCESSOR_LIB $F $$PROCESSOR_LIB-$T; ) \
		fi; )

doone: dodir
	set -e; \
	rdir=`$(CC) --print-multi-dir $(VAR)`; \
	dir=OBJ/$$rdir; \
	[ -d $$dir ] || mkdir -p $$dir; \
	$(MAKE) -C $$dir $(MAKEFILE) VAR="$(VAR)" SUBDIR=$$rdir $F $T

dodir: Makefile $(ROOT)/libp.mk
	mkdir -p OBJ

.PHONY: all install clean doall doone dodir install-baseline install-proc

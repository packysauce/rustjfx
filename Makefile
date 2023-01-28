# This makefile is a home for wayward targets that don't fit in

# we need to build "target/<profile>/deps/<crate>.bc" for each crate
OUTDIR=target
PROFILE=debug
BCDIR=$(OUTDIR)/$(PROFILE)/deps
OBJCOPY=$(LLVM_TOOLCHAIN)/bin/llvm-objcopy

%-bc: target/debug/% $(BCDIR)/%.bc
	# copy cargo's ELF and set the .llvmbc section to the bc file's contents
	$(OBJCOPY) --add-section .llvmbc=$(BCDIR)/$*.bc target/debug/$* $*-bc
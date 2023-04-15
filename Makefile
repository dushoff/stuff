## This is stuff (makestuff development and examples)

current: target
-include target.mk
Ignore = target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

## Developing time cache

Sources += $(wildcard *.in)
Ignore += $(wildcard *.out)
slowtarget/a.out: a.in
	$(cat)

## b.out.final: a.in
## b.out: a.in
b.out: slow/a.out
	$(cat)

######################################################################

Sources += $(wildcard slowtarget/*.rda slowtarget/*.Rout)
slowtarget/slow.Rout: slow.R
	$(pipeR)

## slowview.Rout.final: slowview.R slow.R
## slowview.Rout: slowview.R slow.R
slowview.Rout: slowview.R slow/slow.rda

######################################################################

Sources += $(wildcard *.R)

autopipeR = defined

x.Rout: x.R

y.Rout: y.R x.rds

z.Rout: z.R x.rds

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/00.stamp
makestuff/%.stamp:
	- $(RM) makestuff/*.stamp
	(cd makestuff && $(MAKE) pull) || git clone $(msrepo)/makestuff
	touch $@

-include makestuff/os.mk

-include makestuff/pipeR.mk
-include makestuff/slowtarget.mk

-include makestuff/git.mk
-include makestuff/visual.mk

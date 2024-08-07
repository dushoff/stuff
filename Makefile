## This is stuff (makestuff development and examples)

current: target
-include target.mk
Ignore = target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

alldirs += stepper

Ignore += $(alldirs)

######################################################################

## Developing time cache
## Maybe OK, see makestuff/slowtarget.md

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

## Developing texj 2024 Jul 18 (Thu)

Sources += $(wildcard *.bib *.tex)

## example.pdf: example.tex
## beautiful.Rout: beautiful.R

## This creates incomprehensible weirdness (fails to set up directory)
## Seems to work with make dotdir
dotdir: makestuff.sync
## Also: why can't I figure out how to tee into a log for this?

## broken.pdf: broken.tex
## broken.force.pdf: broken.tex

######################################################################

## Don't trust make -n here

## touch example.tex && make example.pdf > make.log ##
## touch *.bib && make example.pdf > make.log ##
## touch *.R && make example.pdf > make.log ##

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/01.stamp
makestuff/%.stamp:
	- $(RM) makestuff/*.stamp
	(cd makestuff && $(MAKE) pull) || git clone $(msrepo)/makestuff
	touch $@

-include makestuff/os.mk

-include makestuff/pipeR.mk
-include makestuff/texj.mk
-include makestuff/slowtarget.mk

-include makestuff/git.mk
-include makestuff/visual.mk

## This is stepper, a subdirectory of stuff

current: target
-include target.mk
Ignore = target.mk

-include makestuff/perl.def

vim_session:
	bash -cl "vmt makestuff/stepper.mk makestuff/stepper.md"

######################################################################

Sources += $(wildcard *.R)

Ignore += stepper.mk

Sources += stepper.pl
## stepper.mk: stepper.pl

write.Rout: write.R

######################################################################


### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: | makestuff

makestuff:
	ls ../makestuff/Makefile && ln -s ../makestuff

-include makestuff/os.mk

-include makestuff/stepper.mk

-include makestuff/git.mk
-include makestuff/visual.mk

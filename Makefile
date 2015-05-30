###========================================================================
### File: Makefile
###
###
### Author: Enrique Fernandez <enrique.fernandez@erlang-solutions.com>
###
### Copyright (c) 2015 - Enrique Fernandez
###========================================================================
PROJECT   = edocstrings

## Dependencies
##-------------------------------------------------------------------------
DEPS      = forms meta
dep_forms = git git@github.com:efcasado/forms.git master
dep_meta  = git git@github.com:efcasado/meta.git  master

include erlang.mk

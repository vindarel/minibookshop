LISP?=sbcl

build:
	$(LISP) --quit \
		--eval '(ql:quickload :bookshops)' \
		--load minibookshop.asd \
		--eval '(ql:quickload "minibookshop")' \
		--eval '(asdf:make :minibookshop)'

install:
	#TODO: to finish
	test -d ~/quicklisp/local-projects/weblocks-ui || git clone "foo"

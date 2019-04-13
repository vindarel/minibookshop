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
	test -d ~/quicklisp/local-projects/weblocks-navigation-widget || git clone https://github.com/40ants/weblocks-navigation-widget

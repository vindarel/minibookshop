LISP?=sbcl

build:
	$(LISP) --quit \
		--eval '(ql:quickload :bookshops)' \
		--load minibookshop.asd \
		--eval '(ql:quickload "minibookshop")' \
		--eval '(asdf:make :minibookshop)'

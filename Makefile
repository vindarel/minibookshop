LISP?=sbcl

build:
	$(LISP) --quit \
		--load ../replic/replic.asd \
		--load ../cl-bookshops/bookshops.asd \
		--eval '(ql:quickload :bookshops)' \
		--load minibookshop.asd \
		--eval '(ql:quickload "minibookshop")' \
		--eval '(asdf:make :minibookshop)'

#|
  This file is a part of bookshops-web project.
|#

(defsystem "bookshops-web-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("bookshops-web"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "bookshops-web"))))
  :description "Test system for bookshops-web"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))

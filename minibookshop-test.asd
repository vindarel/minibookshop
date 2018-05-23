#|
  This file is a part of minibookshop project.
|#

(defsystem "minibookshop-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("minibookshop"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "minibookshop"))))
  :description "Test system for minibookshop"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))

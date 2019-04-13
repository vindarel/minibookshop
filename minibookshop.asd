#|
  This file is a part of minibookshop project.
|#

(asdf:defsystem "minibookshop"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (:weblocks
               :weblocks-ui
               :weblocks-navigation-widget
               :bookshops
               :find-port)
  :components ((:module "src/widgets"
                :components
                ((:file "not-found")
                 (:file "main")))
               (:module "src"
                :components
                ((:file "package")
                 (:file "minibookshop"))))

  :description ""
  ;; :long-description
  ;; #.(read-file-string
     ;; (subpathname *load-pathname* "README.markdown"))

  ;; build executable with asdf:make
  :build-operation "program-op"
  :build-pathname "minibookshop"
  :entry-point "minibookshop:main"


  :in-order-to ((test-op (test-op "minibookshop-test"))))

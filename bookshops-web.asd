#|
  This file is a part of bookshops-web project.
|#

(asdf:defsystem "bookshops-web"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (:weblocks
               :weblocks-ui
               :find-port)
  :components ((:module "src"
                :components
                ((:file "bookshops-web"))))
  :description ""
  ;; :long-description
  ;; #.(read-file-string
     ;; (subpathname *load-pathname* "README.markdown"))

  ;; build executable with asdf:make
  :build-operation "program-op"
  :build-pathname "bookshops-web"
  :entry-point "bookshops-web:main"


  :in-order-to ((test-op (test-op "bookshops-web-test"))))

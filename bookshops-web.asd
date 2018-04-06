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
  :in-order-to ((test-op (test-op "bookshops-web-test"))))

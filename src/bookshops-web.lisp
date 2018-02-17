(defpackage bookshops-web
  (:use #:cl
        #:weblocks/html)
    (:import-from #:weblocks/app
                #:defapp))
(in-package :bookshops-web)

(defapp bookshops)

(weblocks/debug:on)

(defvar *port* (find-port:find-port))

(defmethod weblocks/session:init ((app bookshops))
  (let ((books '("Antigone"
                 "Feu"
                 "Krop")))
    (lambda ()
      (with-html
        (:h1 "Books")
        (:ul :class "books"
             (loop for it in books
                do (with-html
                     (:li it))))))))

(defun start ()
  (weblocks/server:start :port *port*))

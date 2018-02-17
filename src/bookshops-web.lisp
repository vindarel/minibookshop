(defpackage bookshops-web
  (:use #:cl
        #:bookshops                     ;; local project
        #:weblocks/html)
    (:import-from #:weblocks/app
                #:defapp))
(in-package :bookshops-web)

(defapp bookshops)

(weblocks/debug:on)

(defvar *port* (find-port:find-port))

(defmethod weblocks/session:init ((app bookshops))
  (let ((books (books "antigone bauchau")))
    (lambda ()
      (with-html
        (:h1 "Books")
        (:ul :class "books"
             (loop for it in books
                do (with-html
                     (:li (format nil "~a ~a" (title it) (price it))))))))))

(defun start ()
  (weblocks/server:start :port *port*))

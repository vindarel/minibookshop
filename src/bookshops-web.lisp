(defpackage bookshops-web
  (:use #:cl
        #:bookshops ;; local project
        #:weblocks/html)
  (:import-from #:weblocks/app
                #:defapp)
  (:import-from #:weblocks-ui/form
                #:with-html-form
                #:render-form-and-button))
(in-package :bookshops-web)

(defapp bookshops)

(defvar *port* (find-port:find-port))


(defmethod weblocks/session:init ((app bookshops))
  (let ((results))
    (flet ((query (&key query &allow-other-keys)
             (setf results (books query))
             (weblocks/widget:update (weblocks/widgets/root:get))))
      (lambda ()
        (with-html
          (:h1 "Books")
          (with-html-form (:POST #'query)
            (:input :type "text"
                    :name "query"
                    :placeholder "search...")
            (:input :type "submit"
                    :value "Search"))
          (:ul :class "books"
               (loop for it in results
                  do (with-html
                       (:li (format nil "~a ~a" (title it) (price it)))))))))))

(defun start ()
  (weblocks/debug:on)
  (weblocks/server:start :port *port*))

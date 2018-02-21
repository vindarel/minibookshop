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


(defparameter *title* "Minibookshop")


(defmethod weblocks/session:init ((app bookshops))
  (let (results hello)
    (flet ((query (&key query &allow-other-keys)
             (setf results (books query))
             (weblocks/widget:update (weblocks/widgets/root:get)))
           (hello (&key arg &allow-other-keys)
             (declare (ignore arg))
             (setf hello (if hello nil t))
             (weblocks/widget:update (weblocks/widgets/root:get))))
      (lambda ()
        (with-html
          (:doctype)
          (:html
           (:head
            (:meta :http-equiv "Content-Type" :content "text/html; charset=utf-8") ;; useless
            (:meta :charset "UTF-8")
            (:meta :charset "UTF-8")
            (:link :rel "stylesheet" :type "text/css" :href "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css")
            (:title *title*))

           (:h1 "Minibookshop")
           (with-html-form (:POST #'query)
             (:div :class "ui action input"
              (:input :type "text"
                      :name "query"
                      :class "ui input"
                      :placeholder "search...")
              (:input :type "submit"
                      :value "Search")))

           (:table :class "ui selectable table"
            (:thead
             (:th "Title")
             (:th "Authors")
             (:th "Editor")
             (:th "Price")
             (:th "Hello ?")
             (:th ))
            (:tbody)
            (dolist (it results)
              (with-html
                (:tr
                 (:td (title it))
                 (:td (authors it))
                 (:td (editor it))
                 (:td (price it))
                 (:td (if hello
                          (:div "HELLO !")))
                 (:td
                  (with-html-form (:POST #'hello)
                    (:input :type "hidden")
                    (:input :type "submit"
                            :class "ui primary button"
                            :value "Say hello")))))))))))))

(defun start ()
  (weblocks/debug:on)
  (weblocks/server:start :port *port*))

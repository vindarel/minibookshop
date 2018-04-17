(defpackage bookshops-web
  (:use #:cl
        #:weblocks/html)
  (:import-from :bookshops
                :books)
  (:import-from #:bookshops.models
                #:save-book
                :title
                :authors
                :editor
                :price
                :quantity
                :quantity-of)
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
           (hello (&key index &allow-other-keys)
             (setf hello index)
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
                 (:td hello)
                 (:td
                  (with-html-form (:POST #'hello)
                    (:input :type "hidden"
                            :name "index"
                            :value (position it results))
                    (:input :type "submit"
                            :class "ui primary button"
                            :value "Say hello")))))))))))))

(defun start ()
  (weblocks/debug:on)
  (weblocks/server:start :port *port*))

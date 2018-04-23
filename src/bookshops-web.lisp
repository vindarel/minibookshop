(defpackage bookshops-web
  (:use #:cl
        #:weblocks/html)
  (:import-from :bookshops
                :books)
  (:import-from #:bookshops.models
                #:save-book
                :title
                :cover-url
                :authors
                :editor
                :price
                :quantity
                :quantity-of)
  (:import-from #:weblocks/app
                #:defapp)
  (:import-from #:weblocks-ui/form
                #:with-html-form
                #:render-form-and-button)
  (:export :main))
(in-package :bookshops-web)

(defapp bookshops)

(defvar *port* (find-port:find-port))


(defparameter *title* "Minibookshop")


(defmethod weblocks/session:init ((app bookshops))
  (let (results
        (show-covers t))
    (flet ((query (&key query &allow-other-keys)
             (setf results (books query))
             (weblocks/widget:update (weblocks/widgets/root:get)))
           (add-book (&key index &allow-other-keys)
             ;; logging
             (save-book (elt results (parse-integer index)))
             (weblocks/widget:update (weblocks/widgets/root:get)))

           (toggle-covers ()
             (setf show-covers (not show-covers))
             (weblocks/widget:update (weblocks/widgets/root:get))))
      (lambda ()
        (with-html
          (:doctype)
          (:html
           (:head
            (:meta :http-equiv "Content-Type" :content "text/html; charset=utf-8") ;; useless
            (:meta :charset "UTF-8")
            (:link :rel "stylesheet" :type "text/css" :href "https://cdn.jsdelivr.net/npm/semantic-ui@2.3.1/dist/semantic.min.css" )

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

           (:button :class "ui basic button"
                    :onclick (weblocks/actions:make-js-action
                              (lambda (&rest rest)
                                (declare (ignore rest))
                                (toggle-covers)))
            (:i :class "list icon"))

           (:table :class "ui selectable table"
                   (:thead
                    (:th "Title")
                    (:th "Authors")
                    (:th "Editor")
                    (:th "Price")
                    (:th "Quantity")
                    (:th "Add-Book ?")
                    (:th ))
                   (:tbody)
                   (dolist (it results)
                     (with-html
                       (:tr
                        (:td
                         (:div (title it))
                         (when show-covers
                           (:img :src (cover-url it))))
                        (:td (authors it))
                        (:td (editor it))
                        (:td (price it))
                        (:td (quantity-of it))
                        (:td
                         (with-html-form (:POST #'add-book)
                           (:input :type "hidden"
                                   :name "index"
                                   :value (position it results))
                           (:input :type "submit"
                                   :class "ui primary button"
                                   :value "add-book")))))))))))))

(defun start ()
  "Connect to the DB and start weblocks."
  (bookshops.models:connect)
  (weblocks/debug:on)
  (weblocks/server:start :port *port*))

;; restart
(defun reset ()
  (weblocks/debug:reset-latest-session))

(defun main ()
  (defvar *port* (find-port:find-port))
  (format t "~&--- sbcl home: ~a~&" (SB-INT:SBCL-HOMEDIR-PATHNAME))

  (start)
  (handler-case (bt:join-thread (find-if (lambda (th)
                                             (search "hunchentoot" (bt:thread-name th)))
                                         (bt:all-threads)))
    (#+sbcl sb-sys:interactive-interrupt
      #+ccl  ccl:interrupt-signal-condition
      #+clisp system::simple-interrupt-condition
      #+ecl ext:interactive-interrupt
      #+allegro excl:interrupt-signal
      () (progn
           (format *error-output* "Aborting.~&")
           ;; (weblocks:stop)
           (uiop:quit 1))
    ;; for others, unhandled errors (we might want to do the same).
    (error (c) (format t "Woops, an unknown error occured:~&~a~&" c)))))

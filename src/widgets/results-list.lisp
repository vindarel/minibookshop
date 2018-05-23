;;
;; Widget to display a list of search results.
;;
(in-package :minibookshop.widgets)

(defwidget results-list ()
  ((results :initarg :results
            :reader results)))

(defmethod render ((widget results-list))
  (let ((results (results widget)))
    (if results
        (mapcar #'render results)
        (with-html
          (:p "No results")))))

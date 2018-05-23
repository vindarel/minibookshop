;;
;; Widget to display a search result.
;;
(in-package :minibookshop.widgets)

(defwidget result ()
  ((book :type object
         :initarg :book
         :reader result-book)))

(defmethod render ((widget result))
  (let ((book (result-book widget)))
    (with-html
      (:tr
       (:td
        (:div (title book))
        ;TODO:
        ;; (when show-covers
        ;;   (:img :src (cover-url book)))
        )
       (:td (authors book))
       (:td (editor book))
       (:td (price book))
       (:td (quantity-of book))
       (:td
        ;TODO:
        ;; (with-html-form (:POST #'add-book)
        ;;   (:input :type "hidden"
        ;;           :name "index"
        ;;           :value (position book results))
        ;;   (:input :type "submit"
        ;;           :class "ui primary button"
        ;;           :value "add-book"))
        )))))

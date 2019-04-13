(defpackage #:minibookshop/widgets/main
  (:use #:cl)
  ;TODO: where is navigation-widget/defwidget ?
  (:import-from #:weblocks-navigation-widget
                #:defwidget)
  (:import-from #:weblocks/html
                #:with-html-string)

  (:import-from #:minibookshop/widgets/not-found
                #:page-not-found)
  (:export #:make-main-widget))

(in-package minibookshop/widgets/main)


(defwidget main-widget
    ("/"
     (log:debug "---root!"))
  ("/hello"
     (log:debug "--- hello!"))
  (t
   (page-not-found)))


(defmethod weblocks/widget:render ((widget main-widget))
  ;; (weblocks/widget:render
  ;;  (make-login-menu))
  (log:debug "-- render nav")
  (call-next-method))

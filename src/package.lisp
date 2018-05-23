(defpackage minibookshop.widgets
  (:use  #:cl
         #:bookshops.models)
  (:import-from #:weblocks/widget
                #:defwidget
                #:render)
  (:import-from #:weblocks-ui/form
                #:with-html-form)
  (:import-from #:weblocks/html
                #:with-html))

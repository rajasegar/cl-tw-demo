(in-package :cl-user)
(defpackage cl-tw-demo.web
  (:use :cl
        :caveman2
        :cl-tw-demo.config
        :cl-tw-demo.view
        :cl-tw-demo.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :cl-tw-demo.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(print (cl-djula-tailwind:get-stylesheet #P"index.html" *template-directory*))


(defun render-stylesheet (template)
	(setf (getf djula:*default-template-arguments* :tailwind) (cl-djula-tailwind:get-stylesheet template *template-directory*)))


(defroute "/" ()
	(render-stylesheet #P"index.html")
  (render #P"index.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))

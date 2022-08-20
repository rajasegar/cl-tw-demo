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


(defun render-stylesheet (template)
	(setf (getf djula:*default-template-arguments* :tailwind) (cl-djula-tailwind:get-stylesheet template *template-directory*) ))


(defroute "/" ()
	(render-stylesheet #P"index.html")
  (render #P"index.html"))

(defroute "/sizing" ()
	(render-stylesheet #P"sizing.html")
  (render #P"sizing.html"))

(defroute "/build-anything" ()
	(render-stylesheet #P"build-anything.html")
  (render #P"build-anything.html"))

(defroute "/playground" ()
	(render-stylesheet #P"playground.html")
  (render #P"playground.html"))

(defroute "/darkmode" ()
	(render-stylesheet #P"darkmode.html")
  (render #P"darkmode.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))

(in-package :cl-user)

(ql:quickload '(:clack :cl-markup :parenscript))

(defpackage #:ps-tutorial
  (:use :cl :clack :cl-markup :parenscript))

(in-package :ps-tutorial)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf *markup-language* :html))

;; start server http://localhost:5000/
;; to stop server use (stop *handler*)

(defvar *handler*
  (clackup (lambda (env)
             (declare (ignore env))
             (hello))))

(defun hello ()
  `(200
    (:content-type "text/html")
    (,(html
       (:head (:title "Parenscript tutorial: hello world"))
       (:body (:h2 "Parenscript tutorial: hello world example")
              "Please click the link below." (:br)
              (:a :href "#" :onclick (ps (greet))
                  "Hello World"))
       (:script
        (ps
          (defun greet()
            (alert "Hello, Parenscript"))))))))

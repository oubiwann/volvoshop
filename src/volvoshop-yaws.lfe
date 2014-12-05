(defmodule volvoshop-yaws
  (export all))


;; YAWS functions
(defun out (arg-data)
  "This function is executed by YAWS. It is the YAWS entry point for our
  RESTful service."
  (let ((method-name (get-http-method arg-data))
        (path-info (: string tokens
                      (parse-path arg-data)
                      '"/")))
    (routes path-info method-name arg-data)))

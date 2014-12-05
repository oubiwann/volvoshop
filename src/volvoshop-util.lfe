(defmodule volvoshop-util
  (export all))

;; REST utility functions
(defun parse-path (arg-data)
  "Use the LFE record macros to parse the 'pathinfo' field from the record
  defined in yaws_api.hrl."
  (arg-pathinfo arg-data))

(defun get-http-method (arg-data)
  "Use the LFE record macros to parse the 'req' field from the record defined in
  yaws_api.hrl. This will return the 'http_request' sub-record from which the
  'method' fieild will be returned."
  (let ((record (arg-req arg-data)))
    (http_request-method record)))

(defun make-json-response (data)
  "Simple function used for handing off data to YAWS."
  (tuple 'content
         '"application/json"
         data))

(defun make-json-data-response (data)
  "Simple function used for handing off data to YAWS."
  (make-json-response (++ '"{\"data\": \"" data '"\"}")))

(defun make-json-error-response (error)
  "Simple function used for handing off data to YAWS."
  (make-json-response (++ '"{\"error\": \"" error '"\"}")))

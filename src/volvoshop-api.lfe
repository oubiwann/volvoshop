(defmodule volvoshop-api
  (export all))

(defun order-api
  "The order API for methods without an order id."
  (('POST arg-data)
   (make-json-data-response '"You made a new order.")))

(defun order-api
  "The order API for methods with an order id."
  (('GET order-id arg-data)
   (make-json-data-response (++ '"You got the status for order "
                                order-id '".")))
  (('PUT order-id arg-data)
   (make-json-data-response (++ '"You updated order " order-id '".")))
  (('DELETE order-id arg-data)
   (make-json-data-response (++ '"You deleted an order " order-id '"."))))

(defun orders-api
  "The orders API."
  (('GET arg-data)
   (make-json-data-response '"You got a list of orders.")))

(defun payment-api
  "The payment API."
  (('GET order-id arg-data)
   (make-json-data-response '"You got the payment status of an order."))
  (('PUT order-id arg-data)
   (make-json-data-response '"You paid for an order.")))

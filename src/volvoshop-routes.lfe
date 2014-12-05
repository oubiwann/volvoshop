(defmodule volvoshop
  (export all))

;; REST API functions
(defun routes
  "Routes for the Volvoshop REST API."
  ;; /order
  (((list '"order") method arg-data)
   (order-api method arg-data))
  ;; /order/:id
  (((list '"order" order-id) method arg-data)
   (order-api method order-id arg-data))
  ;; /orders
  (((list '"orders") method arg-data)
   (orders-api method arg-data))
  ;; /payment/order/:id
  (((list '"payment" '"order" order-id) method arg-data)
   (payment-api method order-id arg-data))
  ;; When nothing matches, do this
  ((path method arg)
    (: io format
      '"Unmatched route!~n Path-info: ~p~n method: ~p~n arg-data: ~p~n~n"
      (list path method arg))
    (make-json-error-response '"Unmatched route.")))

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

(defmodule volvoshop_tests
  (export all))

(include-lib "include/ltest-macros.lfe")

(deftest my-adder
  (is-equal 4 (: cloudy my-adder 2 2)))

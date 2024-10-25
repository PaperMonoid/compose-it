(library (compose-it either)
  (export make-left left? left-value make-right right? right-value
	  either-flatmap either-map)
  (import (rnrs))

  (define (make-left value)
    (vector value #f))

  (define (left? either)
    (not (vector-ref either 1)))

  (define (left-value either)
    (vector-ref either 0))

  (define (make-right value)
    (vector #f value))

  (define (right? either)
    (vector-ref either 1))

  (define (right-value either)
    (vector-ref either 1))

  (define (either-flatmap function either)
    (if (right? either)
	(function either)
	either))

  (define (either-map function either)
    (either-flatmap (lambda value (make-right (function value))) either)))

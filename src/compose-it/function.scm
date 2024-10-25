(library (compose-it function)
  (export compose curry flip)
  (import (rnrs)
	  (compose-it list))

  (define (compose . fs)
    (lambda x (foldr (lambda (f acc) (f acc)) x fs)))

  (define (curry f . args1)
    (lambda args2 (apply f (append args1 args2))))

  (define (flip function)
    (lambda (x y) (function y x))))

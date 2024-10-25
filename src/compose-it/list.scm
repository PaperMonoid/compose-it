(library (compose-it list)
  (export foldr foldl flatmap intersperse cartesian-product reject zip times
	  take take-last drop drop-last range)
  (import (rnrs))

  (define (foldr function accumulator values)
    (if (null? values) accumulator
	(function (car values) (foldr function accumulator (cdr values)))))

  (define (foldl function accumulator values)
    (if (null? values)
	accumulator
	(foldl function (function accumulator (car values)) (cdr values))))

  (define (flatmap function xs)
    (foldl
     (lambda (ys x-acc)
       (foldl (lambda (y y-acc) (cons y y-acc)) x-acc ys))
     '()
     (map function xs)))

  (define (intersperse separator xs)
    (cond
     ((null? xs) '())
     (else
      (foldl (lambda (x acc) (cons x (cons separator acc)))
	     (list (car xs))
	     (cdr xs)))))

  (define (cartesian-product xs ys)
    (flatmap (lambda (x) (map (lambda (y) (cons x y)) ys)) xs))

  (define (reject function xs)
    (filter (lambda x (not (function x))) xs))

  (define (zip xs ys)
    (let loop ((xs xs) (ys ys) (zs '()))
      (cond
       ((or (null? xs) (null? ys)) zs)
       (else (loop (car xs) (car ys) (cons (cdr xs) (cdr ys)))))))

  (define (times n value)
    (let loop ((n n) (values '()))
      (cond
       ((> n 0) (loop (- n 1) (cons value values)))
       (else values))))

  (define (take n xs)
    (let loop ((n n) (xs xs) (values '()))
      (cond
       ((null? xs) (reverse values))
       ((> n 0) (loop (- n 1) (cdr xs) (cons (car xs) values)))
       (else (reverse values))))) 
 
  (define (take-last n xs)
    (let loop ((n n) (xs (reverse xs)) (values '()))
      (cond
       ((null? xs) values)
       ((> n 0) (loop (- n 1) (cdr xs) (cons (car xs) values)))
       (else values))))

  (define (range start end)
    (let loop ((end (- end 1)) (values '()))
      (cond
       ((<= start end) (loop (- end 1) (cons end values)))
       (else values))))
  
  (define (drop n xs)
    (let loop ((n n) (xs xs))
      (cond
       ((null? xs) '())
       ((> n 0) (loop (- n 1) (cdr xs)))
       (else xs))))
  
  (define (drop-last n xs)
    (let loop ((n n) (xs (reverse xs)))
      (cond
       ((null? xs) '())
       ((> n 0) (loop (- n 1) (cdr xs)))
       (else (reverse xs))))))


(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define eps 0.00000000001)
  (define (sqrt-iter guess)
    (if (good-enough? guess (improve guess))
	guess
	(sqrt-iter (improve guess))))
  (define (good-enough? guess improved-guess)
    (< (/ (abs (- guess improved-guess)) guess) eps))
  (define (improve guess)
    (average guess (/ x guess)))
  (sqrt-iter 1.0))

(define (factorial n)
  (define (fact-iter product counter)
    (if (> counter n)
	product
	(fact-iter (* counter product)
		   (+ counter 1))))
  (fact-iter 1 1))

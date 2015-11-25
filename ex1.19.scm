					;this means is matrix form of fibonacci.
					; [f(n+1); f(n)] = [p+q, q; q, p]^n * [f(1);f(0)]
(define (fib n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
	  ((even? count)
	   (fib-iter a
		     b
		     (+ (* p p) (* q q))
		     (+ (* q q) (* 2 p q))
		     (/ count 2)))
	  (else (fib-iter (+ (* b q) (* a q) (* a p))
			  (+ (* b p) (* a q))
			  p
			  q
			  (- count 1)))))
  (fib-iter 1 0 0 1 n))

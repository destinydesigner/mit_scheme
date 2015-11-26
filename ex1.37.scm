(define (cont-frac n d k)
  (define (iter n d i)
    (if (= i k)
	(/ (n k) (d k))
	(/ (n k) (+ (d k) (iter n d (+ i 1))))))
  (iter n d 1))

(define tolerance 0.00001)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (convergent f)
  (define (iter k-th pre k)
    (if (close-enough? k-th pre)
	k-th
	(iter (f (+ k 1)) k-th (+ k 1))))
  (iter (f 1) (- (f 1) 1) 1))

(define (f k)
  (cont-frac (lambda (i) 1.0)
	     (lambda (i) 1.0)
	     k))

(convergent f)

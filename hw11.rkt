; Q1 (5 points)
; Enter your code here
; 1.1 
(+ -8 (+ 5 (* 9 4)))
; 1.2
(+ -22 (* 5 (+ 6 (- 12 5))))
; 1.3
(* 9 (- (+ 21 (/ 32 4)) (* 3 (+ 7 2))))
; 1.4
(* 3 (+ 4 (/ (+ (* 7 10) (/ 6 3)) (+ 10 2))))
; 1.5
(- (/ (- (* 2 (* 2 (* (+ 4 5) (+ 6 7)))) 10) 2) (+ (/ (* 3 (+ (* 4 5) (* 6 4))) 2) (* 4 5)) )

; Q2 (5 points)
(define Add
  ; Enter your code here
  (lambda (x y)
    (+ x y)))
    
(Add 5 6) ;Should be 11

; Q3 (10 points)
(define Product
; Enter your code here
  (lambda (a b)
    (if (or (= b 0) (= a 0))
        (* 0);answer is 0 if a or b is 0
        (if (> a 0) ;else check if a > 0
            (Add (Product (- a 1) b) b) ;execute recursion, decrement a
            (Add 0 b) ;else if a = 0, add 0 and b
        )
     );do with conditional?
    )
  )

(Product 3 3) ;Should be 9

; Q4: (5 points)
(define SquareRoot
; Enter your code here
  (lambda (x)
    (sqrt x)))
;Did not give instructions for how we had to do it
;so I used Scheme function of sqrt?

(SquareRoot 4) ;Should be 2

; Q5 (10 points)
(define DistanceBetweenTwoPoints
; Enter your code here
;SquareRoot of ( ((x2-x1)^2) + ((y2-y1)^2) )
  (lambda (x1 y1 x2 y2)
    (SquareRoot (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)))
    ))

(DistanceBetweenTwoPoints 2 5 3 2)

;Q6 (5 points)
(define (AddLet x y)
; Enter your code here
  (let ( (x x)
         (y y))
    (+ x y)))


(AddLet 10 3)

; Q7 (10 points)
(define (Letexpression)
; Enter your code here
  ;;use Question 1.1
  ; 1.1 (+ -8 (+ 5 (* 9 4)))
  (let ( (nine 9)
         (four 4)
         (five 5)
         (eight 8))
    (- (+ five (* nine four)) eight)))
  
(Letexpression)

;Your Name: Sara Schultz
;Course: CSE 240


;Q1 (3 points)
; enter your code here:
(define AND-GATE
  (lambda (x y)
    (if (and (= x 0) (= y 0))
        0;answer is 0
        (if (or (and (= x 1) (= y 0)) (and (= x 0) (= y 1))) ;else middle cases
            0
            1 ;else check if answer is x * y
    )
  )))

(define OR-GATE
  (lambda (x y)
    (if (and (= x 0) (= y 0))
        0;answer is 0
        (if (or (and (= x 1) (= y 0)) (and (= x 0) (= y 1))) ;else middle cases
            1
            1 ;else check if answer is x * y
    )
  )))

(define NOT-GATE
  (lambda (x)
    (if (= x 0)
        1
        0
    )
  ))

; Test cases
(newline)
(Display "AND-Gate Output\n")
(AND-GATE 0 0)
(AND-GATE 0 1)
(AND-GATE 1 0)
(AND-GATE 1 1)
; Expected outputs
;0
;0
;0
;1
; Test cases
(newline)
(Display "OR-Gate Output\n")
(OR-GATE 0 0)
(OR-GATE 0 1)
(OR-GATE 1 0)
(OR-GATE 1 1)
; Expected outputs
;0
;1
;1
;1
; Test cases
(newline)
(Display "NOT-Gate Output\n")
(NOT-GATE 0)
(NOT-GATE 1)
; Expected outputs
;1
;0

; Q2 (2 points)
; enter your code here:
(define XOR-GATE
  (lambda (a b)
    (let ( (c (OR-GATE (AND-GATE (NOT-GATE a) b) (AND-GATE a (NOT-GATE b))) ))
      c
    )
  ))


; Test cases
(newline)
(newline)
(Display "XOR-Gate Output\n")
(XOR-GATE 0 0)
(XOR-GATE 0 1)
(XOR-GATE 1 0)
(XOR-GATE 1 1)
; Expected outputs
;0
;1
;1
;0

;Q3.1 (5 points)
; enter your code here:
(define halfAdder
  (lambda (x a b)
    (let ( (s (XOR-GATE (XOR-GATE a b) x)))
      s
    )
  ))

;Q3.2 (5 points)
; enter your code here:
(define carry-out
  (lambda (x a b)
    (let ( (c (OR-GATE (AND-GATE (XOR-GATE a b) x) (AND-GATE a b))))
      c
    )
  ))


;Q3.3 (5 points)
; enter your code here:
(define fullAdder
  (lambda (x a b)
    ;(display "(")
    ;(display (carry-out x a b)) ;display c
    ;(display " . ")
    ;(display (halfAdder x a b)) ;display s 
    ;(display ")")
    ;(newline)
    (cons (carry-out x a b) (halfAdder x a b))
    ;(c . s)
    )
  )

; Test cases
(newline)
(Display "halfAdder Output\n")
(halfAdder 0 0 0) 	
(halfAdder 0 0 1) 	
(halfAdder 0 1 0) 	
(halfAdder 0 1 1)	
(halfAdder 1 0 0) 	
(halfAdder 1 0 1)	
(halfAdder 1 1 0) 	
(halfAdder 1 1 1)

; Expected outputs
;0
;1
;1
;0
;1
;0
;0
;1


; Test cases
(newline)
(Display "fullAdder Output\n")
(fullAdder 0 0 0) 	
(fullAdder 0 0 1) 	
(fullAdder 0 1 0) 	
(fullAdder 0 1 1)	
(fullAdder 1 0 0) 	
(fullAdder 1 0 1)	
(fullAdder 1 1 0) 	
(fullAdder 1 1 1)

; Expected outputs
;(0 . 0)
;(0 . 1)
;(0 . 1)
;(1 . 0)
;(0 . 1)
;(1 . 0)
;(1 . 0)
;(1 . 1)


;Q4.1 (4 points)
; enter your code here:
(define tail
  (lambda (lst)
    (if (= (length lst) 1)
      (car lst)
      (tail (cdr lst)))))


;Q4.2 (4 points)
(define (rmtail lst)
    (reverse (cdr (reverse lst))))

(tail '(1 3 5 6 8))

(rmtail '(1 3 5 6 8))

;Q4.3
; Step 1 size-n problem: Lines of code
; ---->binaryAdd, call binaryAdd within itself
;(define binaryAdd (lambda (L1 L2)(let ((len1 (length L1)) (len2 (length L2)))(if (> len1 len2)(binaryAdd L2 L1) (if (< len1 len2)(binaryAdd (append '(0) L1) L2) ;do this

; Step 2 Stopping condition: Lines of code
; ----> (if (> len1 len2)

; Step 3 size-m problem: Lines of code
; ---->(append (recursiveAdd (rmtail L1)(rmtail L2)(quotient t 2))

; Step 4: Lines of code
; ----> Call the program
;(define recursiveAdd(lambda(L1 L2 carry)(if (null? L1)'()(let ((t (+ (tail L1)(tail L2) carry)))(append (recursiveAdd (rmtail L1)(rmtail L2)(quotient t 2))(list (remainder t 2)))))))


;Q4.4 (18 points)
; enter your code here:

(define (format lst)
  (if (= (length lst) 1)
      (list lst) ;do this
      (append (format (rmtail lst)) (list (tail lst)) ;otherwise do this
              )))

(define binaryAdd
  (lambda (L1 L2)
    (let ((len1 (length L1)) (len2 (length L2)))
      (if (> len1 len2)
          (binaryAdd L2 L1) ;do this
          (if (< len1 len2) ;otherwise do this
              (binaryAdd (append '(0) L1) L2) ;do this
              (format (recursiveAdd (append '(0) L1) (append '(0) L2) 0)) ;otherwise do this
              )))))

(define recursiveAdd
  (lambda(L1 L2 carry)
    (if (null? L1)
        '() ;if L1 null do this
        (let ((t (+ (tail L1)(tail L2) carry))); otherwise do this
          (append (recursiveAdd (rmtail L1)
                                (rmtail L2)
                                (quotient t 2))
                  (list (remainder t 2))
                  )))))

(define n-bit-adder
  (lambda (A B n)
    (binaryAdd A B) ;I can't get it to display properly
    ))

;Test cases
(define X1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0) )	
(define X2 '(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1) )	
(define X3 '(0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1) )	
(define X4 '(1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0) )
(define X5 '(1 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1) )	
(define X6 '(1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0) )


(newline)
(Display " n-bit-adder Output\n")
( n-bit-adder  X1 X2 32)
( n-bit-adder  X3 X4 32)
( n-bit-adder  X5 X6 32)
( n-bit-adder  X2 X3 32)
( n-bit-adder  X4 X5 32)
( n-bit-adder  X1 X6 32)
; Expected outputs
;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(1 (1 0 1 1 1 0 0 0 1 1 1 0 0 1 0 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 1))
;(1 (0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 0))
;(1 (1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
;(0 (1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0))

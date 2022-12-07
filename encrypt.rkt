;Sara Schultz

(define encrypt
  (lambda (str)
    (list->string (map character-encryption
                       (string->list str)))))

(define character-encryption
  (lambda (ch)
    (if (char-alphabetic? ch)
        (character-rotation ch)
        ch
        )))

(define character-rotation
  (lambda (ch)
    ;(char-downcase ch)
     (if (char=? ch #\a)
        (integer->char (+ 63 (* (char->integer ch) 0))) ;ASCII for ? is 63
        (if (char=? ch #\e)
            (integer->char (+ 33 (* (char->integer ch) 0))) ;ASCII for ! is 33
            (if (char=? ch #\o)
                (integer->char (+ 43 (* (char->integer ch) 0))) ;ASCII for + is 43
                (if (char=? ch #\u)
                    (integer->char (+ 45 (* (char->integer ch) 0))) ;ASCII for - is 45
                    (if (char=? ch #\i)
                        (integer->char (+ 42 (* (char->integer ch) 0))) ;ASCII for * is 42
                        (if (char=? ch #\U)
                            (integer->char (+ 45 (* (char->integer ch) 0))) ;ASCII for - is 45
                            (if (char=? ch #\A)
                                (integer->char (+ 63 (* (char->integer ch) 0))) ;ASCII for ? is 63
                                (if (char=? ch #\E)
                                    (integer->char (+ 33 (* (char->integer ch) 0))) ;ASCII for ! is 33
                                    (if (char=? ch #\O)
                                        (integer->char (+ 43 (* (char->integer ch) 0))) ;ASCII for + is 43
                                        (if (char=? ch #\I)
                                            (integer->char (+ 42 (* (char->integer ch) 0))) ;ASCII for * is 42
                                            (integer->char (char->integer ch)) ; do nothing

                   ))))))))))))


;(string-encryption "Hello")
;(encrypt "Zebra is a horse")

(define decrypt
  (lambda (str)
    (list->string (map character-decryption
                       (string->list str)))))

(define character-decryption
  (lambda (ch)
    (if (char? ch)
        (character-derotation ch)
        ch
        )))

(define character-derotation
  (lambda (ch)
     (if (char=? ch #\?)
        (integer->char (+ 97 (* (char->integer ch) 0))) ;ASCII for a is 97
        (if (char=? ch #\!)
            (integer->char (+ 101 (* (char->integer ch) 0))) ;ASCII for e is 101
            (if (char=? ch #\+)
                (integer->char (+ 111 (* (char->integer ch) 0))) ;ASCII for o is 111
                (if (char=? ch #\-)
                    (integer->char (+ 117 (* (char->integer ch) 0))) ;ASCII for u is 117
                    (if (char=? ch #\*)
                        (integer->char (+ 105 (* (char->integer ch) 0))) ;ASCII for i is 105
                        (integer->char (char->integer ch)) ; do nothing
        
                   )))))))

;Test cases
;(encrypt "Zebra is a horse")
;(decrypt (encrypt "Zebra is a horse"))
;(encrypt "COMPUTER science")
;(decrypt (encrypt "COMPUTER science"))
;(encrypt "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz")
;(decrypt (encrypt "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz"))
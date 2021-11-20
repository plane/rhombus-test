#lang racket/base

;; https://github.com/samdphillips/rhombus-examples/blob/main/rhombus-examples-web/web/private/rhombus-names.rkt
;;
;; SamPh's completely unofficial rules for renaming Racket names to Rhombus
;; (modified, needs cleanup)

(provide rhombus-rename)

(define ((rhombus-rename [override null]) name)
  (define (rename name)
    (cond
      [(assoc name override)
       => (lambda (p) (cdr p))]
      [(regexp-match #px"^(.*)\\?$" name)
       => (lambda (m) (rename (string-append "is_" (cadr m))))]
      [(regexp-match #px"!" name)
       (rename (regexp-replace* #px"!" name "_"))]
      [(regexp-match #px"->" name)
       (rename (regexp-replace* #px"->" name "_to_"))]
      [(regexp-match #px"/" name)
       (rename (regexp-replace* #px"/" name "_with_"))]
      [(regexp-match #px":" name)
       (rename (regexp-replace* #px":" name "_"))]
      [(regexp-match #px"-" name)
       (rename (regexp-replace* #px"-" name "_"))]
      [(regexp-match #px"\\*$" name)
       (rename (regexp-replace* #px"\\*$" name "_star"))]
      [else name]))
  (rename name))



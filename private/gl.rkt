#lang racket/base

(require (for-syntax racket/base)
         racket/provide
         opengl)

(provide
  (filtered-out
    (compose
      (λ (name) (regexp-replace* #px"^gl" name "")))
    (all-from-out opengl)))



#lang racket/base

(require (for-syntax racket/base)
         racket/provide
         sdl2/ttf)

(provide
  (filtered-out
    (λ (name)
       (regexp-replace* #px"^TTF_" name ""))
    (all-from-out sdl2/ttf)))


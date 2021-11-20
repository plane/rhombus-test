#lang racket/base

(require (for-syntax racket/base)
         racket/provide
         sdl2/image)

(provide
  (filtered-out
    (λ (name)
       (regexp-replace* #px"^IMG_" name ""))
    (all-from-out sdl2/image)))


#lang racket/base

(require (for-syntax racket/base
                     threading)
         racket/provide
         sdl2)

(provide
  (filtered-out
    (λ~> (regexp-replace* #px"\\*" _ "_ptr")
         (regexp-replace* #px"->" _ "_to_")
         (regexp-replace* #px"-" _ "_")
         (regexp-replace* #px"!" _ "")
         (regexp-replace* #px"/null" _ "_null")
         (regexp-replace* #px"^SDL_" _ ""))
    (all-from-out sdl2)))


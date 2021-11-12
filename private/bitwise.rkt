#lang racket/base

(require (for-syntax racket/base
                     "rhombus-names.rkt")
         racket/provide)

(provide
 (rename-out [bitwise-ior or])) 


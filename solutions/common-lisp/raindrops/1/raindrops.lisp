(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
    ;; initialize sound symbol as an empty string  
    (let ((sound ""))
      ;; concatenate to sound when divisible by 3
      (when (zerop (mod n 3)) 
        (setq sound (concatenate 'string sound "Pling")))
      ;; concatenate to sound when divisible by 5
      (when (zerop (mod n 5)) 
        (setq sound (concatenate 'string sound "Plang")))
      ;; concatenate to sound when divisible by 7
      (when (zerop (mod n 7)) 
        (setq sound (concatenate 'string sound "Plong")))
      ;; if the sound is still empty, cast number to string 
      (if (zerop (length sound))
        (write-to-string n)
        sound))
)


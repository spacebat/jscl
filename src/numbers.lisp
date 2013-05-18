;;; numbers.lisp

;; JSCL is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; JSCL is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with JSCL.  If not, see <http://www.gnu.org/licenses/>.

;;;; Various numeric functions and constants

;; TODO: Use MACROLET when it exists
(defmacro defcomparison (operator)
  `(defun ,operator (x &rest args)
     (while (not (null args))
       (if (,operator x (car args))
         (setq x    (car args)
               args (cdr args))
         (return-from ,operator nil)))
     t))

(defcomparison >)
(defcomparison >=)
(defcomparison <)
(defcomparison <=)

(defconstant pi 3.141592653589793) 

(defun evenp (x) (= (mod x 2) 0))
(defun oddp  (x) (not (evenp x)))

(flet ((%max-min (x xs func)
         (while (not (null xs))
           (setq x  (if (funcall func x (car xs))
                      x
                      (car xs))
                 xs (cdr xs)))
         x))
  (defun max (x &rest xs) (%max-min x xs #'>))
  (defun min (x &rest xs) (%max-min x xs #'<))) 

(defun abs (x) (if (> x 0) x (- x)))

(defun expt (base power) (expt base              power))
(defun exp  (power)      (expt 2.718281828459045 power))

(defmacro my-with-ansi (&rest body)
  `(cl-macrolet
       ,(mapcar
         (lambda (alias)
           `(,alias                     ; 関数名
             (string)                   ; 引数
             ,(list 'backquote (list 'message '(concat "<b>" ',string "/<b>"))))) ; 本体
         '(black)
         )
     ,(cons 'my-ansi--concat body)))

(defun my-ansi--concat (&rest sequences)
  (apply #'concat (cl-remove-if-not 'stringp sequences)))

(my-with-ansi "this is " (black "black") " text")

;; (ert-deftest my-with-ansi-test ()
;;   (let ((result (my-with-ansi "this is " (black "black") " text")))
;;     (should (string= "this is <b>black</b> text" result))
;;     )
;;   )
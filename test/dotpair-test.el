(ert-deftest dotpair-test ()
  (should (equal '(1 2 3) '(1 . (2 . (3 . nil)))))
  (let ((mapping '((a . "aaa")
                   (b . "bbb")
                   (c . "ccc"))))
    (should (equal '(a . "aaa") (car mapping)))
    (should (equal '((b . "bbb") (c . "ccc")) (cdr mapping)))
    (should (equal '(a . "aaa") (assq 'a mapping)))
    (should (equal 'a (car (assq 'a mapping))))
    (should (string= "aaa" (cdr (assq 'a mapping))))))

(ert-deftest assoc-test ()
  (let ((trees '((pine . cones) (oak . acorns) (maple . seeds))))
    (should (equal '(oak . acorns) (assoc 'oak trees)))
    (should (equal 'acorns (cdr (assoc 'oak trees))))
    (should (equal 'oak (car (assoc 'oak trees)))))
  (should (equal '(a b . c) (assoc 'a '((a . (b . c)) (b . (c . d))))))
  (should (equal '(a b) (assoc 'a '((a . (b . nil)) (b . (c . nil))))))
  (should (equal '(a b) (assoc 'a '((a b)))))
  (should (equal nil (assoc 'a '(a b))))
  (should (equal nil (assoc 'a nil))))

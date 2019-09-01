
(defun get-list ()
  (let ((item (read-char nil nil)))
    (if item (append (list item) (get-list)))
    ))

(setq numbers (get-list))

(defun remove-repeats (numbers occurred)
  (let (
        (item (car numbers))
        (numbers-left (cdr numbers))
        )
    (if (not item)
        (list)
      (let ( ; if the item isn't nil then check its membership
            (item-has-occurred (find item occurred))
            (expanded-occurred (append occurred (list item)))
            )
        (if item-has-occurred
            (remove-repeats numbers-left occurred)
          (append (list item) (remove-repeats numbers-left expanded-occurred))
          )))))


(setq removed-repeats (remove-repeats numbers (list)))

(defun print-items (items)
  (let (
        (item (car items))
        (rest (cdr items))
        )
    (if item
        (progn
          (format t "~D" item)
          (print-items rest)
          ))))

(print-items removed-repeats)

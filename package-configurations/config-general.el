;;; config-general --- Summary
;;; Commentary:
;;; Code:
(global-set-key (kbd "s-º") "\\")
(global-set-key (kbd "s-1") "|")
(global-set-key (kbd "s-2") "@")
(global-set-key (kbd "s-3") "#")
(global-set-key (kbd "M-ç") "}")
(global-set-key (kbd "M-+") "]")
(global-set-key (kbd "M-ñ") "~")
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)

(global-set-key (kbd "C-c m") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Appearance
(global-hl-line-mode 1)
(show-paren-mode 1)
(scroll-bar-mode -1)

(defun set-frame-alpha (arg &optional active)
  (interactive "nEnter alpha value (1-100): \np")
  (let* ((elt (assoc 'alpha default-frame-alist))
         (old (frame-parameter nil 'alpha))
         (new (cond ((atom old)     `(,arg ,arg))
                    ((eql 1 active) `(,arg ,(cadr old)))
                    (t              `(,(car old) ,arg)))))
    (if elt (setcdr elt new) (push `(alpha ,@new) default-frame-alist))
    (set-frame-parameter nil 'alpha new)))
(global-set-key (kbd "C-c t") 'set-frame-alpha)

(provide 'config-general)
;;; config-general.el ends here

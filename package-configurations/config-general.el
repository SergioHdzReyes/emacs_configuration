;;; config-general --- Summary
;;; Commentary:
;;; Code:

;;; (global-set-key (kbd "s-º") "\\")
;;; (global-set-key (kbd "s-1") "|")
;;; (global-set-key (kbd "s-2") "@")
;;; (global-set-key (kbd "s-3") "#")
;;; (global-set-key (kbd "M-ç") "}")
;;; (global-set-key (kbd "M-+") "]")
;;; (global-set-key (kbd "M-ñ") "~")

;; Appearance
(global-hl-line-mode 1)
(show-paren-mode 1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;;; (global-whitespace-mode)

(defun set-frame-alpha (arg &optional active)
  (interactive "nEnter alpha value (1-100): \np")
  (let* ((elt (assoc 'alpha default-frame-alist))
         (old (frame-parameter nil 'alpha))
         (new (cond ((atom old)     `(,arg ,arg))
                    ((eql 1 active) `(,arg ,(cadr old)))
                    (t              `(,(car old) ,arg)))))
    (if elt (setcdr elt new) (push `(alpha ,@new) default-frame-alist))
    (set-frame-parameter nil 'alpha new)))

(defun xah-beginning-of-line-or-block ()
    (interactive)
    (let (($p (point)))
      (if (or (equal (point) (line-beginning-position))
              (equal last-command this-command ))
          (if (re-search-backward "\n[\t\n ]*\n+" nil "NOERROR")
              (progn
		(skip-chars-backward "\n\t ")
		(forward-char ))
            (goto-char (point-min)))
	(progn
          (back-to-indentation)
          (when (eq $p (point))
            (beginning-of-line))))))

(defun xah-end-of-line-or-block ()
  "Move cursor to end of line or next paragraph.

    • When called first time, move cursor to end of line.
    • When called again, move cursor forward by jumping over any sequence of whitespaces containing 2 blank lines.

    URL `http://ergoemacs.org/emacs/emacs_keybinding_design_beginning-of-line-or-block.html'
    Version 2017-05-30"
  (interactive)
  (if (or (equal (point) (line-end-position))
	  (equal last-command this-command ))
      (progn
	(re-search-forward "\n[\t\n ]*\n+" nil "NOERROR" ))
    (end-of-line)))

(set-frame-alpha 86)

(global-set-key (kbd "M-g M-k") 'kill-buffer-and-window)
(global-set-key (kbd "M-g m") 'comment-or-uncomment-region)
(global-set-key (kbd "M-g M-b") 'ibuffer)

(global-set-key (kbd "C-a") 'xah-beginning-of-line-or-block)
(global-set-key (kbd "C-e") 'xah-end-of-line-or-block)

(global-set-key (kbd "M-g M-f") 'other-frame)
(global-set-key (kbd "M-g M-b") 'other-window)
(global-set-key (kbd "C-s-o") 'comint-clear-buffer)
(global-set-key (kbd "M-g M-d") 'dumb-jump-go)


(provide 'config-general)
;;; config-general.el ends here

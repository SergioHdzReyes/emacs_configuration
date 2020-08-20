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

(provide 'config-general)

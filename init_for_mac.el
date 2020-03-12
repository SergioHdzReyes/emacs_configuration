;;; init.el --- Init

;;; Commentary:
;;
;; Init
;;

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("55c2069e99ea18e4751bd5331b245a2752a808e91e09ccec16eb25dadbe06354" "a452345f40a4e1db132963ee8fee1a3018c13115871cb2658db153fad8a0db85" "d362eed16f74bfa8e49df0185a9336184d479e120c41837a5e6f020e0336bf7f" "5f1bd7f67dc1598977e69c6a0aed3c926f49581fdf395a6246f9bc1df86cb030" "6731049cee8f7cbd542d7b3e1c551f3fab716a92119bd7c77f0bd1ef20849fb8" "28caf31770f88ffaac6363acfda5627019cac57ea252ceb2d41d98df6d87e240" "947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" default)))
 '(global-flycheck-mode t)
 '(global-undo-tree-mode t)
 '(global-wakatime-mode t)
 '(google-translate-default-source-language "en" t)
 '(google-translate-default-target-language "es" t)
 '(js-indent-level 4)
 '(js2-basic-offset 4)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(package-selected-packages
   (quote
    (xref-js2 ac-js2 js2-mode exwm disk-usage forge twittering-mode undo-tree multiple-cursors wgrep-ag helm-ag ag treemacs restclient flycheck-clangcheck flycheck-clang-analyzer auto-complete-clang auto-complete-clang-async auto-complete-c-headers ac-clang dumb-jump web-mode tern org magit google-translate dracula-theme dash-functional company-php ac-php)))
 '(php-mode-coding-style (quote php))
 '(safe-local-variable-values (quote ((flycheck-gcc-language-standard . c99))))
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-error ((t (:foreground "DarkOrange2")))))


;; START
(setq wakatime-api-key "")
(setq wakatime-cli-path "/Library/Frameworks/Python.framework/Versions/3.7/bin/wakatime")
;;(global-wakatime-mode)

;; Funcion para ir a primer caracter de linea o a bloque de texto
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

(global-set-key (kbd "C-a") 'xah-beginning-of-line-or-block)
(global-set-key (kbd "C-e") 'xah-end-of-line-or-block)

(require 'php-mode)

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable auto-complete-mode
             (auto-complete-mode t)

             (require 'ac-php)
             (setq ac-sources '(ac-source-php))

             ;; As an example (optional)
             (yas-global-mode 1)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

	     (setq indent-tabs-mode nil
		   tab-width 4
		   c-basic-offset 4)

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

(require 'php-mode)

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             (require 'company-php)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

(add-to-list 'auto-mode-alist '("\\.ctp$" . php-mode))
(global-set-key (kbd "s-º") "\\")
(global-set-key (kbd "s-1") "|")
(global-set-key (kbd "s-2") "@")
(global-set-key (kbd "s-3") "#")
(global-set-key (kbd "M-ç") "}")
(global-set-key (kbd "M-+") "]")
(global-set-key (kbd "M-ñ") "~")
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)

(setq default-directory (concat (getenv "HOME") "/Proyectos/Enviaflores/"))
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)

(global-set-key (kbd "C-c m") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-a") "\\ChromePhp::info($, '');")
;; (global-set-key (kbd "C-c C-a") "cd && source config_emacs && cd && cd Proyectos/Enviaflores/")

;; Configuracion para GOOGLE TRANSLATE
(customize-set-variable 'google-translate-default-source-language "en")
(customize-set-variable 'google-translate-default-target-language "es")
(global-set-key (kbd "C-c C-t") 'google-translate-query-translate)
(global-set-key (kbd "C-c C-s") 'google-translate-smooth-translate)

;; AG
(setq ag-executable "/usr/local/bin/ag")
(setq helm-ag-base-command "pt -e --nocolor --nogroup")
(setq ag-highlight-search t)
(setq ag-reuse-window t)
(setq ag-reuse-buffers t)

;; IDO-MODE
(ido-mode 1)

;; TWITTER
(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)

;; Appearance
(global-hl-line-mode 1)
(show-paren-mode 1)
;; (global-highlight-changes-mode 1)

;; JS2-MODE
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; MAGIT
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
(global-set-key (kbd "C-x C-g") 'magit)

;; HS
(global-set-key (kbd "C-x C-j") 'hs-toggle-hiding)


(provide 'init)
;;; init.el ends here

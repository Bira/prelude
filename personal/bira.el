;;; prelude.el --- Personal customization for prelude
;;; Commentary:
;;; Code:
(global-linum-mode)
(prelude-ensure-module-deps '(go-mode
                              elixir-mode
                              rbenv
                              rubocop
                              ruby-hash-syntax
                              color-theme-solarized))
(if (file-exists-p "/opt/boxen/rbenv") (setq rbenv-installation-dir "/opt/boxen/rbenv"))
(global-rbenv-mode)
(if (window-system) (server-start))
(if (> (display-pixel-width) 1920)
    (set-frame-font "Source Code Pro-18")
  (set-frame-font "Source Code Pro-14"))
(load-theme 'solarized-light t)
(setq exec-path (cons (getenv "PATH") exec-path))
(global-set-key "\M-g" 'goto-line)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook (lambda() (whitespace-mode -1)))
(add-hook 'html-mode-hook (lambda() (whitespace-mode -1)))
(setq prelude-guru nil)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(setq-default fill-column 80)
(setq js-indent-level 2)
(setq require-final-newline t)
(provide 'bira)
;;; bira.el ends here

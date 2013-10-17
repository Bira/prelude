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
(set-frame-font "Source Code Pro-13")
(load-theme 'solarized-light t)
(setq exec-path (cons (getenv "PATH") exec-path))
(global-set-key "\M-g" 'goto-line)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)
             (setq whitespace-line-column 100)
             (whitespace-mode)
             (flycheck-mode)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq prelude-guru nil)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(setq-default fill-column 80)
(provide 'bira)
;;; bira.el ends here

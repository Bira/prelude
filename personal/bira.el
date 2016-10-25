;;; prelude.el --- Personal customization for prelude
;;; Commentary:
;;; Code:
(defvar prelude-guru)
(defvar js-indent-level)

(global-linum-mode)
(prelude-require-packages '(go-mode
                            elixir-mode
                            rust-mode
                            flycheck-rust
                            rbenv
                            rubocop
                            ruby-hash-syntax
                            color-theme-solarized))
(global-rbenv-mode)
(if (window-system) (server-start))
(set-frame-font "Hack-18")
(setq exec-path (cons (getenv "PATH") exec-path))
(global-set-key "\M-g" 'goto-line)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook (lambda()
                            (whitespace-mode -1)
                            (setq ruby-deep-arglist t)
                            (setq ruby-deep-indent-paren nil)))
(add-to-list 'auto-mode-alist '("\\.prawn\\'" . ruby-mode))
(add-hook 'html-mode-hook (lambda() (whitespace-mode -1)))
(add-hook 'coffee-mode-hook (lambda() (whitespace-mode -1)))
(add-hook 'slim-mode-hook (lambda() (whitespace-mode -1)))
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(setq prelude-guru nil)
(setq prelude-auto-save nil)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(setq-default fill-column 80)
(setq js-indent-level 2)
(setq require-final-newline t)
(provide 'bira)
;;; bira.el ends here

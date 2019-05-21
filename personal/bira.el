;;; prelude.el --- Personal customization for prelude
;;; Commentary:
;;; Code:
(require 'iso-transl)
(global-linum-mode)
(prelude-require-packages '(add-node-modules-path
                            deadgrep
                            doom-themes
                            prettier-js
                            rbenv
                            rubocop
                            ruby-hash-syntax))
(global-rbenv-mode)
(if (window-system) (server-start))
(set-frame-font "Hack")
(setq exec-path (cons (getenv "PATH") exec-path))
(global-set-key "\M-g" 'goto-line)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook (lambda()
                            (whitespace-mode -1)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'gfm-mode-hook 'turn-on-auto-fill)
(add-hook 'rust-mode-hook (lambda()
                            (flycheck-mode -1)))
(add-to-list 'auto-mode-alist '("\\.prawn\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.slm\\'" . slim-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-hook 'html-mode-hook (lambda() (whitespace-mode -1)))
(add-hook 'web-mode-hook #'add-node-modules-path)
(add-hook 'web-mode-hook #'prettier-js-mode)
(setq prelude-guru nil
      prelude-auto-save nil
      ido-use-filename-at-point nil
      ido-use-url-at-point nil
      ruby-use-smie t
      ruby-deep-arglist nil
      ruby-deep-indent-paren nil
      ruby-insert-encoding-magic-comment nil)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(setq-default fill-column 80)
(setq js2-basic-offset 2)
(setq require-final-newline t)
(global-set-key (kbd "<f5>") #'deadgrep)
(provide 'bira)
;;; bira.el ends here

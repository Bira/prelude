;;; prelude.el --- Personal customization for prelude
;;; Commentary:
;;; Code:
(require 'iso-transl)
(prelude-require-packages '(add-node-modules-path
                            deadgrep
                            doom-themes
                            prettier-js
                            rbenv
                            rubocop
                            ruby-hash-syntax
                            slim-mode
                            web-mode))
(global-rbenv-mode)
(if (window-system) (server-start))
(set-frame-font "Fira Code")
(setq exec-path (cons (getenv "PATH") exec-path))
(global-set-key "\M-g" 'goto-line)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook (lambda()
                            (whitespace-mode -1)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'gfm-mode-hook 'turn-on-auto-fill)
(add-hook 'rust-mode-hook (lambda()
                            (flycheck-mode -1)))
(add-hook 'slim-mode-hook (lambda()
                            (whitespace-mode -1)))
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.prawn\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.slm\\'" . slim-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-hook 'html-mode-hook (lambda() (whitespace-mode -1)))
(add-hook 'rjsx-mode-hook #'add-node-modules-path)
(add-hook 'rjsx-mode-hook #'prettier-js-mode)
(add-hook 'rjsx-mode-hook (lambda() (whitespace-mode -1)))
(setq prelude-guru nil
      prelude-auto-save nil
      lsp-enable-snippet nil
      ruby-use-smie t
      ruby-deep-arglist nil
      ruby-deep-indent-paren nil
      ruby-insert-encoding-magic-comment nil
      js2-strict-missing-semi-warning nil)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(setq-default fill-column 80)
(setq js2-basic-offset 2)
(setq require-final-newline t)
(global-set-key (kbd "<f5>") #'deadgrep)
(provide 'bira)
;;; bira.el ends here

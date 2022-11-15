(require 'iso-transl)

(setq-default fill-column 80)
(setq require-final-newline t)

(set-frame-font "Fira Code Retina-12")
(global-set-key "\M-g" 'goto-line)

(if (window-system) (server-start))

;; Theme

(prelude-require-packages '(doom-themes
                            doom-modeline
                            all-the-icons))

(doom-modeline-mode 1)


;; Deadgrep

(prelude-require-package 'deadgrep)
(global-set-key (kbd "<f5>") #'deadgrep)

;; General development

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Ruby development

(add-hook 'ruby-mode-hook (lambda()
                            (whitespace-mode -1)))

(add-to-list 'auto-mode-alist '("\\.prawn\\'" . ruby-mode))

(setq ruby-use-smie t
      ruby-deep-arglist nil
      ruby-deep-indent-paren nil
      ruby-insert-encoding-magic-comment nil)

(prelude-require-package 'rbenv)
(rbenv-use-global)

(prelude-require-package 'rubocop)

;; Front-end development

(prelude-require-packages '(slim-mode
                            prettier-js))
(add-to-list 'auto-mode-alist '("\\.slm\\'" . slim-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))

(flycheck-add-mode 'javascript-eslint 'rjsx-mode)
(add-hook 'rjsx-mode-hook (lambda() (whitespace-mode -1)))
(add-hook 'rjsx-mode-hook #'add-node-modules-path)
(add-hook 'rjsx-mode-hook #'prettier-js-mode)

(add-hook 'slim-mode-hook (lambda ()
                            (whitespace-mode -1)))

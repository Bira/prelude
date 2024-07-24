(require 'iso-transl)

(setq-default fill-column 80)
(super-save-mode -1)
(setq require-final-newline t
      prelude-guru nil
      prelude-flyspell nil)


(setq default-frame-alist '((font . "Monaspace Neon-11")))
(global-set-key "\M-g" 'goto-line)

;; Theme

(prelude-require-packages '(doom-themes
                            doom-modeline
                            nerd-icons))

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

;; Rust development

(add-hook 'rust-mode-hook (lambda()
                            (setq whitespace-line-column 100)))

;; Front-end development

(prelude-require-packages '(slim-mode
                            rjsx-mode
                            prettier-js))

(add-to-list 'auto-mode-alist '("\\.slm\\'" . slim-mode))

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))

(setq js2-strict-missing-semi-warning nil)

(flycheck-add-mode 'javascript-eslint 'rjsx-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)


;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(add-hook 'rjsx-mode-hook (lambda() (whitespace-mode -1)))
;; (add-hook 'rjsx-mode-hook #'add-node-modules-path)
(add-hook 'rjsx-mode-hook #'prettier-js-mode)

(add-hook 'slim-mode-hook (lambda ()
                            (whitespace-mode -1)))
;; Writing

(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

(server-start)

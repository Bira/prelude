;;; prelude.el --- Personal customization for prelude
;;; Commentary:
;;; Code:
(global-linum-mode)
(prelude-ensure-module-deps '(rbenv rubocop ruby-hash-syntax))
(global-rbenv-mode)
(if (window-system) (server-start))
(set-frame-font "Source Code Pro-13")
(setq exec-path (cons (getenv "PATH") exec-path))
(setq prelude-guru nil)
(provide 'bira)
;;; bira.el ends here

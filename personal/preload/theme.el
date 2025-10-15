(defun system-dark-mode-enabled-p ()
  "Check if dark mode is currently enabled"
  (if (string= (shell-command-to-string "gsettings get org.gnome.desktop.interface color-scheme") "\'prefer-dark\'\n") t))

(defvar prelude-theme-type
  (if (system-dark-mode-enabled-p) 'dark 'light))

(defvar prelude-themes
  '((light . doom-tomorrow-day)
    (dark  . doom-palenight)))
(setq prelude-theme (cdr (assoc prelude-theme-type prelude-themes)))

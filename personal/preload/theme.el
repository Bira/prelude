(defvar prelude-theme-type 'light)
(defvar prelude-themes
  '((light . doom-tomorrow-day)
    (dark  . doom-tomorrow-night)))
(setq prelude-theme (cdr (assoc prelude-theme-type prelude-themes)))

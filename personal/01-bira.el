;; -*- lexical-binding: t; -*-
(require 'iso-transl)

;; Disable bidirectional text scanning (comment this out if you need it)
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

;; Skip fontification during input (for performance)
(setq redisplay-skip-fontification-on-input t)

;; Increase Process Output Buffer for LSP
(setq read-process-output-max (* 4 1024 1024))

;; Kill ring tweaks
(setq save-interprogram-paste-before-kill t)
(setq kill-do-not-save-duplicates t)

(setq-default fill-column 80)
(super-save-mode -1)
(setq require-final-newline t
      prelude-guru nil
      prelude-flyspell nil)


(setq default-frame-alist '((font . "Fira Code-11")))
(ligature-set-ligatures 't '("www"))
;; Enable traditional ligature support in eww-mode, if the
;; `variable-pitch' face supports it
(ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
;; Enable all Cascadia and Fira Code ligatures in programming modes
(ligature-set-ligatures 'prog-mode
                      '(;; == === ==== => =| =>>=>=|=>==>> ==< =/=//=// =~
                        ;; =:= =!=
                        ("=" (rx (+ (or ">" "<" "|" "/" "~" ":" "!" "="))))
                        ;; ;; ;;;
                        (";" (rx (+ ";")))
                        ;; && &&&
                        ("&" (rx (+ "&")))
                        ;; !! !!! !. !: !!. != !== !~
                        ("!" (rx (+ (or "=" "!" "\." ":" "~"))))
                        ;; ?? ??? ?:  ?=  ?.
                        ("?" (rx (or ":" "=" "\." (+ "?"))))
                        ;; %% %%%
                        ("%" (rx (+ "%")))
                        ;; |> ||> |||> ||||> |] |} || ||| |-> ||-||
                        ;; |->>-||-<<-| |- |== ||=||
                        ;; |==>>==<<==<=>==//==/=!==:===>
                        ("|" (rx (+ (or ">" "<" "|" "/" ":" "!" "}" "\]"
                                        "-" "=" ))))
                        ;; \\ \\\ \/
                        ("\\" (rx (or "/" (+ "\\"))))
                        ;; ++ +++ ++++ +>
                        ("+" (rx (or ">" (+ "+"))))
                        ;; :: ::: :::: :> :< := :// ::=
                        (":" (rx (or ">" "<" "=" "//" ":=" (+ ":"))))
                        ;; // /// //// /\ /* /> /===:===!=//===>>==>==/
                        ("/" (rx (+ (or ">"  "<" "|" "/" "\\" "\*" ":" "!"
                                        "="))))
                        ;; .. ... .... .= .- .? ..= ..<
                        ("\." (rx (or "=" "-" "\?" "\.=" "\.<" (+ "\."))))
                        ;; -- --- ---- -~ -> ->> -| -|->-->>->--<<-|
                        ("-" (rx (+ (or ">" "<" "|" "~" "-"))))
                        ;; *> */ *)  ** *** ****
                        ("*" (rx (or ">" "/" ")" (+ "*"))))
                        ;; www wwww
                        ("w" (rx (+ "w")))
                        ;; <> <!-- <|> <: <~ <~> <~~ <+ <* <$ </  <+> <*>
                        ;; <$> </> <|  <||  <||| <|||| <- <-| <-<<-|-> <->>
                        ;; <<-> <= <=> <<==<<==>=|=>==/==//=!==:=>
                        ;; << <<< <<<<
                        ("<" (rx (+ (or "\+" "\*" "\$" "<" ">" ":" "~"  "!"
                                        "-"  "/" "|" "="))))
                        ;; >: >- >>- >--|-> >>-|-> >= >== >>== >=|=:=>>
                        ;; >> >>> >>>>
                        (">" (rx (+ (or ">" "<" "|" "/" ":" "=" "-"))))
                        ;; #: #= #! #( #? #[ #{ #_ #_( ## ### #####
                        ("#" (rx (or ":" "=" "!" "(" "\?" "\[" "{" "_(" "_"
                                     (+ "#"))))
                        ;; ~~ ~~~ ~=  ~-  ~@ ~> ~~>
                        ("~" (rx (or ">" "=" "-" "@" "~>" (+ "~"))))
                        ;; __ ___ ____ _|_ __|____|_
                        ("_" (rx (+ (or "_" "|"))))
                        ;; Fira code: 0xFF 0x12
                        ("0" (rx (and "x" (+ (in "A-F" "a-f" "0-9")))))
                        ;; Fira code:
                        "Fl"  "Tl"  "fi"  "fj"  "fl"  "ft"
                        ;; The few not covered by the regexps.
                        "{|"  "[|"  "]#"  "(*"  "}#"  "$>"  "^="))
;; Enables ligature checks globally in all buffers. You can also do it
;; per mode with `ligature-mode'.
(global-ligature-mode t)
(global-set-key "\M-g" 'goto-line)

;; Theme

(prelude-require-packages '(doom-themes
                            doom-modeline
                            nerd-icons))

(doom-modeline-mode 1)

(defun switch-prelude-theme ()
  (interactive)
  (if (eq prelude-theme-type 'light)
      (setq prelude-theme-type 'dark)
    (setq prelude-theme-type 'light)
    )
  (disable-theme prelude-theme)
  (setq prelude-theme (cdr (assoc prelude-theme-type prelude-themes)))
  (load-theme prelude-theme t)
  )

;; Deadgrep

(prelude-require-package 'deadgrep)
(global-set-key (kbd "<f5>") #'deadgrep)

;; General development

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Ruby development

(add-hook 'ruby-mode-hook (lambda()
                            (whitespace-mode -1)))

(add-to-list 'auto-mode-alist '("\\.prawn\\'" . ruby-mode))

(setq ruby-use-smie nil
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
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

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

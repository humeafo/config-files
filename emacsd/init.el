(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme")


;; set up package repository
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(push "/Applications/ccl" exec-path)
(push "/Applications/racket/racket/bin" exec-path)
(push "/usr/local/bin" exec-path)
(push "/usr/local/go/bin" exec-path)
(push "/Users/yinwang/Code/go/bin" exec-path)

;; key bindings
;; (when (eq system-type 'darwin) ;; mac specific settings
;;   (setq mac-option-modifier 'alt)
;;   (setq mac-command-modifier 'meta)
;;   (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
;;   )

;; fix the PATH variable
;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))


;; (set-face-attribute 'default nil :font "Inconsolata 14")

(setq default-frame-alist
      '((width . 100)
        (height . 50)
        (left . 80)
        (top . 20)))


(require 'cl)

;; --------------- icicle minibuffer completion ---------------
;; (require 'icicles)
;; (icy-mode 1)
;; ;; rebind keys that icicles bound to inconvenient places
;; (add-hook 'icicle-mode-hook
;;   (lambda ()
;;     (define-key minibuffer-local-completion-map (icicle-kbd "up") 'previous-history-element)
;;     (define-key minibuffer-local-completion-map (icicle-kbd "down") 'next-history-element)
;;     (define-key minibuffer-local-completion-map (icicle-kbd "M-p") 'previous-history-element)
;;     (define-key minibuffer-local-completion-map (icicle-kbd "M-n") 'next-history-element)))


;; --------------------- Boolean Settings ---------------------
(tool-bar-mode 0)
(blink-cursor-mode 0)
(menu-bar-mode 1)
(setq column-number-mode t)
(global-font-lock-mode t)
(global-auto-revert-mode t)
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq mouse-yank-at-point t)
(setq enable-recursive-minibuffers nil)
(auto-image-file-mode)
(setq require-final-newline nil)
(setq mode-require-final-newline nil)
(setq transient-mark-mode t)
(setq x-select-enable-clipboard t)
(setq truncate-partial-width-windows nil)
(setq backup-inhibited t)
(setq vc-handled-backends nil)
(setq-default visual-line-mode t)
(set-language-environment "utf-8")


;; ------------------------- value settings -----------------------
(setq frame-title-format "%b - emacs")
(setq user-full-name "Yin Wang")
(setq user-mail-address "yinwang0@gmail.com")

(setq kill-ring-max 3000)
(setq undo-limit 536000000)
(setq default-fill-column 80)
(setq browse-url-mozilla-program "firefox")

(setq default-major-mode 'text-mode)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'jump)

(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
(defun range (start end step)
  (cond
   ((> start end) '())
   (t (cons start (range (+ step start) end step)))))

(setq tab-stop-list (mapcar (lambda (x) (* default-tab-width x)) (range 1 40 1)))

(setq sentence-end "\\([¡££¡£¿]\\|¡­¡­\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(put 'erase-buffer 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
(put 'add-hook 'lisp-indent-function 1)

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; display time
(setq display-time-24hr-format nil)
(display-time)

(setq completion-ignored-extensions
      (append completion-ignored-extensions (list ".exe" ".manifest" ".hi")))

;; long lines
(autoload 'longlines-mode "longlines.el" "Minor mode for editing long lines." t)
(autoload 'markdown-mode "markdown-mode.el" "markdown mode" t)


;; set color for parentheses
(require 'parenface)
(set-face-foreground 'paren-face "DimGray")



;; ------------------------- global keys ---------------------------

;; disable minimize window
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "M-r"))

;; useful comment commands
(defun comment-defun ()
  (interactive)
  (mark-defun)
  (comment-region (region-beginning)
                  (region-end)))


(defun comment-box-defun (arg)
  (interactive "p")
  (mark-defun)
  (comment-box (region-beginning)
               (region-end)
               (prefix-numeric-value arg)))


(setq bookmark-save-flag 1)
(setq bookmark-default-file "~/.emacs.d/bookmarks")
(global-set-key (kbd "<f2>") 'pop-tag-mark)

(global-set-key (kbd "C-c C-c") 'copy-to-register)
(global-set-key (kbd "C-c C-v") 'insert-register)

(global-set-key (kbd "<f9>") 'narrow-to-region)
(global-set-key (kbd "<C-f9>") 'widen)

(global-set-key (kbd "<C-f12>") 'comment-defun)
(global-set-key (kbd "<f12>") 'comment-or-uncomment-region)

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "s-g") 'goto-char)

(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line))


;; windmove keys
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)


(require 'smooth-scrolling)
(setq smooth-scroll-margin 3)


(require 'ido)
(ido-mode t)


(require 'ibuffer)
(global-set-key (kbd "C-b") 'ibuffer)


(require 'swbuff)
(global-set-key (kbd "<s-left>") 'swbuff-switch-to-previous-buffer)
(global-set-key (kbd "<s-right>") 'swbuff-switch-to-next-buffer)
(setq swbuff-exclude-buffer-regexps
     '("^ " "\\*.*\\*"))

(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 0.5)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)


(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

(require 'setnu)

(require 'pager)
(global-set-key [next]     'pager-page-down)
(global-set-key [prior]    'pager-page-up)
(global-set-key '[M-up]    'pager-row-up)
(global-set-key '[M-kp-8]  'pager-row-up)
(global-set-key '[M-down]  'pager-row-down)
(global-set-key '[M-kp-2]  'pager-row-down)


(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-deep-blue)
;; (color-theme-hober)
;; (color-theme-snowish)
;; (color-theme-dark-laptop)
;; (color-theme-robin-hood)
))


;; ------------------- window switchers -------------------
(global-set-key (kbd "C-n") 'other-window)
(global-set-key (kbd "C-p") 'other-window-backward)

(defun other-window-backward (n)
  "Select the previous window"
  (interactive "p")
  (other-window (- n)))



;; ------------------ window scrolling -------------------
(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)

(defun scroll-n-lines-ahead (&optional n)
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n)))

(defun scroll-n-lines-behind (&optional n)
  (interactive "P")
  (scroll-behind (prefix-numeric-value n)))

(global-set-key (kbd "C-q") 'scroll-n-lines-behind)
(global-set-key (kbd "C-z") 'scroll-n-lines-ahead)


;; ------------------- language modes -------------------
(add-to-list 'auto-mode-alist '("\\.yin$" . yin-mode))
(add-to-list 'auto-mode-alist '("\\.rkt$" . scheme-mode))
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.el$" . emacs-lisp-mode))


;; Whitespace
(require 'whitespace)
(global-whitespace-mode 1)
;; (setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))


;; ------------------ paredit-mode -----------------
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)


;; ---------------------- Lisp ------------------------
(defun elisp-hook ()
  (paredit-mode 1)
  (define-key emacs-lisp-mode-map (kbd "C-z") 'eval-last-sexp)
  (define-key emacs-lisp-mode-map (kbd "<f2>") 'eval-last-sexp)
  (define-key emacs-lisp-mode-map (kbd "<f3>") 'eval-defun))

(add-hook 'emacs-lisp-mode-hook 'elisp-hook)
(add-hook 'lisp-interaction-mode-hook 'elisp-hook)

(defun lisp-hook ()
  (paredit-mode 1)
  (define-key lisp-mode-map (kbd "C-z") 'slime-eval-last-expression)
  (define-key lisp-mode-map (kbd "<f2>") 'slime-eval-last-expression)
  (define-key lisp-mode-map (kbd "<f3>") 'slime-eval-defun))

(add-hook 'slime-mode-hook 'lisp-hook)

;; SLIME
(add-to-list 'load-path "~/.emacs.d/slime")
(setq inferior-lisp-program "/usr/local/bin/sbcl --dynamic-space-size 4096")
(require 'slime)
(slime-setup)


;; ------------------------ Scheme --------------------------
(setq scheme-program-name "racket -I typed/racket")


(defvar *binding-constructs*
  '(let-values
    let*-values
    hash-for-each
    letv
    let\:
    lambda\:
    letv*
    match
    pmatch
    for
    for/list
    fun
    record))

(defun clear-geiser-buffer ()
  (interactive)
  (geiser-mode-switch-to-repl nil)
  (geiser-repl-clear-buffer)
  (other-window -1))

(add-hook 'scheme-mode-hook
  (lambda ()
    (paredit-mode 1)
    (set-face-foreground 'paren-face "DimGray")
    (define-key scheme-mode-map (kbd "C-z") 
      '(lambda (print-to-buffer)
         (interactive "P")
         (geiser-eval-last-sexp print-to-buffer)))
    (define-key scheme-mode-map (kbd "<f2>")
      '(lambda (print-to-buffer) 
         (interactive "P")
         (geiser-eval-last-sexp print-to-buffer)))
    (define-key scheme-mode-map (kbd "<f3>") 
      '(lambda () 
         (interactive)
         (geiser-eval-definition)))
    (define-key scheme-mode-map (kbd "<f4>") 
      '(lambda () 
         (interactive)
         (save-buffer)
         (geiser-mode-switch-to-repl 4)
         (other-window -1)))
    (define-key scheme-mode-map (kbd "<f5>") 'next-error)
    (define-key scheme-mode-map (kbd "<f6>") 'previous-error)
    (define-key scheme-mode-map (kbd "<f7>") 'clear-geiser-buffer)
    (define-key scheme-mode-map (kbd "C-<f2>")
      (lambda ()
        (interactive)
        (geiser-mode-switch-to-repl 1)
        (geiser-repl-clear-buffer)
        (other-window -1)))
    ;; set proper indentation for non-standard binding constructs
    (mapc (lambda (x) (put x 'scheme-indent-function 1)) *binding-constructs*)))



;; ------------------------- Yin -------------------------
(require 'yin-mode)

(add-hook 'yin-mode-hook
  (lambda ()
    (paredit-mode 1)
    (paren-face-add-support yin-font-lock-keywords)
    (set-face-foreground 'paren-face "DimGray")
    (mapc (lambda (x) (put x 'yin-indent-function 1)) *binding-constructs*)))



;; -------------------------- Go --------------------------
(require 'go-mode-load)
(defun go-custom ()
  "go-mode-hook"
  (setenv "GOROOT" "/user/local/go")
  (setenv "GOPATH" "/Users/yinwang/Code/go/src/sourcegraph.com/sourcegraph/Godeps/_workspace:/Users/yinwang/Code/go")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (set (make-local-variable 'tab-width) 4))

(add-hook 'go-mode-hook
  '(lambda () (go-custom)))

(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "<f3>") 'godef-jump)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "M-/") 'auto-complete)))

;; (require 'auto-complete)
;; (require 'go-autocomplete)
;; (require 'auto-complete-config)
;; (setq ac-auto-start t)
;; (ac-set-trigger-key "TAB")
;; (global-set-key "\M-." 'auto-complete)
;; (global-auto-complete-mode t)
;; (add-to-list 'ac-modes 'go-mode)


;; ------------------ C/C++ -------------------------
(setq c-default-style "linux"
      c-basic-offset 4)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For loading the session
;; KEEP AT BOTTOM !
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(require 'server)
(unless (server-running-p) (server-start))

(require 'tramp)
(setq tramp-default-method "scp")


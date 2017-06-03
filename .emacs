(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes
   (quote
    ("cb4cb09f1736cfb2a80ef371c33a9868cbf6707ec5af51d61162483d6c3fbb7c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" default)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(fci-rule-color "#14151E")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t (:background "color-97")))))

;; MELPA repository
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; helm
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(helm-mode 1)

;; display column and row information
(setq column-number-mode t)

;; ace-window for faster switching between visible windows
(global-set-key (kbd "M-P") 'ace-window)

;; show-paren-mode to true, which will hightlight matching parenthesis
(show-paren-mode 1)
;; auto complete bracket
(electric-pair-mode 1)
;; highlight entire expression
(setq show-paren-style 'expression)

;; enable auto complete mode
(global-auto-complete-mode t)

;; display time
(display-time)

;; enable neotree - sidebar for Emacs
(global-set-key [f8] 'neotree-toggle)

;; projectile - project management
(projectile-global-mode)
(helm-projectile)
(global-set-key [f9] 'helm-projectile-find-file)
(global-set-key [f7] 'helm-projectile-find-file-in-known-projects)
(global-set-key [f6] 'helm-projectile-grep)

;; comment-uncomment line
(defun toggle-comment-on-line ()
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

;; flycheck
;; Now add the following code to your init file to permanently enable syntax checking with Flycheck:
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; disable startup-screen
(setq inhibit-startup-message t)

;; (desktop-save-mode 1)

(defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
      (interactive "p")
      (let ((beg (line-beginning-position))
	    (end (line-end-position arg)))
	(when mark-active
	  (if (> (point) (mark))
	      (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
	    (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
	(if (eq last-command 'copy-line)
	    (kill-append (buffer-substring beg end) (< end beg))
	  (kill-ring-save beg end)))
      (kill-append "\n" nil)
      (beginning-of-line (or (and arg (1+ arg)) 2))
      (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

(global-set-key (kbd "C-c C-k") #'copy-line)

(global-set-key (kbd "C-x g") 'magit-status)


;; fast code commenting

(global-set-key (kbd "C-M-_") 'comment-region)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
    (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "C-c l") 'toggle-comment-on-line)

(global-set-key (kbd "C-c r") 'comment-or-uncomment-region)

(defun toggle-comment-on-function ()
  "comment or uncomment current function"
  (interactive)
  (comment-or-uncomment-region (backward-sentence) (forward-sentence)))

(global-set-key (kbd "C-c f") 'toggle-comment-on-function)

;; faster code Copy

(defun copy-function ()
  "copy the whole function from any point within it"
  (interactive)
  (kill-ring-save (backward-sentence) (forward-sentence))
  )

(global-set-key (kbd "C-c C-c") 'copy-function)


;; Emacs lisp auto completion and documentation pop up
 (require 'ac-slime)
 (add-hook 'slime-mode-hook 'set-up-slime-ac)
 (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'slime-repl-mode))

;; Faster shrink and enlarge frame
(defun enlarge-window-horizontally-10-times ()
  (interactive)
  (enlarge-window-horizontally 10))

(defun enlarge-window-vertically-10-times ()
  (interactive)
  (enlarge-window 10))

(defun shrink-window-horizontally-10-times ()
  (interactive)
  (shrink-window-horizontally 10))

(defun shrink-window-vertically-10-times ()
  (interactive)
  (shrink-window 10))

;; Dumb-jump-go
(global-set-key (kbd "C-M-p") 'dumb-jump-go)
(global-set-key (kbd "C-M-b") 'dumb-jump-back)

;; swapping buffer
(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window, and vice versa"
  (interactive)
  (let* ((this (selected-window))
     (other (next-window))
     (this-buffer (window-buffer this))
     (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)
    )
  )

;; Nodejs - REPL
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(require 'nodejs-repl)

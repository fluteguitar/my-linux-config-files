(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" default)))
 '(desktop-save-mode t)
 '(fci-rule-color "#14151E")
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smtpmail-smtp-server "mail.twc.com")
 '(smtpmail-smtp-service 25)
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
 '(vc-annotate-very-old-color nil))
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
(global-set-key (kbd "M-p") 'ace-window)

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

 (desktop-save-mode 1)

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

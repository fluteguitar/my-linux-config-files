(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes (quote ("28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" default)))
 '(fci-rule-color "#14151E")
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "mail.twc.com")
 '(smtpmail-smtp-service 25)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#d54e53") (40 . "goldenrod") (60 . "#e7c547") (80 . "DarkOliveGreen3") (100 . "#70c0b1") (120 . "DeepSkyBlue1") (140 . "#c397d8") (160 . "#d54e53") (180 . "goldenrod") (200 . "#e7c547") (220 . "DarkOliveGreen3") (240 . "#70c0b1") (260 . "DeepSkyBlue1") (280 . "#c397d8") (300 . "#d54e53") (320 . "goldenrod") (340 . "#e7c547") (360 . "DarkOliveGreen3"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(electric-indent-mode +1)
(require 'package)

;; If you want to use latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; If you want to use last tagged version
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(ac-config-default)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(add-hook 'slime-repl-mode-hook 'auto-complete-mode)
(add-hook 'slime-repl-mode-hook 'paredit-mode)
(add-hook 'slime-repl-mode-hook 'add-ac-slime-fuzzy)
(add-hook 'slime-mode-hook 'add-ac-slime-fuzzy)
(define-key global-map (kbd "C-x t") 'switch-to-completions)


(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            (setq dired-guess-shell-gnutar "gtar")
            (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            (dired-omit-mode 1)
            ))
;; Configure flymake for Python
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pylint-init)))

;; Set as a minor mode for Python
(add-hook 'python-mode-hook '(lambda () (flymake-mode)))
(require 'ido)
(ido-mode t)
(setq user-mail-address "canhtoannguyen60@gmail.com")
(require 'smtpmail)
(require 'starttls)

(setq message-send-mail-function 'smtpmail-send-it)
(defun gnutls-available-p ()
  "Function redefined in order not to use built-in GnuTLS support"
  nil)
(setq starttls-gnutls-program "gnutls-cli")
(setq starttls-use-gnutls t)
(setq smtpmail-stream-type 'starttls)
(setq smtpmail-smtp-server "posteo.de")
(setq smtpmail-smtp-service 587) ;;587(starttls) or 465(tls/ssl)
(setq starttls-extra-arguments '("--priority" "NORMAL:%COMPAT"))


;; use IPython
(setq-default py-shell-name "ipython")
(setq python-shell-interpreter "/home/toannc/anaconda3/bin/ipython3")
(setq-default py-which-bufname "IPython")
;;use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
      '("--gui=wx" "--pylab=wx" "-colors" "LightBG"))
(setq py-force-py-shell-name-p t)

;; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
;; don't split windoes
(setq py-split-windows-on-execute-p nil)
;;try to automagically figure out indendation
(setq py-smart-indendation t)

;; show column-number-mode
(setq column-number-mode t)

;; python elpy
(require 'package)
(add-to-list 'package-archives' ("elpy" . "http://jorgenschaefer.github.io/packages/"))

;; faster switching between windows in the same frame
(windmove-default-keybindings)

;; auto saving and restoring Emacs' previous section
;; (destop-save-mode 1)
(setq custom-file "~/.emacs-custom.el")
(load custom-file)
(setq-default elpy-mode t)
(setq-default elpy-enable t)

;;  How to scroll other window backwards? C-M-v does forwards

(defun scroll-other-window-up ()
  "Scroll the other window one line up."
  (interactive)
  (scroll-other-window -1)
  )
(defun scroll-other-window-down ()
  "Scroll the other window one line down."
  (interactive)
  (scroll-other-window 1)
  )
(global-set-key [C-M-S-up] 'scroll-other-window-up)
(global-set-key [C-M-S-down] 'scroll-other-window-down)

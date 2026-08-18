;;; -*- lexical-binding: t -*-

(global-unset-key (kbd "C-z"))

(use-package emacs
  :config
  (set-default-coding-systems 'utf-8)

  (defun set-input-method-chinese ()
    (interactive)
    (set-input-method "pyim"))
  (defun set-input-method-german ()
    (interactive)
    (set-input-method "german"))
  (defun set-input-method-TeX ()
    (interactive)
    (set-input-method "TeX"))

  :bind
  (("C-c i c" . set-input-method-chinese)
   ("C-c i g" . set-input-method-german)
   ("C-c i t" . set-input-method-TeX)
   ("M-o" . other-window)
   ("C-c v" . visual-line-mode))

  :custom
  (auto-fill-function 'do-auto-fill t)
  (calendar-week-start-day 1)
  (completion-ignore-case t)
  (custom-enabled-themes '(modus-operandi) nil nil)
  (default-input-method "german")
  (display-battery-mode t)
  (display-time-mode t)
  (electric-pair-mode t)
  (enable-local-variables :safe)
  (face-font-family-alternatives
   '(("Consolas" "Microsoft Yahei")
     ("Aptos" "Microsoft Yahei")))
  (indent-tabs-mode nil)
  (inhibit-startup-screen t)
  (menu-bar-mode t)
  (message-default-mail-headers nil)
  (message-sendmail-envelope-from 'header)
  (modus-themes-bold-constructs nil)
  (modus-themes-inhibit-reload nil)
  (modus-themes-italic-constructs t)
  (modus-themes-mixed-fonts t)
  (network-security-level 'paranoid)
  (ring-bell-function 'ignore)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (require-final-newline t)
  (scroll-bar-mode t)
  (tab-always-indent 'complete)
  (tool-bar-mode nil)
  (treesit-language-source-alist '((sml "https://github.com/MatthewFluet/tree-sitter-sml" "v0.22.0" nil "gcc" "cpp")))
  (user-mail-address "yc@apvc.uk"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package sml-ts-mode
  :ensure t)

(use-package pyim
  :ensure t)

(use-package pyim-basedict
  :ensure t
  :config
  (pyim-basedict-enable))

(use-package shr
  :custom
  (shr-cookie-policy nil)
  (shr-inhibit-images t)
  (shr-use-colors nil))

(use-package visual-fill
  :ensure t
  :hook
  ((visual-line-mode . (lambda () (visual-fill-mode 'toggle)))
   (visual-line-mode . (lambda () (adaptive-wrap-prefix-mode 'toggle)))))

(use-package adaptive-wrap
  :ensure t)

(use-package text-mode
  :hook
  ((text-mode . variable-pitch-mode)))

(use-package savehist
  :init
  (savehist-mode))

(use-package vertico
  :ensure t
  :custom
  (vertico-mode t))

; compat with hledger https://hledger.org/editors.html
(use-package ledger-mode
  :ensure t
  :custom
  ((ledger-binary-path "hledger")
   (ledger-mode-should-check-version nil)
   (ledger-report-auto-width nil)
   (ledger-report-links-in-register nil)
   (ledger-report-native-highlighting-arguments '("--color=always")))
  :mode ("\\.hledger\\'" "\\.ledger\\'"))

(use-package org
  :config
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  :bind
  (("C-c a" . org-agenda)
   ("C-c t" . org-timer-set-timer))
  :custom
  (org-clock-sound "C:/Windows/Media/Alarm01.wav")
  (org-agenda-custom-commands '(("o" "Overdue TODOs" tags-todo "+TIMESTAMP<\"<today>\"")))
  (org-timer-default-timer 20)
  (org-agenda-inhibit-startup t)
  (org-agenda-window-setup 'current-window)
  (org-agenda-start-with-log-mode nil)
  (org-clock-mode-line-total 'current)
  (org-agenda-prefix-format
   '((agenda . " %i %?-12t% s")
     (todo . " %i %-12:c")
     (tags . " %i %-12:c")
     (search . " %i %-12:c")))
  (org-agenda-files
   "/Users/User/Projects/org/agenda-file-list.txt")
  (org-directory "/Users/User/Projects/org")
  (org-agenda-span 'day)
  (org-display-custom-times nil)
  (org-time-stamp-custom-formats '("%m-%d" . "%H:%M")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas"))))
 '(org-block ((t (:family "Consolas"))))
 '(variable-pitch ((t (:family "Aptos")))))

(use-package tex-mode
  :custom
  (latex-run-command "C:/Users/User/scoop/apps/miktex/current/texmfs/install/miktex/bin/x64/miktex-lualatex.exe"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))

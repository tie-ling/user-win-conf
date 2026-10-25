;;; -*- lexical-binding: t -*-

(global-unset-key (kbd "C-z"))

;; UTF-8 as default encoding
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)

;; add this especially on Windows, else python output problem
(set-terminal-coding-system 'utf-8-unix)
(set-fontset-font "fontset-default" 'han "Microsoft Yahei")

(use-package emacs
  :config
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
   ("M-o" . other-window))

  :custom
  ;; for syncing org agenda after git pull
  (global-auto-revert-mode t)
  (auto-fill-function 'do-auto-fill t)
  (calendar-week-start-day 1)
  (completion-ignore-case t)
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
  (network-security-level 'paranoid)
  (ring-bell-function 'ignore)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (require-final-newline t)
  (scroll-bar-mode t)
  (tab-always-indent 'complete)
  (tool-bar-mode nil))

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

(use-package text-mode
  :hook
  ((text-mode . variable-pitch-mode)))

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
  (("C-c a" . org-agenda))
  :custom
  (org-agenda-custom-commands '(("o" "Overdue TODOs" tags-todo "+TIMESTAMP<\"<today>\"")))
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
 '(org-verbatim ((t (:family "Consolas"))))
 '(variable-pitch ((t (:family "Aptos")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; -*- lexical-binding: t -*-

(global-unset-key (kbd "C-z"))

;; UTF-8 as default encoding
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)

;; add this especially on Windows, else python output problem
(set-terminal-coding-system 'utf-8-unix)
(set-fontset-font "fontset-default" 'han "Microsoft Yahei")

(use-package emacs
  :bind
  (("C-c i c" . (lambda () (interactive) (set-input-method "pyim")))
   ("C-c i g" . (lambda () (interactive) (set-input-method "german")))
   ("C-c i t" . (lambda () (interactive) (set-input-method "TeX")))
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
  (treesit-language-source-alist
   '((sml "https://github.com/MatthewFluet/tree-sitter-sml" "v0.22.0" nil nil "cpp")
     (typst "https://github.com/Ziqi-Yang/tree-sitter-typst" nil nil nil "cpp")
     (nix "https://github.com/nix-community/tree-sitter-nix" "v0.3.0" nil nil "cpp")
))
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

(use-package typst-ts-mode
  :custom
  (typst-ts-watch-options '("--open"))
  :config
  (keymap-set typst-ts-mode-map "C-c C-c" #'typst-ts-tmenu)
  :ensure t)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package nix-ts-mode
  :mode ("\\.nix\\'")
  :ensure t)

(use-package ledger-mode
  :ensure t
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
  (org-directory "/Users/User/Projects/agenda/")
  ;; Use full agenda file path to speed up loading
  (org-agenda-files
   (mapcar #'(lambda (s) (concat org-directory s))
   '("future.org" "one-off.org" "repeat.org" "uni.org")))
  (org-agenda-span 'day)
  (org-display-custom-times nil)
  (org-time-stamp-custom-formats '("%m-%d" . "%H:%M")))

(use-package ispell
  :custom
  (ispell-program-name "hunspell")
  (ispell-dictionary "de_DE,en_US")
  ;; For saving words to the personal dictionary, don't infer it from
  ;; the locale, otherwise it would save to ~/.hunspell_de_DE.
  (ispell-personal-dictionary "~/hunspell_personal_dictionary")
  :config
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "de_DE,en_US")
  ;; The personal dictionary file has to exist, otherwise hunspell will
  ;; silently not use it.
  (unless (file-exists-p ispell-personal-dictionary)
    (write-region "" nil ispell-personal-dictionary nil 0)))

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
 '(package-selected-packages
   '(adaptive-wrap auctex ledger-mode nix-ts-mode pyim-basedict
                   sml-ts-mode typst-ts-mode vertico visual-fill)))

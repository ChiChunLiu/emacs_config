;; emacs set-up tweaked from Mike Zamansky

(setq inhibit-startup-message t)
(global-linum-mode t)
(setq linum-format "%4d")
(tool-bar-mode -1)

(setq
  backup-by-copying t      ; don't clobber symlinks
  backup-directory-alist
   '(("." . "~/.saves/"))    ; don't litter my fs tree
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)       ; use versioned backups

(require 'package)
(setq package-enable-at-startup nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (ivy-hydra ess org-vcard nord-theme ivy use-package htmlize flycheck elpy))))


(package-initialize)
(when (not package-archive-contents)
 (package-refresh-contents))


(use-package nord-theme
  :ensure t
  :init
  (load-theme 'nord t))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package ivy-hydra
  :ensure t)

;; Haskell
(use-package haskell-mode
  :disabled
  :ensure t)

;; ESS
(use-package ess
 :disabled
 :ensure t
 :init (require 'ess-site))

;; org related
(setq org-agenda-files '("~/org"))

(use-package org-bullets
 :ensure t
 :config
 (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;; Requirement for swiper
(use-package counsel
  :ensure t)


(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))


(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  :custom
  (projectile-completion-system 'ivy)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;;; init.el ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

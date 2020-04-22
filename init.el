;;; emacs set-up built on Mike Zamansky's config

;;; Code:
(setq inhibit-startup-message t)
(global-linum-mode t)
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

;; (add-to-list 'package-archives
;;       '("melpa" . "http://melpa.org/packages/") t)


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar ini-packages
  '(better-defaults))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
       ini-packages)

(load-theme 'nord t)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(windmove-default-keybindings)

;; it looks like counsel is a requirement for swiper
(use-package counsel
:ensure t
)

(use-package swiper
:ensure try
:config
(progn
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
))


(use-package auto-complete
:ensure t
:init
(progn
(ac-config-default)
(global-auto-complete-mode t)
))

;; pip install pylint
(use-package flycheck
:ensure t
:init
(global-flycheck-mode t))

;; pip install virtualenv
(use-package jedi
:ensure t
:init
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup))
;; M-x jedi:install-server

(use-package yasnippet
:ensure t
:init
(yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
)

;; (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/yasnippet-snippets/snippets")

;;; init.el ends here



(mapc (apply-partially 'add-to-list 'load-path)
      '("~/.emacs.d/use-package/"))


;; Standard package.el + MELPA setup
;; (See also: https://github.com/milkypostman/melpa#usage)
(require 'package)
(require 'use-package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(package-list-packages)

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package python-environment
  :ensure t
)

(use-package jedi
  :ensure t
  :config
  (jedi:install-server)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.raml$" . yaml-mode))
  (add-hook 'yaml-mode-hook
    '(lambda ()
       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
)

(use-package json-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
)

(use-package coffee-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
  )

(use-package multi-term
  :ensure t
  :config
  )

(use-package groovy-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Jenkinsfile$" . groovy-mode))
)

(use-package org
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-theme-load-path (quote (custom-theme-directory t "/home/cazino/.emacs.d/emacs-color-theme-solarized")))
 '(flycheck-python-flake8-executable "/home/cazino/.local/bin/flake8")
 '(frame-background-mode (quote dark))
 '(indent-tabs-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; init.el is not a package
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(load-theme 'solarized t)

(fset 'ipdb
      "import ipdb; ipdb.set_trace()")

(fset 'pdb
      "import pdb; pdb.set_trace()")

(fset 'rdb
   "import celery.contrib.rdb; celery.contrib.rdb.set_trace()")

(fset 'absimport
   "from __future__ import absolute_import")

(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

(defun my-css-mode-hook ()
  (setq tab-width 4)
  (setq css-indent-offset 4)
  (setq indent-tabs-mode t))

(add-hook 'css-mode-hook 'my-css-mode-hook)
(add-hook 'css-mode-hook 'whitespace-mode)
(add-hook 'groovy-mode-hook 'whitespace-mode)

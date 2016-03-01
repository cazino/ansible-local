;; Make the GUI version gets the right path
;; read in PATH
(setenv "PATH"
  (concat
   "/home/emmanuel/.local/bin" ";"
   (getenv "PATH")
  )
)




(mapc (apply-partially 'add-to-list 'load-path)
      '("~/.emacs.d/use-package/"))


;; Standard package.el + MELPA setup
;; (See also: https://github.com/milkypostman/melpa#usage)
(require 'package)
(require 'use-package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(use-package flycheck
  :config
  (global-flycheck-mode))


(use-package jedi
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))

;;(add-hook 'after-init-hook (lambda () (load "/home/emmanuel/.emacs.d/after-init.el")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-theme-load-path (quote (custom-theme-directory t "/home/emmanuel/.emacs.d/emacs-color-theme-solarized")))
 '(frame-background-mode (quote dark))
 '(indent-tabs-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'solarized t)

(fset 'ipdb
   "import ipdb; ipdb.set_trace()")


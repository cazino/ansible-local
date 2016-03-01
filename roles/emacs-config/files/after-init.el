(package-install 'flycheck)
(global-flycheck-mode)
#(add-hook 'after-init-hook #'global-flycheck-mode)

;; Standard Jedi.el setting
(package-install 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)



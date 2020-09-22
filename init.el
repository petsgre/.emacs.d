(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'my-init)
(require 'my-common)
(require 'my-tools)
(require 'my-web)
(require 'my-edit)
(require 'my-unknown)

(require 'my-alias)
(require 'my-theme)

;; (require 'my-prettier)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default-input-method "rime")
 '(exec-path-from-shell-check-startup-files nil)
 '(lsp-vetur-format-default-formatter-css "none")
 '(lsp-vetur-format-default-formatter-html "none")
 '(lsp-vetur-format-default-formatter-js "none")
 '(lsp-vetur-validation-template nil)
 '(package-selected-packages
   (quote
    (org-plus-contrib org pinyinlib wgrep hl-todo zenburn-theme youdao-dictionary which-key use-package undo-tree try solarized-theme smartparens prettier-js popwin multiple-cursors magit js2-mode iedit expand-region emmet-mode dumb-jump company-web company-quickhelp company-box color-theme auto-complete ag add-node-modules-path))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

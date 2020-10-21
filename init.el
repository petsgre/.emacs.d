(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'my-init)
(require 'my-common)
(require 'my-tools)
(require 'my-web)
(require 'my-edit)
(require 'my-backend)
(require 'my-unknown)

(require 'my-alias)
(require 'my-theme)

;; (require 'my-prettier)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(exec-path-from-shell-check-startup-files nil)
 '(package-selected-packages
   (quote
    (zenburn-theme youdao-dictionary yasnippet xclip which-key wgrep web-mode vterm visual-fill-column use-package-ensure-system-package undo-tree try tide terminal-focus-reporting ssass-mode solarized-theme smex smartparens scss-mode reveal-in-osx-finder rainbow-identifiers rainbow-fart quelpa-use-package pyim prettier-js popwin pinyinlib persistent-scratch ox-reveal org-plus-contrib nyan-mode neotree multiple-cursors mmm-mode material-theme magit js2-mode iedit hl-todo grip-mode fzf expand-region exec-path-from-shell emmet-mode edit-indirect dumb-jump diminish diff-hl counsel-projectile company-web company-quickhelp company-box color-theme beacon auto-complete amx ag add-node-modules-path))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

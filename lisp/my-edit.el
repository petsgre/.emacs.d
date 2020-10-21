;; 折叠和收缩代码
(use-package 
  hideshow 
  :ensure t 
  :diminish hs-minor-mode 
  :bind (:map prog-mode-map
              ("C-c TAB" . hs-toggle-hiding) 
              ("C-c p +" . hs-show-all)
              ) 
  :hook (prog-mode . hs-minor-mode))

;; 括号匹配
(use-package 
  smartparens 
  :ensure t 
  :hook ('prog-mode . 'smartparens-global-mode))

;; 修改两端
(add-to-list 'load-path "~/emacs-surround")
(require 'emacs-surround)
(global-set-key (kbd "C-q") 'emacs-surround)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(provide 'my-edit)

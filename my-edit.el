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

(provide 'my-edit)

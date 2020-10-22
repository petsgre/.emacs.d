;; 彩虹猫
(use-package nyan-mode
  :ensure t
  :init
(nyan-mode t))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  (display-time-mode 1))

(provide 'my-modeline)

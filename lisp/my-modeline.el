;; 彩虹猫
(use-package nyan-mode
  :ensure t
  :init
(nyan-mode t))

;; 在mode line 显示时间
(display-time-mode 1)

;;时间使用24小时制
(setq display-time-24hr-format t)

;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)

;;时间栏旁边启用邮件设置
(setq display-time-use-mail-icon t)

;;时间的变化频率
(setq display-time-interval 10)

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

(provide 'my-modeline)

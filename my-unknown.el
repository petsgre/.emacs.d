
;; 让 Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(setq dired-dwin-target 1)


;; 让光标无法离开视线
(setq mouse-yank-at-point nil)


(provide 'my-unknown)

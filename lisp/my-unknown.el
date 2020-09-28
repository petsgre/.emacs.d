
;; 让 Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(setq dired-dwin-target 1)


;; 让光标无法离开视线
(setq mouse-yank-at-point nil)

;; (use-package counsel-etags
;;   :ensure t
;;   :bind (("C-]" . counsel-etags-find-tag-at-point))
;;   :init
;;   (add-hook 'prog-mode-hook
;;         (lambda ()
;;           (add-hook 'after-save-hook
;;             'counsel-etags-virtual-update-tags 'append 'local)))
;;   :config
;;   (setq counsel-etags-update-interval 60)
;;   (push "build" counsel-etags-ignore-directories))


(defun testxxx ()
  (interactive)
  (princ "Enter Radius: ")
  ;; (ibuffer)
  ;; (split-window-right)
  (other-window 2)
  )


(provide 'my-unknown)

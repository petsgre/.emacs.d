
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

;; (require 'tide)

;; (dolist (hook (list
;;                'js2-mode-hook
;; 	       'web-mode-hook
;;                'rjsx-mode-hook
;;                'typescript-mode-hook
;;                ))
;;   (add-hook hook (lambda ()
;;                    ;; 初始化 tide
;;                    (tide-setup)
;;                    ;; 当 tsserver 服务没有启动时自动重新启动
;;                    (unless (tide-current-server)
;;                      (tide-restart-server))
;;                    )))

;; 针对 web-mode 做一个配置
    ;; (add-hook 'web-mode-hook
    ;;         (lambda ()
    ;;           (set (make-local-variable 'company-backends)
    ;;                '(
    ;;                   company-tide
    ;;                   ;company-react
    ;;                   company-dabbrev-code
    ;;                   company-keywords
    ;;                   company-files
    ;;                   company-yasnippet))))

(provide 'my-unknown)


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


;; (defun testxxx()
;;   (princ "Enter Radius: ")
;;   )

(defun testxxx ()
  (interactive)
  (princ "Enter Radius: ")
  ;; (ibuffer)
  ;; (split-window-right)
  (other-window 2)
  )
;;(global-set-key (kbd "C-x C-b") 'testxxx)
;;(global-set-key (kbd "C-x b") 'counsel-ibuffer)

;; (use-package smart-input-source
;;   :init
;;   ;; set the english input source
;;   (setq smart-input-source-english "com.apple.keylayout.ABC")
;;   ;;(setq smart-input-source-external-ism "/usr/local/bin/macism")
;;   ;;(setq smart-input-source-english "com.apple.keylayout.US")
;;   ;; set the default other language input source for all buffer
;;   ;;(setq-default smart-input-source-other "com.sogou.inputmethod.sogou.pinyin")
 
;;   ;; customize your own triggers, the /hint-mode/ may help.
;;   ;; (push 'YOUR-COMMAND smart-input-source-preserve-save-triggers)

;;   ;; :hook
;;   ;; enable the /follow context/ and /inline region/ mode for specific buffers
;;   ;; (((text-mode prog-mode) . smart-input-source-follow-context-mode)
;;   ;;  ((text-mode prog-mode) . smart-input-source-inline-mode))

;;   ;; :bind
;;   ;; (("C-;" . smart-input-source-switch))
;;   :config
;;   ;; enable the /cursor color/ mode
;;   ;; (smart-input-source-global-cursor-color-mode t)
;;   ;; enable the /respect/ mode
;;   (smart-input-source-global-respect-mode t)
;;   ;; enable the /follow context/ mode for all buffers
;;   (smart-input-source-global-follow-context-mode t)
;;   ;; enable the /inline english/ mode for all buffers
;;   (smart-input-source-global-inline-mode t)
;;   (add-hook 'smart-input-source-set-english-hook #'testxxx)
;;   )

(use-package telega
  :load-path  "~/telega.el"
  :commands (telega)
  :defer t)

;;(telega-notifications-mode 1)

(provide 'my-unknown)

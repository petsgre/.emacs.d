;; html标签补全
(use-package emmet-mode
  :ensure t
  :commands emmet-mode
  :hook
  (sgml-mode . emmet-mode)
  (web-mode  . emmet-mode)
  (css-mode  . emmet-mode))

;; prettier
(use-package prettier-js
  :ensure t
  )

(defun format-with-prettier ()
  (interactive)
  (prettier-js)
  (princ "格式化好了，牛逼666")
  )

;; 格式化快捷键
(global-set-key (kbd "C-M-\\") 'format-with-prettier)

;; 优先读取node_modules的path
(use-package add-node-modules-path
  :ensure t
  :config
  ;; automatically run the function when web-mode starts
  (eval-after-load 'web-mode
    '(add-hook 'web-mode-hook 'add-node-modules-path)))

(use-package css-mode
  :ensure t
  :mode "\\.css\\'"
  :config
  (setq css-indent-offset 2)
  (add-hook 'scss-mode-hook #'electric-pair-mode)
  )

(use-package lsp-mode
  :ensure t
  :hook (
         (css-mode . lsp)))

;; web-mode
(use-package web-mode
  :ensure t
  ;; :mode ("\\.html\\'" "\\.tsx\\'" "\\.js\\'" "\\.scss\\'" "\\.json\\'" "\\.jsx\\'")
  ;; :mode ("\\.vue\\'" "\\.html\\'" "\\.ts\\'" "\\.js\\'" "\\.json\\'" "\\.jsx\\'")
  :mode ("\\.vue\\'" "\\.html\\'" "\\.tsx\\'" "\\.ts\\'" "\\.js\\'" "\\.json\\'" "\\.jsx\\'")
  :bind(("C-,". lsp-find-definition)
        ("C-'". completion-at-point))
  :hook(
        (web-mode . electric-pair-mode));; 回车括号光标居中
  :config  
  (add-to-list 'web-mode-comment-formats '(("javascript" . "//")
                                           ("js" . "//")
                                           ;;("ts" . "//")
                                           ("tsx" . "//")
                                           ("vue" . "//")))
  (add-hook 'web-mode-hook #'lsp)
  (add-hook 'web-mode-hook
  (lambda ()
  (if (equal web-mode-content-type "javascript")
  (web-mode-set-content-type "jsx")
  (message "now set to: %s" web-mode-content-type))))
  (setq-default indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  ;; (add-hook 'web-mode-hook 'prettier-js-mode)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-css-colorization t)
  ;; (set-face-attribute 'web-mode-html-tag-face nil :foreground "royalblue")
  ;; (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "powderblue")
  ;; (set-face-attribute 'web-mode-doctype-face nil :foreground "lightskyblue")
  (setq web-mode-content-types-alist
        '(("vue" . "\\.vue\\'"))))


(setq web-mode-content-types-alist
      '(("vue" . "\\.vue\\'")))

(defun my/web-vue-setup()
  (setq web-mode-indent-level 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 0
        web-mode-script-padding 0))

(add-hook 'web-mode-hook
          (lambda ()
            (cond ((equal web-mode-content-type "vue")
                   (my/web-vue-setup)))))


(defun my-set-tab-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.min.js\\'" buffer-file-name))
    (toggle-truncate-lines)))

(add-hook 'web-mode-hook 'my-set-tab-mode)


;; 代码检查工具
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(flycheck-add-mode 'javascript-eslint 'js-mode)
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'vue-mode)

;; 之前使用这个配置获取node_modules下的路径  现在使用上面的add-node-modules-path
;; (defun my/use-eslint-from-node-modules ()
;;   (let* ((root (locate-dominating-file
;;                 (or (buffer-file-name) default-directory)
;;                 "node_modules"))
;;          (eslint (and root
;;                       (expand-file-name "node_modules/eslint/bin/eslint.js"
;;                                         root))))
;;     (when (and eslint (file-executable-p eslint))
;;       (setq-local flycheck-javascript-eslint-executable eslint))))
;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; 用来加载js文件，现在用web-mode加载js了
;; (use-package js2-mode
;;   :ensure t
;;   :mode (("\\.js\\'" . js2-mode)
;;          ("\\.json\\'" . javascript-mode))
;;   :config
;;   (setq js2-mode-show-parse-errors nil)
;;   (setq js2-mode-show-strict-warnings nil))
;; (add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
;; (add-hook 'scss-mode-hook (lambda () (setq-default css-indent-offset 2)))

;; 针对js vue 文件 使用tide模式 调用 tsserver进行代码补全和跳转到定义
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode nil)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; (use-package tide
;;   :ensure t
;;   :bind (("M-." . tide-jump-to-definition)
;;          ("M-," . tide-jump-back))
;;   :config
;;   (setup-tide-mode)
;;   (add-hook 'web-mode-hook #'setup-tide-mode))

(provide 'my-web)

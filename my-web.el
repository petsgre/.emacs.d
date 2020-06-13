(use-package emmet-mode
  :ensure t
  :commands emmet-mode
  :hook
  (sgml-mode . emmet-mode)
  (web-mode  . emmet-mode)
  (css-mode  . emmet-mode))

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" "\\.vue\\'" "\\.tsx\\'" )
  :config
  (setq-default indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
;;  (add-hook 'web-mode-hook 'prettier-js-mode)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-css-colorization t)
  ;; (set-face-attribute 'web-mode-html-tag-face nil :foreground "royalblue")
  ;; (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "powderblue")
  ;; (set-face-attribute 'web-mode-doctype-face nil :foreground "lightskyblue")
  (setq web-mode-content-types-alist
        '(("vue" . "\\.vue\\'"))))

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode)
         ("\\.json\\'" . javascript-mode))
  :config
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil))

(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))

(provide 'my-web)

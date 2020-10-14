(use-package lsp-java
  :ensure t
  :config
  (add-hook 'java-mode-hook #'lsp))

;; (require 'lsp-java-boot)

;; ;; to enable the lenses
;; (add-hook 'lsp-mode-hook #'lsp-lens-mode)
;; (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

(provide 'my-backend)

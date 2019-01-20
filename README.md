# auto-fix.el

Fix current buffer automatically

![Capture](https://raw.githubusercontent.com/tomoya/auto-fix/master/images/capture_20190120131817.gif)

## Variables

This package have 2 important buffer local variables. Please let you set using the hook.

### auto-fix-command

This is the command to fix code. Default value is `nil`.

### auto-fix-option

This is the option string to fix for the command. Default value is `--fix`.

## Setup

To enable auto-fix before saving add the following to your init file:

### For TypeScript

```lisp
(defun setup-ts-auto-fix ()
  (setq-local auto-fix-command "tslint")
  (auto-fix-mode +1))

(add-hook 'auto-fix-mode-hook
          (lambda () (add-hook 'before-save-hook #'auto-fix-before-save)))

(add-hook 'typescript-mode-hook #'setup-ts-auto-fix)
```

### Combination with flycheck

```lisp
;; Flycheck using project linter
(defun my-use-local-lint ()
  "Use local lint if exist it."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory) "node_modules"))
         (tslint (and root (expand-file-name "node_modules/.bin/tslint" root))))
    (when (and tslint (file-executable-p tslint))
      (setq-local flycheck-typescript-tslint-executable tslint)
      (setq-local auto-fix-command tslint))))

(add-hook 'flycheck-mode-hook #'my-use-local-lint)

;; auto fix
(add-hook 'auto-fix-mode-hook
          (lambda () (add-hook 'before-save-hook #'auto-fix-before-save)))

(add-hook 'typescript-mode-hook #'auto-fix-mode)
```

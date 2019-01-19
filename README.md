# auto-fix.el

Fix current buffer automatically

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

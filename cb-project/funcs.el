;;; Code:

(require 's)
(require 'dash)

(defvar project/current-scope-alist
  nil
  "Alist of projects to scopes.")

(defun project/set-scope (dir)
  "Set the scope for the current project to DIR."
  (interactive (list (read-directory-name "Scope to directory: ")))
  (let ((mapping (cons (projectile-project-root) dir)))
    (add-to-list 'project/current-scope-alist mapping)))

(defun project/find-file-in-scope (&optional arg)
  "Find a file in the current scope.  With ARG, set the scope."
  (interactive "P")
  (when arg
    (call-interactively 'project/set-scope))
  (-if-let ((_ . dir) (assoc (projectile-project-root) project/current-scope-alist))
      (projectile-find-file-in-directory dir)
    (call-interactively 'project/set-scope)
    (project/find-file-in-scope)))

(with-eval-after-load 'projectile
  (defun projectile-relevant-known-projects ()
    "Return a list of known projects except the current one (if present)."
    (if (projectile-project-p)

        (->> projectile-known-projects
             (--reduce-from
              (if (-contains? (-map 's-downcase acc) (s-downcase it)) acc (cons it acc))
              (list (abbreviate-file-name (projectile-project-root))))
             (-sort 'string-lessp))

      projectile-known-projects))
  )

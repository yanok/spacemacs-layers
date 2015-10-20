;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defconst user-layers-directory "~/.spacemacs-layers/")

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path (list user-layers-directory)
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '((auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t
      auto-completion-enable-sort-by-usage t)
     agda
     latex
     ;; haskell
     osx
     git
     version-control
     scala
     markdown
     dockerfile
     finance
     org
     emacs-lisp
     rcirc
     restclient
     syntax-checking
     (shell
      :variables
      shell-default-shell 'eshell
      shell-protect-eshell-prompt nil
      )
     gtags
     (c-c++
      :variables
      c-c++-default-mode-for-headers 'c++-mode
      c-c++-enable-clang-support t
      )
     clojure
     cb-core
     cb-sunrise-commander
     cb-autoinsert
     cb-flycheck
     cb-org
     cb-org-reveal
     cb-elisp
     cb-cosmetic
     cb-spelling
     cb-git
     cb-yasnippet
     cb-project
     cb-smartparens
     cb-ledger
     cb-proof
     cb-haskell
     cb-scala
     cb-sml
     ;; cb-csharp
     ;; cb-rust
     cb-idris
     ;; cb-agda
     cb-coffeescript
     cb-sql
     ;; cb-shell
     cb-eshell
     cb-elfeed
     cb-calc
     ;; cb-extempore
     cb-groovy
     cb-crontab
     cb-js
     ;; cb-mu4e
     ;; cb-cpp
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(antlr-mode muttrc-mode yaml-mode)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages
   '(rainbow-delimiters clean-aindent-mode eshell-prompt-extras company-quickhelp)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages nil))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; Show a backtrace if I've stuffed up something in my configuration.
  (setq debug-on-error t)
  (setq debug-on-quit t)

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'doge
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark solarized-light)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   ;; HACK: Spacemacs currently expects this var to be defined.
   git-gutter-use-fringe t
   )
  ;; User initialization goes here

  ;; The org repo is required for `org-plus-contrib'. This means `package.el'
  ;; must be explicitly (re)initialised.
  (require 'package)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
  (unless package-alist (package-refresh-contents))
  (package-initialize)

  ;; The following packages are required by layers at the top-level, and must be
  ;; manually installed before Spacemacs loads those layers.
  (core/install-package 's)
  (core/install-package 'noflet)
  (core/install-package 'f)
  (core/install-package 'let-alist)
  (core/install-package 'dash)
  (core/install-package 'dash-functional)
  (core/install-package 'helm) ;; HACK: needed for Spacemacs

  ;; Some random utilities and editor tools are installed in these dirs.
  (add-to-list 'exec-path "~/.cabal/bin/")
  (add-to-list 'exec-path "~/bin/")
  (add-to-list 'exec-path "/usr/local/bin/")

  ;; Ensure the `cb-core' layer is loaded before all others. This layer contains
  ;; utilities needed by other layers.
  (load (concat user-layers-directory "cb-core/funcs.el"))
  (load (concat user-layers-directory "cb-core/config.el")))


(defun core/mk-package-dir-regexp (pkg)
  (rx-to-string `(and ,(symbol-name pkg)
                      "-" (repeat 8 digit) "." (repeat 3 4 digit) (? "/"))))

(defvar core/package-installation-attempts 2)

(defun core/install-package (pkg &optional attempts cur)
  (cond
   ((null attempts)
    (core/install-package pkg core/package-installation-attempts 1))
   ((< attempts cur)
    (error "Unable to install %s after %s attempt(s)" pkg attempts))
   (t
    (if (equal 1 cur)
        (message "--> Installing package %s..." pkg)
      (message "--> Installing package %s... (attempt %s/%s)" pkg cur attempts))
    (condition-case err
        (cond
         ((require 'paradox nil t)
          (paradox-require pkg))
         ((package-installed-p pkg)
          (require pkg))
         (t
          (package-install pkg)
          (require pkg)))
      (error
       (let ((archives (concat package-user-dir "/archives")))
         (when (file-directory-p archives)
           (message "--> Cleaning package archives...")
           (delete-directory archives t)))

       (dolist (entry (directory-files package-user-dir t))
         (when (string-match-p (core/mk-package-dir-regexp pkg) (file-name-nondirectory entry))
           (message "--> Deleting existing package at %s..." entry)
           (delete-directory entry t)))

       (package-refresh-contents)
       (package-initialize)
       (core/install-package pkg attempts (1+ cur)))))))

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (setq custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file))
  (require 'personal-config nil t)

  ;; Disable debugging now that my configuration has loaded.
  (setq debug-on-error nil)
  (setq debug-on-quit nil))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

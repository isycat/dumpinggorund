;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory. aasd

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     python
     rust
     yaml
     html
     typescript
     javascript
     ruby
     markdown
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     osx
     tabbar
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(ellaandr
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "s-SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, start an Emacs server if one is not already running.
   dotspacemacs-enable-server t
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dota-alert-new-blog-post ()
  (message "checking patch log..")
  (with-temp-buffer
    (insert-file-contents "/tmp/dota-patch.log")
    (let ((lines (s-split "\n" (buffer-string))))
      (if (-any? 'dota-new-patch? lines)
          (message "💜💙💚💛❤️💖 N E W  P A T C H 💜💙💚💛❤️💖")
        (message "no new patch yet 🐸 feelsbad")))))

(defun dota-new-patch? (line)
  "Returns `t' if the line is a log4r warning"
  (s-starts-with? "W," line))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."



  (setq exec-path-from-shell-arguments '("-i"))



  (require 'helm-bookmark)


  (setq default-tab-width 4)

  (defun indent-region-custom(numSpaces)
    (progn
      ; default to start and end of current line
      (setq regionStart (line-beginning-position))
      (setq regionEnd (line-end-position))

      ; if there's a selection, use that instead of the current line
      (when (use-region-p)
        (setq regionStart (region-beginning))
        (setq regionEnd (region-end))
      )

      (save-excursion ; restore the position afterwards
        (goto-char regionStart) ; go to the start of region
        (setq start (line-beginning-position)) ; save the start of the line
        (goto-char regionEnd) ; go to the end of region
        (setq end (line-end-position)) ; save the end of the line

        (indent-rigidly start end numSpaces) ; indent between start and end
        (setq deactivate-mark nil) ; restore the selected region
      )
    )
  )

  (defun untab-region (N)
    (interactive "p")
    (indent-region-custom (- 0 4))
    ;(indent-region-custom (- 0 tab-width))
  )


  (defun tab-region (N)
    (interactive "p")
    (if (active-minibuffer-window)
      (minibuffer-complete)    ; tab is pressed in minibuffer window -> do completion
    ; else
    (if (string= (buffer-name) "*shell*")
      (comint-dynamic-complete) ; in a shell, use tab completion
    ; else
      (if (use-region-p)    ; tab is pressed is any other buffer -> execute with space insertion
        ;(indent-region-custom (- 0 tab-width))
        (indent-region-custom 4)
        (insert "    ") ; else insert four spaces as expected
    )))
  )

  (defun org-bindings (N)
    (progn
      (define-key org-mode-map (kbd "S-M-<right>") nil)
      (define-key org-mode-map (kbd "s-<up>") 'scroll-down-line)
      (define-key org-mode-map (kbd "s-<down>") 'scroll-up-line)
      (define-key org-mode-map (kbd "<PageUp>") 'evil-scroll-page-up)
      (define-key org-mode-map (kbd "<PageDown>") 'evil-scroll-page-down)
      (define-key org-mode-map (kbd "<home>") 'beginning-of-buffer)
      (define-key org-mode-map (kbd "<end>") 'end-of-buffer)
      (define-key org-mode-map (kbd "s-<return>") 'link-hint-open-link-at-point)
    )
  )

  (auto-insert-mode)
  (auto-insert)


  (define-key key-translation-map (kbd "M-SPC") (kbd "C-c"))



  ;; org-mode stuf --------------------------------------------------------------------------
  (setq-default org-display-custom-times t)
  (setq org-time-stamp-custom-formats '("<%a %b %e %Y>" . "<%a %b %e %Y %H:%M>"))

  (setq org-support-shift-select t)

  (setq org-todo-keywords
        '((sequence "✴️" "🔁" "|" "✅" "❌")))

  (setq org-todo-keyword-faces
        '(("WAIT" . org-warning)
          ("PROG" . (:foreground "#ffcc00" :weight bold))))

  (eval-after-load "org" '(define-key org-mode-map (kbd "C-<tab>") 'tabbar-forward-tab))
  (eval-after-load "org" '(define-key org-mode-map (kbd "M-<left>") 'left-word))
  (eval-after-load "org" '(define-key org-mode-map (kbd "M-<right>") 'right-word))
  (eval-after-load "org" '(define-key org-mode-map (kbd "S-M-<left>") nil))
  (eval-after-load "org" '(define-key org-mode-map (kbd "S-M-<right>") nil))

  (eval-after-load "org" '(eval-after-load "org" '(org-bindings (- 0 4))))
  (eval-after-load "org" '(define-key org-mode-map (kbd "S-M-<right>") nil))
  (eval-after-load "org" '(define-key org-mode-map (kbd "s-<up>") 'scroll-down-line))
  (eval-after-load "org" '(define-key org-mode-map (kbd "s-<down>") 'scroll-up-line))
  (eval-after-load "org" '(define-key org-mode-map (kbd "<PageUp>") 'evil-scroll-page-up))
  (eval-after-load "org" '(define-key org-mode-map (kbd "<PageDown>") 'evil-scroll-page-down))
  (eval-after-load "org" '(define-key org-mode-map (kbd "<prior>") 'evil-scroll-page-up))
  (eval-after-load "org" '(define-key org-mode-map (kbd "<next>") 'evil-scroll-page-down))
  (eval-after-load "org" '(define-key org-mode-map (kbd "<home>") 'beginning-of-buffer))
  (eval-after-load "org" '(define-key org-mode-map (kbd "<end>") 'end-of-buffer))
  (eval-after-load "org" '(define-key org-mode-map (kbd "s-<return>") 'link-hint-open-link-at-point))

  (setq frame-inhibit-implied-resize nil)


  (global-set-key (kbd "<backtab>") 'untab-region)
  (global-set-key (kbd "<tab>") 'tab-region)
  (global-set-key (kbd "s-<return>") 'link-hint-open-link-at-point)

  (setq org-agenda-files '("~/notes"))

  ;; calendar:
  (defun today ()
    (interactive)
    (insert (shell-command-to-string "python3.7 ~/Downloads/sync-calendar.py")))

  ;; ---------------------------------------------------------------------------------------


  (evil-set-initial-state 'org-mode 'insert)
  (evil-set-initial-state 'org 'insert)
  (evil-set-initial-state 'major-mode 'insert)
  (evil-set-initial-state 'major 'insert)
  (evil-set-initial-state 'normal-mode 'insert)
  (evil-set-initial-state 'emacs-lisp 'insert)
  (evil-set-initial-state 'text-mode 'insert)
  (evil-set-initial-state 'lisp-mode 'insert)
  (evil-set-initial-state 'lisp 'insert)
  (evil-set-initial-state 'elisp-mode 'insert)

  (global-set-key (kbd "s-M-<right>") 'tabbar-forward-tab)
  (global-set-key (kbd "s-M-<left>") 'tabbar-backward-tab)


  (global-set-key (kbd "C-<left>") 'evil-window-left)
  (global-set-key (kbd "C-<right>") 'evil-window-right)
  (global-set-key (kbd "C-<up>") 'evil-window-up)
  (global-set-key (kbd "C-<down>") 'evil-window-down)

  (global-set-key (kbd "s-<left>") 'move-beginning-of-line)
  (global-set-key (kbd "s-<right>") 'move-end-of-line)


  ;;  was fun
  ;; (run-with-idle-timer 5 t 'dota-alert-new-blog-post)

  ;; (toggle-maximize-frame-off)

  (delete-selection-mode 1)

  (scroll-bar-mode)

  (defun kill-ring-save-keep-highlight (beg end)
    "Keep the region active after the kill"
    (interactive "r")
    (prog1 (kill-ring-save beg end)
      (setq deactivate-mark nil)))

  ;; Keybindings
  (global-set-key (kbd "s-r") 'replace-regexp)
  (global-set-key (kbd "s-f") 'nonincremental-search-forward)
  (global-set-key (kbd "<f3>") 'nonincremental-repeat-search-forward)

  (global-set-key (kbd "C-<tab>") 'tabbar-forward-tab)
  (global-set-key (kbd "s-v") 'clipboard-yank)
  (global-set-key (kbd "s-c") 'kill-ring-save-keep-highlight)
  (global-set-key (kbd "s-d s-d") 'evil-delete-whole-line)
  (global-set-key (kbd "s-=") 'scale-up-font)
  (global-set-key (kbd "s--") 'scale-down-font)
  (global-set-key (kbd "s-0") 'reset-font-size)
  (global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
  (global-set-key (kbd "s-a") 'mark-whole-buffer)
  (global-set-key (kbd "s-x") 'kill-region)
  (global-set-key (kbd "s-w") 'kill-this-buffer)
  (global-set-key (kbd "s-t") 'spacemacs/new-empty-buffer)
  (global-set-key (kbd "s-n") 'spacemacs/new-empty-buffer)
  (global-set-key (kbd "s-y") 'undo-tree-redo)

  (global-set-key (kbd "s-/") 'comment-line)
  (global-set-key (kbd "s-S-/") 'comment-or-uncomment-region)

  ;; text navigation
  (global-set-key (kbd "s-<up>") 'scroll-down-line)
  (global-set-key (kbd "s-<down>") 'scroll-up-line)
  (global-set-key (kbd "<PageUp>") 'evil-scroll-page-up)
  (global-set-key (kbd "<PageDown>") 'evil-scroll-page-down)
  (global-set-key (kbd "<prior>") 'evil-scroll-page-up)
  (global-set-key (kbd "<next>") 'evil-scroll-page-down)
  (global-set-key (kbd "<home>") 'beginning-of-buffer)
  (global-set-key (kbd "<end>") 'end-of-buffer)

  ;; (global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)
  ;; Emacs sometimes registers C-s-f as this weird keycode
  ;; (global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

  (defun tabbar-buffer-groups () ;; customize to show all normal files in one group
    "Returns the name of the tab group names the current buffer belongs to.
 There are two groups: Emacs buffers (those whose name starts with '*', plus
 dired buffers), and the rest.  This works at least with Emacs v24.2 using
 tabbar.el v1.7."
    (list (cond ((string-equal "*eshell" (substring (buffer-name) 0 7)) "user")
                ((string-equal "*shell" (substring (buffer-name) 0 6)) "user")
                ((string-equal "Config" (substring (buffer-name) 0 6)) "user")
                ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
                ((string-equal " *" (substring (buffer-name) 0 2)) "emacs")
                (t "user"))))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-enabled-themes (quote (ellaandr)))
 '(custom-safe-themes
   (quote
    ("0d781b1a1fd0822b67ccfdcb9ac06805d655f0f4bf5d2ab6605cf7655ca0270c" "15c91de068ed74b5da75841185983e1051bd045f5a925453acf80d1421fb11ac" "0c0cccffbf08c9049719c5cbef105d0e1ec9c9422be3b31b817418318b4ceaa9" "59366f513034f3d30ab9db55f9e4e2f9373e8892ad99ecbdcaeb97442a299c63" "d8ce6b17ed78da2722298800db2a6cef107ee0054d6b249482530756ceca79df" "b367a78af2aeac24aeae2ad012709e0de6bd4e3f78df0a890ecb9e18a1e1b06a" "e3cd8034eb7ae603c66a0c344edae0629ae08818edea45291bb7a5d86cc1efc5" "c7c5c69a2fa0d0ca0b652e31dd8bcf02bb2e590d3b6cb469ec2550ea2fc5f43a" "b1a7b64d7234caad18b45a60c6ce7a8d65fc9673d7c08e5dee2908bfd0df9f48" "36a54d174cc2e0516ff26b15bcba714e10bc0be493a4c38f7641370417004aa5" "e875efedad744e8787dd311ee60af8a698fd80b986c6c0f44089a9d5d8a6e106" "31ca8695860c58e79a99c1a8ee15dfc70b4c2ee6c8342c18242c03de1ea00b42" "01e112316a00f76910c4c74338d093f61a703f71a238b68b3e91918210d14e3a" "7b9fe868872e50e4119e63cb6ecfd19872300ab947f2b329a5ef40a2d986b1fa" "7662e05c966e2d989ede76d01e9dfa8bf6392058cc3e488b4b9c259552f63c7c" "f4bbc7ac50e7e9ff946ac6e4dafbcab7552dc7a996a3d5fa51c4baa329830ec1" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "57b20a935aec307f2493a6275314700f20630699d5db3de24f312328413ef5b2" "782466a763f23fb4a743e5e9371bf9b465838baac3553d84c524c2ab3695f9b2" "1598e4d7856f436fefdf0718db250b12f66a40f8304aa57d48acfd099ee8ad97" "67e4f61c9404584710ba0e76da0bb66fb8f93dc128d8bb4f5d3f30253c2c72c7" "bb18ac50987852a8bd0bc1e5069fad239aeb78fb32a6ad08ca381f3384904231" "1abf8397a88679c6b3e1fd3ebb1c2eba6134494f9824f7dc7d06d0acc55e980b" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "1032ea2b368526b2e492dffff712332ab079bfdccfc23868325ac07ebda298fd" "b153ad2d9aa04dc9e68c5758dd1013f5fee150c1e09970778a25a552c5a9bccd" "b990a9b91e1693d91cba61ea983a3ea63f11b1691b0488dbfa40acce41112a0f" "9a5030dc6272b5be2fb1643da702d114215493c9a26790e9a4440956f0369f0a" "2d421fd31ab82cc0400f6d3a035467ea118f22a87c4f7bcadd83eb2ff7c8d401" "cd6e38a4d58dc1bdc4604a4df6cd012a5145efd5c8e346bbc5359fe754413503" "0528ccc5bcf4b0e97511ebdcbe45f55773df67e021d6fb49d097af26e13e0783" "3fb4500f72295bbe9a413706b0f55abd09afa3f33f8beab1746ae62864625f97" "cd3373d98095de81240000aca4e8fcdd563890cfa67258147ba5dd234c71ae67" "34233fbe197e6bd9d2b6b5df8efa580d041a4379bc6f67202a0dba70e87537a9" "00d1c4b94669d4aa6da55e869cf30e6d11185f007941735c1a4ee765b8ea10a6" "b3c790c640125d6e89fbac7869c75804dace839435598e9ed98cef041cf22f56" "3a7b4e5e91c49f9a83dfc257a8a65b8b0383ccbaed143e28cf40afa1031bbdc2" "9dc062d87c66de1d1675fbd53b506b93cc192594d14543e48d4e5ca910e59eab" "76920f7795f3982e6cf52f2c33c07985e858f54c4be43cec75468e7b58463116" "aac86c1928e032172ada6ef82cc8583b5c249425390339f2b51eb110ecc2c32d" "ab85e25d3919ee9c08418e5263868a1c106f41ff2884f1e109007f9aa13f36be" "49e457c8e497315b8f9c224d419eea98df67ee39cf0e68c3ab18f577faa670d2" "5d2a7c630d02f7eace323c15dad4a20dca49579ffbd7221e8ff341b3a608f80b" "c166f68da2de6ac1f9441b9b944c0e67882a9edf717e692f4a97d77b45645580" "164ee6530f295626ecbe6880d683e8cf35784cd974dc95bd5314c69e4dc2cf64" "43bebbb0399f8d21aca603f518c7c6c72d71b1a0146fd93831020a5bdf5b8942" "293fce3c56895de22ecab16b39dc20959a3124cc848cdf6c79dd786fcdd94827" "489ce2daf2f2711df3a462061d95f6fc8de968d78a06f0003cc015b69ef20c6e" "6dcd3afbc44cc34aa967dcae3e2a7e140f168c4dcc3dd7b0a3f125366b53205b" "e882ab5ee7f85b23af016bffaf8734e5253ad9abc7ef721801c4b5e892541f86" "560ec9ce7bb02bf87e3b523847de5fb49bcc4668932d3cc591b364e92f66993f" "386109e41af7884f03c3d7641e30814f09b0bcb662a42dd7ed24d3f59acaff6f" "5173892779609006e77905eb78f2988476360734c2584e538024146c64ac7cdd" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (ellaandr-theme yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic toml-mode racer pos-tip cargo rust-mode yaml-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode tide typescript-mode flycheck web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js-doc coffee-mode js2-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby mmm-mode markdown-toc markdown-mode gh-md tabbar reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;(setq doom-font
;;      (font-spec :family "Aporetic Serif Mono"
;;                 :size 16))
;;(setq doom-font
;;      (font-spec :family "Mononoki Nerd Font Mono"
;;                 :size 16
;;                 :weight 'regular))
(setq doom-font
      (font-spec :family "FantasqueSansM Nerd Font Mono"
                 :size 16
                 :weight 'light))
;;(setq doom-symbol-font
;;      (font-spec :family "FantasqueSansM Nerd Font Mono"
;;                 :size 16))
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'wombat)
(custom-set-faces!
  '(hl-line :background nil :underline: nil))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/caret/")
(setq org-roam-directory "~/caret/roam")

(after! org
  ;; (add-hook 'org-mode-hook #'flyspell-mode)
  (setq org-ellipsis "...")
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  (setq org-preview-latex-default-process 'dvisvgm)
  (setq org-latex-packages-alist '(("" "tikz-cd")
                                   ("" "euler")))
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 1.0))
  ;; At a URL, the <Enter> key opens the link in a browser
  (setq org-return-follows-link t)
  ;; Prevent M-RET from splitting the line
  ;; https://irreal.org/blog/?p=6297
  (setq org-M-RET-may-split-line '((item . nil)))
  ;; Hide drawers, e.g. PROPERTIES
  ;;(setq org-startup-folded 'fold)
  ;; Prettify source code blocks.
  (setq org-src-fontify-natively t)
  ;; Code execution via babel
  (setq org-babel-sh-command "bash")
  (require 'ob-tangle)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (rust . t)
     (shell . t)
     (latex . t)
     (python . t)
     (haskell . t)))
  (setq org-confirm-babel-evaluate nil)
  )

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! elfeed-org
  (setq rmh-elfeed-org-files
        '("~/.config/doom/elfeed.org")))
(after! elfeed
  (setq-default elfeed-search-filter "@3months"))

;; evil config
(after! evil
  (evil-define-text-object evil-inner-tilde (count &optional beg end type)
    "Select inside ~...~."
    (evil-select-paren "~" "~" beg end type count nil))
  (evil-define-text-object evil-outer-tilde (count &optional beg end type)
    "Select around ~...~."
    (evil-select-paren "~" "~" beg end type count t))
  (evil-define-text-object evil-inner-equal (count &optional beg end type)
    "Select inside =...=."
    (evil-select-paren "~" "~" beg end type count nil))
  (evil-define-text-object evil-outer-equal (count &optional beg end type)
    "Select around =...=."
    (evil-select-paren "=" "=" beg end type count t))
  (define-key evil-inner-text-objects-map "~" #'evil-inner-tilde)
  (define-key evil-outer-text-objects-map "~" #'evil-outer-tilde)
  (define-key evil-inner-text-objects-map "=" #'evil-inner-equal)
  (define-key evil-outer-text-objects-map "=" #'evil-outer-equal)
  )

(defun my/doom-open-private-config-sudo ()
  "Open Doom's private config directory as root."
  (interactive)
  (let ((dir (expand-file-name doom-user-dir)))
    (dired (concat "/sudo::" dir))))

(map! :leader
      :desc "Open private config as root."
      "f P" #'my/doom-open-private-config-sudo)

;; Clipboard
;; don't but deleted strings into clipboard
(setq select-enable-clipboard nil)
;; copy + paste to/from clipboard
(map! "S-C-c" #'clipboard-kill-ring-save)
(map! "S-C-v" #'clipboard-yank)


;; org-mode exporting
(after! org-roam
  (require 'org-roam-export)
  (require 'ox-html)
  (require 'ox-publish)

  (setq org-html-html5-fancy t)
  (setq org-html-htmlize-output-type 'nil)
  (setq org-publish-project-alist
        '(("roam-public"
           :components ("roam-org" "roam-assets"))
          ("roam-org"
           :base-directory "~/caret/"
           :base-extension "org"
           :recursive t
           :publishing-function my-org-roam-publish
           :publishing-directory "~/Code/caretSite/"
           :exclude-tags nil
           :with-date t
           :with-footnotes t
           :with-title t
           :selection-number nil
           :with-toc nil
           :body-only nil
           :html-postamble nil
           :htmlize-output-type nil)
          ("roam-assets"
           :base-directory "~/caret/"
           :base-extension "jpg\\|JPG"
           :recursive t
           :publishing-function org-publish-attachment
           :publishing-directory "~/Code/caretSite/")))

  ;; Custom HTML backend
  (org-export-define-derived-backend 'my-html 'html
    :translate-alist
    '((template . my-html-template)
      (special-block . my-html-special-block)
      (latex-fragment . my-html-latex-fragment)))

  ;; Publishing function
  (defun my-org-roam-publish (plist filename pub-dir)
    (let ((start (current-time)))
      (when (with-temp-buffer
              (insert-file-contents filename)
              (re-search-forward "^:PUBLIC:[ \t]+t[ \t]*$" nil t))
        (let ((plist (copy-sequence plist)))
          (plist-put plist :tikz-publish-dir pub-dir)
          (org-publish-org-to
           'my-html
           filename
           ".html"
           plist
           pub-dir)))
      (message "PUBLISHED %.2fs: %s"
               (float-time (time-subtract (current-time) start))
               filename)))

  ;; Custom HTML template
  (defun my-html-template (contents info)
    (let ((title (plist-get info :title))
          (date  (plist-get info :date)))
      (concat
       (when title
         (format
          "<header class=\"post-header\">
  <h1>%s</h1>
  <div class=\"post-meta\">
    %s
  </div>
</header>
"
          (org-export-data title info)
          (if date
              (format "<time>%s</time>"
                      (org-export-data date info))
            "")))
       contents)))

  ;; Special block translator
  (defun my-html-special-block (special-block contents info)
    (let ((type (org-element-property :type special-block)))
      (if (string-equal (downcase type) "tikzcd")
          (my-html-tikzcd special-block info)
        ;; Non-tikzcd gets rendered normally
        (org-html-special-block special-block contents info))))

  ;; KaTeX render
  (defun my-katex-render (latex display)
    (with-temp-buffer
      (insert latex)
      (let ((exit-code
             (if display
                 (call-process-region
                  (point-min) (point-max)
                  "katex"
                  t t nil
                  "-F" "html"
                  "-d"
                  "-t")
               (call-process-region
                (point-min) (point-max)
                "katex"
                t t nil
                "-F" "html"
                "-t"))))
        (unless (zerop exit-code)
          (error "KaTeX failed: %s" (buffer-string)))
        (buffer-string))))

  ;; Latex Fragment
  (defun my-html-latex-fragment (fragment contents info)
    (let* ((value (org-element-property :value fragment))
           (display
            (or (string-prefix-p "$$" value)
                (string-prefix-p "\\[" value)))
           (math
            (cond
             ((and (string-prefix-p "$$" value)
                   (string-suffix-p "$$" value))
              (string-trim
               (substring value 2 -2)))
             ((and (string-prefix-p "\\[" value)
                   (string-suffix-p "\\]" value))
              (string-trim
               (substring value 2 -2)))
             ((and (string-prefix-p "$" value)
                   (string-suffix-p "$" value))
              (string-trim
               (substring value 1 -1)))
             (t
              value))))
      (my-katex-render math display)))

  ;; TikZ-cd -> SVG
  (defun my-html-tikzcd (special-block info)
    (let* ((code
            (buffer-substring-no-properties
             (org-element-property :contents-begin special-block)
             (org-element-property :contents-end special-block)))
           (publish-dir (plist-get info :tikz-publish-dir))
           (hash (secure-hash
                  'sha256
                  (concat "tikzcd-v1\n" code)))
           (filename (concat hash ".svg"))
           (tikz-dir (expand-file-name "tikz/" publish-dir))
           (svg-file (expand-file-name filename tikz-dir))
           (relative-file (concat "tikz/" filename)))
      (unless publish-dir
        (error "No: :tikz-publish-dir available during Org export"))
      (unless (file-exists-p svg-file)
        (my-generate-tikzcd-svg code svg-file))
      (format
       "<figure class=\"tikz-cd\">\
  <img src=\"%s\" alt=\"TikZ-CD diagram\">\
  </figure>"
       (org-html-encode-plain-text relative-file))))

  ;; Generate SVG
  (defun my-generate-tikzcd-svg (code svg-file)
    (let* ((tmpdir (make-temp-file "tikzcd-" t))
           (tex-temp (expand-file-name "diagram.tex" tmpdir))
           (dvi-temp (expand-file-name "diagram.dvi" tmpdir))
           (svg-temp (expand-file-name "diagram.svg" tmpdir)))
      (unwind-protect
          (progn
            ;;Create the TeX document to render
            (with-temp-file tex-temp
              (insert
               "\\documentclass{article}\n"
               "\\usepackage{euler}\n"
               "\\usepackage{tikz}\n"
               "\\usepackage{tikz-cd}\n"
               "\\usepackage{urwchancal}\n"
               "\\pagestyle{empty}\n"
               "\\begin{document}\n"
               code
               "\\end{document}\n"))
            (let ((exit-code
                   (call-process
                    "latex"
                    nil
                    "*tikzcd-latex*"
                    nil
                    "-interaction=nonstopmode"
                    "-halt-on-error"
                    "-output-directory"
                    tmpdir
                    tex-temp)))
              (unless (zerop exit-code)
                (error "LaTeX failed when generating TikZ-CD SVG")))
            (let ((exit-code
                   (call-process
                    "dvisvgm"
                    nil
                    "*tikzcd-dvisvgm*"
                    nil
                    "--font-format=woff2"
                    "-o"
                    svg-temp
                    dvi-temp)))
              (unless (zerop exit-code)
                (error "LaTeX failed when generating TikZ-CD SVG")))
            (make-directory (file-name-directory svg-file) t)
            (copy-file svg-temp svg-file t)
            (message "Generated TikZ-CD: %s" svg-file))
        (delete-directory tmpdir t)))))

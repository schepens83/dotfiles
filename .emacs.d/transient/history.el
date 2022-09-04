((magit-branch nil)
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-dispatch nil)
 (magit-fetch
  ("--prune")
  nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  ("-n150" "--graph" "--decorate")
  ("-n256" "--graph" "--decorate" "--stat")
  ("-n256" "--graph" "--decorate" "--patch" "--stat")
  ("-n256" "--graph" "--color" "--decorate")
  ("-n256" "--simplify-by-decoration" "--graph" "--decorate"))
 (magit-log:-n "150" "100")
 (magit-merge
  ("--ff-only")
  nil)
 (magit-pull nil)
 (magit-push nil
	     ("--dry-run"))
 (magit-rebase nil)
 (magit-reset nil)
 (magit-revert
  ("--edit"))
 (magit-stash nil)
 (magit-status-jump nil)
 (rg-menu nil
	  ("--word-regexp")
	  ("--invert-match" "--word-regexp")))

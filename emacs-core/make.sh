#!/bin/bash

repos=(
"https://github.com/company-mode/company-mode.git"
"https://github.com/flycheck/flycheck.git"
"https://github.com/abo-abo/function-args.git"
"https://github.com/capitaomorte/yasnippet.git"
"https://github.com/knu/elscreen.git"
"https://github.com/cofi/evil-leader.git"
"https://github.com/milkypostman/powerline.git"
)

for repo in "${repos[@]}"; do
  ext="$(basename $repo)"
  name="${ext%%.git}"
  echo "RUN git clone $repo \$HOME/.emacs.d/$name && \\"
  echo "  echo \"(add-to-list 'load-path \\\"~/.emacs.d/$name\\\")\" >> \$HOME/.emacs"
  echo ""
done

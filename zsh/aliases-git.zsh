# Git aliases extracted from oh-my-zsh git plugin
# Add these to your .zshrc file

# Helper functions (you'll need these for some aliases to work)
git_current_branch() {
  git branch --show-current 2>/dev/null || git symbolic-ref --short HEAD 2>/dev/null
}

git_main_branch() {
  git rev-parse --verify main &>/dev/null && echo main || echo master
}

git_develop_branch() {
  git rev-parse --verify dev &>/dev/null && echo dev || \
  git rev-parse --verify devel &>/dev/null && echo devel || \
  git rev-parse --verify development &>/dev/null && echo development || \
  echo develop
}

# Core git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'

# Git am (apply mailbox)
alias gam='git am'
alias gama='git am --abort'
alias gamc='git am --continue'
alias gamscp='git am --show-current-patch'
alias gams='git am --skip'

# Git apply
alias gap='git apply'
alias gapt='git apply --3way'

# Git bisect
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsn='git bisect new'
alias gbso='git bisect old'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

# Git blame
alias gbl='git blame -w'

# Git branch
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbgd="LANG=C git branch --no-color -vv | grep ': gone]' | cut -c 3- | awk '{print \$1}' | xargs git branch -d"
alias gbgD="LANG=C git branch --no-color -vv | grep ': gone]' | cut -c 3- | awk '{print \$1}' | xargs git branch -D"
alias gbm='git branch --move'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gbg="LANG=C git branch -vv | grep ': gone]'"

# Git checkout
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcb='git checkout -b'
alias gcB='git checkout -B'
alias gcd='git checkout $(git_develop_branch)'
alias gcm='git checkout $(git_main_branch)'

# Git cherry-pick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

# Git clean
alias gclean='git clean --interactive -d'

# Git clone
alias gcl='git clone --recurse-submodules'
alias gclf='git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'
alias gccd='git clone --recurse-submodules "$@" && cd "$(basename $_ .git)"'

# Git commit
alias gcam='git commit --all --message'
alias gcas='git commit --all --signoff'
alias gcasm='git commit --all --signoff --message'
alias gcmsg='git commit --message'
alias gcsm='git commit --signoff --message'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend'
alias gcan!='git commit --verbose --all --no-edit --amend'
alias gcans!='git commit --verbose --all --signoff --no-edit --amend'
alias gcann!='git commit --verbose --all --date=now --no-edit --amend'
alias gc!='git commit --verbose --amend'
alias gcn='git commit --verbose --no-edit'
alias gcn!='git commit --verbose --no-edit --amend'
alias gcs='git commit -S'
alias gcss='git commit -S -s'
alias gcssm='git commit -S -s -m'

# Git config
alias gcf='git config --list'
alias gcfu='git commit --fixup'

# Git describe
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'

# Git diff
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'
alias gdv='git diff -w "$@" | view -'
alias gdup='git diff @{upstream}'
alias gdnolock='git diff $@ ":(exclude)package-lock.json" ":(exclude)*.lock"'
alias gdt='git diff-tree --no-commit-id --name-only -r'

# Git fetch
alias gf='git fetch'
alias gfa='git fetch --all --tags --prune'
alias gfo='git fetch origin'

# Git gui
alias gg='git gui citool'
alias gga='git gui citool --amend'

# Git help
alias ghh='git help'

# Git log
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp='git log --pretty=format'
alias glg='git log --stat'
alias glgp='git log --stat --patch'

# Git ls-files
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gfg='git ls-files | grep'

# Git merge
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gms='git merge --squash'
alias gmff='git merge --ff-only'
alias gmom='git merge origin/$(git_main_branch)'
alias gmum='git merge upstream/$(git_main_branch)'
alias gmtl='git mergetool --no-prompt'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'

# Git pull
alias gl='git pull'
alias gpr='git pull --rebase'
alias gprv='git pull --rebase -v'
alias gpra='git pull --rebase --autostash'
alias gprav='git pull --rebase --autostash -v'
alias gprom='git pull --rebase origin $(git_main_branch)'
alias gpromi='git pull --rebase=interactive origin $(git_main_branch)'
alias gprum='git pull --rebase upstream $(git_main_branch)'
alias gprumi='git pull --rebase=interactive upstream $(git_main_branch)'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggl='git pull origin $(git_current_branch)'
alias gluc='git pull upstream $(git_current_branch)'
alias glum='git pull upstream $(git_main_branch)'

# Git push
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf!='git push --force'
alias ggf='git push --force origin $(git_current_branch)'
alias gpf='git push --force-with-lease'
alias ggfl='git push --force-with-lease origin $(git_current_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpsupf='git push --set-upstream origin $(git_current_branch) --force-with-lease'
alias gpv='git push --verbose'
alias gpoat='git push origin --all && git push origin --tags'
alias gpod='git push origin --delete'
alias ggpush='git push origin "$(git_current_branch)"'
alias ggp='git push origin $(git_current_branch)'
alias gpu='git push upstream'

# Git rebase
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grbd='git rebase $(git_develop_branch)'
alias grbm='git rebase $(git_main_branch)'
alias grbom='git rebase origin/$(git_main_branch)'
alias grbum='git rebase upstream/$(git_main_branch)'

# Git reflog
alias grf='git reflog'

# Git remote
alias gr='git remote'
alias grv='git remote --verbose'
alias gra='git remote add'
alias grrm='git remote remove'
alias grmv='git remote rename'
alias grset='git remote set-url'
alias grup='git remote update'

# Git reset
alias grh='git reset'
alias gru='git reset --'
alias grhh='git reset --hard'
alias grhk='git reset --keep'
alias grhs='git reset --soft'
alias gpristine='git reset --hard && git clean --force -dfx'
alias gwipe='git reset --hard && git clean --force -df'
alias groh='git reset origin/$(git_current_branch) --hard'

# Git restore
alias grs='git restore'
alias grss='git restore --source'
alias grst='git restore --staged'

# Work in progress
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "--wip--" && git reset HEAD~1'

# Git revert
alias grev='git revert'

# Git rm
alias grm='git rm'
alias grmc='git rm --cached'

# Git shortlog
alias gcount='git shortlog --summary -n'

# Git show
alias gsh='git show'
alias gsps='git show --pretty=short --show-signature'

# Git stash
alias gstall='git stash --all'
alias gstu='git stash --include-untracked'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsta='git stash push'
alias gsts='git stash show --patch'

# Git status
alias gst='git status'
alias gss='git status --short'
alias gsb='git status --short -b'

# Git submodule
alias gsi='git submodule init'
alias gsu='git submodule update'

# Git svn
alias gsd='git svn dcommit'
alias gsr='git svn rebase'

# Git switch
alias gsw='git switch'
alias gswc='git switch -c'
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'

# Git tag
alias gta='git tag --annotate'
alias gts='git tag -s'
alias gtv='git tag | sort -V'

# Git update-index
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'

# Git whatchanged
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'

# Git worktree
alias gwt='git worktree'
alias gwtls='git worktree list'
alias gwtmv='git worktree move'
alias gwtrm='git worktree remove'

# Gitk
alias gk='gitk --all --branches &!'
alias gke='gitk --all $(git log --walk-reflogs --pretty=%h) &!'

# Git root directory
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'

# Compound aliases
alias ggpnp='ggl && ggp'
alias ggpur='ggu'

# Git tag list function (you may need to adjust this based on your shell)
gtl() { git tag --sort=-v:refname -n --list ${1}* }; alias gtl='noglob gtl'

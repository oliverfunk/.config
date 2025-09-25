script_dir=${${(%):-%N}:A:h}
antidote_plugins="$script_dir/antidote-plugins"

# Lazy-load antidote from Homebrew installation
fpath=($(brew --prefix)/share/antidote/functions $fpath)
autoload -Uz antidote

# Generate static bundle file when plugins.txt is newer (or bundle missing)
if [[ ! ${antidote_plugins}.zsh -nt ${antidote_plugins}.txt ]]; then
  antidote bundle <${antidote_plugins}.txt >|${antidote_plugins}.zsh
fi

# Source the generated plugins file
. ${antidote_plugins}.zsh
alias ..="cd .."

# LS aliases for zsh
# Add this to a separate file like ~/.config/zsh/ls-aliases.zsh

# Basic ls with colors (macOS)
alias ls='ls -G'

# List formats
alias l='ls -lah'      # Long format, all files, human readable sizes
alias la='ls -lAh'     # Long format, almost all files (no . and ..), human readable
alias ll='ls -lh'      # Long format, human readable sizes
alias lsa='ls -lah'    # Same as 'l' - long format, all files, human readable

# Additional useful ls aliases (optional - uncomment if you want them)
# alias lla='ls -la'     # Long format, all files
# alias lt='ls -ltr'     # Long format, sorted by time (newest last)
# alias lth='ls -ltrh'   # Long format, sorted by time, human readable
# alias lS='ls -lSr'     # Long format, sorted by size (largest last)
# alias lSh='ls -lSrh'   # Long format, sorted by size, human readable
# alias ld='ls -ld'      # List directories themselves, not their contents
# alias l.='ls -d .*'    # List only hidden files

# Tree-like listing (if you have the 'tree' command installed)
# alias tree='tree -C'  # Colorized tree output
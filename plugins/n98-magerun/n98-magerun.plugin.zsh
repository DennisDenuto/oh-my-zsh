# ------------------------------------------------------------------------------
# FILE: n98-magerun.plugin.zsh
# DESCRIPTION: oh-my-zsh n98-magerun plugin file. Adapted from composer plugin 
# AUTHOR: Andrew Dwyer (andrewrdwyer at gmail dot com)
# VERSION: 1.0.0
# ------------------------------------------------------------------------------

# n98-magerun basic command completion
_n98_magerun_get_command_list () {
  n98-magerun.phar --no-ansi | sed "1,/Available commands/d" | awk '/^\s+[a-z]+/ { print $1 }'
}

_n98_magerun () {
  compadd `_n98_magerun_get_command_list`
}

compdef _n98_magerun n98-magerun.phar

# Aliases
alias n98-magerun='n98-magerun.phar'
alias mage='n98-magerun.phar'
alias magefl='n98-magerun.phar cache:flush'

# Install n98-magerun into the current directory
alias mage-get='wget https://raw.github.com/netz98/n98-magerun/master/n98-magerun.phar'

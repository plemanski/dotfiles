# dotfiles
<h2> Installation guide </h2>

1. echo .cfg>> .gitignore
2. git clone https://github.com/plemanski/dotfiles
3. alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git --working-tree=$HOME'
4. config config --local status.showUntrackedFiles no
5. config checkout

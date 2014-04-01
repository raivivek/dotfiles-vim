I have completely revamped my older Vim configuration and hence I had to do a forced
push. If you were using previous repository, you may wish to have look at this
newer one. I will briefly list the changes here.

Changes
-------
* .git tree structure was disrupted because of my experiments with git. Now all
the plugins are imported as submodules to ensure that you get the latest and
stable versions.
* Plugins were selected very carefully and tweaked particularly.
* Update Vim to latest version 7.4.227.
* Revamped .vimrc, removed redundant entries, streamlined plugin options.
* Molokai to be used as default theme.

Installation
------------
    git clone https://github.com/vivekiitkgp/Dotfiles-vim.git ~/.vim
    cd .vim
    git submodule init
    git submodule update
    git submodule foreach git submodule init
    git submodule foreach git submodule update

*Symlinks*
    ln -s ~/.vim/.vimrc ~/.vimrc
    ln -s ~/.vim/.gvimrc ~/.gvimrc

Although I do not plan to add anything new at the moment, you can see frequent
changes in the .(g)vimrc file.

Feedback
--------
Feel free to drop in and suggest any changes you like. I would be glad to hear
them.

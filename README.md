My currently used Vim setup is based on the newer plugin management system
called [vim-plug](https://github.com/junegunn/vim-plug).

There weren't very strong reasons to favor it over pathogen since both are
pretty quick and easy to install and work very nicely. It's just that I wanted
to give it a shot and I really liked it. Hope you enjoy it as well.


Installation
============

* Clone the repository

  ```$ git clone https://github.com/vivekiitkgp/Dotfiles-vim.git```

* Symlink the `.(g)vimrc` files from this directory to your home directory.

* Open any (g)vim instance and run `:PlugInstall`. You may optionally have to
  clean the plugged directory using `:PlugClean` command (Don't worry if it
  shows a lot of errors. It's because the plugins haven't been setup yet).
  It will automatically clone and install all the relevant plugins into the
  `plugged/` directory.

* Close and start again. You're done!


Notes
=====

Few of the plugins require post installation compilation or bit manual
managenement. For example, `Valloric/YouCompleteMe` requires a compiled
component which one needs to compile on their machine. This can also be
automated by providing suitable options with `vim-plug`. Please look at
[their](https://github.com/junegunn/vim-plug#post-update-hooks) documentation to
learn how.

The rest of the settings should work out of the box.

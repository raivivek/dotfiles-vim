My currently used Vim setup is based on the newer plugin management system
called [vim-plug](https://github.com/junegunn/vim-plug).

There weren't very strong reasons to favor it over pathogen since both are
pretty quick and easy to install and work very nicely. It's just that I wanted
to give it a shot and I really liked it. Hope you enjoy it as well.


Installation
============

* Clone the repository

  ```$ git clone https://github.com/vivekiitkgp/Dotfiles-vim.git ~/.vim```

* Symlink the `.(g)vimrc` files from `~/.vim` directory to your home directory.
  You may need to remove any preexisting files if you had setup vim before.

```
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.gvimrc ~/.gvimrc
```

* Open any (g)vim instance and run `:PlugInstall`. You may optionally have to
  clean the plugged directory using `:PlugClean` command in case any errors are
  shown. It will automatically clone and install all the relevant plugins into
  the `~/.vim/plugged/` directory.

**NOTE: It is an one time step. You don't need to run `:PlugInstall`` everytime
you open a vim instance.**

*  You're done! Close and start again.


Notes
=====

`YouCompleteMe` is a relatively larger plugin that requires local compilation
and a bit time to install. Hence, it is disabled by default. If you want to
install YCM, then uncomment the line saying `Plug 'Valloric/YouCompleteMe'`
within the `.vimrc`, and run `:PlugInstall` again.

However, note that this might not work out of the box on 32 bit machines. In
that case, please have a look at
[their](https://github.com/junegunn/vim-plug#post-update-hooks) documentation
for manual installation process.

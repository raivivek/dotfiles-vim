I have completely revamped my older Vim configuration and hence I had to do a
forced push. If you were using previous repository, you may wish to have look at
this newer one. I will briefly list the changes here.

Changes
-------
* `.git` tree structure was disrupted because of my experiments with git. Now all
the plugins are imported as submodules to ensure that you get the latest and
stable versions.
* Plugins were selected carefully and useful options were set.
* Updated Vim to latest version 7.4.227.
* Revamped .vimrc, removed redundant entries, streamlined plugin options.
* Solarized to be used as default theme.

### Update on 29 June 2014
I have pushed another branch `minimal` which removes many of plugins that require more
than a little effort on the part of user who is new to vim. The branch has just
enough set of plugins to get started with a nicer interface and accordingly set
settings. Hence you have two choices, 

1. Clone the `master` using the instructions below and checkout the
   important note **OR**

2. Clone the `minimal` using the same instructions and get going. No further
   tweaking should be required. Feel free to add plugins and other settings
   of your own choice.

Installation
------------
If you want to fetch `master` branch :

    git clone -b master --single-branch https://github.com/vivekiitkgp/Dotfiles-vim.git ~/.vim
or if you want to fetch 'minimal' branch:

    git clone -b minimal --single-branch https://github.com/vivekiitkgp/Dotfiles-vim.git ~/.vim
The common instructions then follow -

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

Important
---------
### (For `master` branch)
This Vim configuration uses two plugins and a program  all of which require a
little more configuration on behalf of user.
* `YouCompleteMe` plugin ( a code completion engine for vim ) requires a
compiled component. After completing steps mentioned above, please refer to
[this page] (https://github.com/Valloric/YouCompleteMe#full-installation-guide)
and follow the instructions accordingly.
* If you see strange characters in status line or improper appearance then
please see the [FAQs] (https://github.com/bling/vim-airline/wiki/FAQ) for the
`vim-airline` plugin.

If however you do not want to use these plugins, then remove these submodules
from your `git` repository and comment/remove the following section from your
`.(g)vimrc` -

    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_goto_buffer_command='vertical-split'
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tmuxline#enabled = 1
    let g:airline#extensions#tabline#enabled = 1

In order to save all this trouble, I have created another `minimal` branch where
you can get all the necessary settings without these plugins. See the
instructions below.

### (For `minimal` branch)
* If you see strange characters in status line or improper appearance then
please see the [FAQs] (https://github.com/bling/vim-airline/wiki/FAQ) for the
`vim-airline` plugin carefully. You may also have to install few patched fonts.

Screenshot
----------
The following is a screenshot of vim in terminal (using tmux) with Python Koans file open.

![vim](screenshot.png "Screenshot of Vim with a ruby file")

Feedback
--------
Feel free to drop fork, modify or suggest any changes you like.

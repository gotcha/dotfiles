Install those dotfiles
----------------------

First clone this repo::

  $ git clone git@github.com:gotcha/dotfiles.git

Then install submodules::

  $ cd dotfiles
  $ git submodule init
  $ git submodule update

Then install some stow packages. For instance::

  $ stow vim tmux


The existing packages are: ``bash``, ``tmux``, ``vim``, ``stow``, ``git``,
``buildout``, ``ssh``, ``hg``

For MacOSX, ``iterm``

Experimental, ``mutt``, ``zsh``

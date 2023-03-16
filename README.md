# dotfiles

## How to setup

```sh
./setup

./x-setup # for X (e.g. Desktop Edition, VNC Server)
```

`~/.lein/profiles.clj` is created as a copy. Modify it after `./setup` command.

`~/.xmodmap` and `/.xmodmap-revert` are not created as a symlink.

### Simple `.bashrc` or `.bash_profile` and `.tmux.conf` setup

```sh
wget https://raw.githubusercontent.com/kaosf/dotfiles/main/bashrc-setup.sh -O - | bash
# or
curl https://raw.githubusercontent.com/kaosf/dotfiles/main/bashrc-setup.sh | bash

. ~/.bashrc
```

If you want to setup `.bash_profile`,

```sh
wget https://raw.githubusercontent.com/kaosf/dotfiles/main/bash_profile-setup.sh -O - | bash
. ~/.bash_profile
```

Tmux

```sh
wget https://raw.githubusercontent.com/kaosf/dotfiles/main/.tmux.conf -O ~/.tmux.conf
```

### Portable Neovim

To be supposed that `~/.bin` is included in `$PATH`.

```sh
cd && mkdir -p ~/.bin && wget -qO- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | tar zxf - && ln -sf $PWD/nvim-linux64/bin/nvim ~/.bin/nvim

mkdir -p ~/.config/nvim && wget -qO ~/.config/nvim/init.vim https://raw.githubusercontent.com/kaosf/dotfiles/main/.config/nvim/init.vim
```

### For other users

```sh
./setup-gitconfig
```

Input your username, email and GitHub account name.

```
Input your name for Git author.
> git-author-username
Input your Email address for Git author.
> git-author-email
Input again for confirmation.
> git-author-email
Input your name on GitHub.
> github-account-name
```

## License

[![Public Domain](http://i.creativecommons.org/p/mark/1.0/88x31.png)](http://creativecommons.org/publicdomain/mark/1.0/ "license")

This work is free of known copyright restrictions.

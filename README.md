# dotfiles

## How to setup

```sh
./setup

./x-setup # for X (e.g. Desktop Edition, VNC Server)

./x-setup menukey # for HP Stream 11 d012tu (This laptop has no menu key)
```

`~/.lein/profiles.clj` is created as a copy. Modify it after `./setup` command.

`~/.xmodmap` and `/.xmodmap-revert` are not created as a symlink.

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

### Simple `.bashrc` setup

```sh
wget https://raw.githubusercontent.com/kaosf/dotfiles/master/bashrc-setup.sh -O - | bash
```

or

```sh
curl https://raw.githubusercontent.com/kaosf/dotfiles/master/bashrc-setup.sh | bash
```

## License

[![Public Domain](http://i.creativecommons.org/p/mark/1.0/88x31.png)](http://creativecommons.org/publicdomain/mark/1.0/ "license")

This work is free of known copyright restrictions.

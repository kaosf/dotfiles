# dotfiles

## How to setup

```sh
./setup

./setup mac # for Mac (Use "pbcopy" instead of "xsel")

./x-setup # for X (e.g. Desktop Edition, VNC Server)

./x-setup menukey # for HP Stream 11 d012tu (This laptop has no menu key)
```

`~/.lein/profiles.clj` is created as a copy. Modify it after `./setup` command.

`~/.xmodmap` and `/.xmodmap-revert` are not created as a symlink.

## License

[![Public Domain](http://i.creativecommons.org/p/mark/1.0/88x31.png)](http://creativecommons.org/publicdomain/mark/1.0/ "license")

This work is free of known copyright restrictions.

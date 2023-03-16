https://qiita.com/hideki0145/items/d6a18095f95d57eebe96

```
gem install solargraph

solargraph config
```

For Rails, edit `.solragraph.yml`

```diff
  # ...
- require: []
+ require: # https://github.com/castwide/solargraph/issues/87
+ - actioncable
+ - actionmailer
+ - actionpack
+ - actionview
+ - activejob
+ - activemodel
+ - activerecord
+ - activestorage
+ - activesupport
  # ...
```

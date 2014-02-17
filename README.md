dotfiles
========

設定ファイル

git cloneしてinit.sh叩けばおｋ

#### 辞書追加
`php -r '$f=get_defined_functions();echo join("\n",$f["internal"]);'|sort > ~/.vim/dict/php.dict`

#### vim
初回起動時は
<pre>
$ mkdir -p ~/.vim/bundle
$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
$ vim
:NeoBundleInstall
</pre>
を叩く

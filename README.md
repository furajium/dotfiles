dotfiles
========

設定ファイル

git cloneしてinit.sh叩けばおｋ

#### 辞書追加
`php -r '$f=get_defined_functions();echo join("\n",$f["internal"]);'|sort > ~/.vim/dict/php.dict`

#### vim
初回起動時は
<pre>
$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
$ vim
:NeoBundleInstall
</pre>
を叩く

#### yum

```
sudo yum -y install flex
sudo yum -y install bison
sudo yum -y install re2c
sudo yum -y install libxslt-devel
sudo yum -y install libtidy-devel
sudo yum -y install libmcrypt-devel
sudo yum -y install libpng-devel
sudo yum -y install libjpeg-turbo-devel
sudo yum -y install libcurl-devel
sudo yum -y install libxml2-devel

sudo yum -y install gcc
sudo yum -y install openssl-devel
sudo yum -y install readline-devel
```

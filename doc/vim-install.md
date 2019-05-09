# vim 源码编译安装

## 1. 查看 vim 版本

该配置仅支持 vim7.4 以上的，因此请首先确认 vim 版本

```shell
vim --version
```

如果 vim 版本低于 7.4，请自行升级。可参考以下步骤

1. 先得安装 nurses 库

```shell
yum list | grep "ncurses*"
```

查看你对对应版本的 ncurses 库
我的 64 位是 ncurses-devel.x86_64，32 位那就是 i686 了

```shell
yum instal -y ncurses-devel.x86_64
```

2. 下载安装包

```
wget ftp://ftp.vim.org/pub/vim/unix/vim-8.0.tar.bz2
```

3 解压缩:

```
tar jxf vim-8.0.tar.bz2
```

4. 切换目录:

```
cd /vim80/src
```

5. 配置:

```
./configure --prefix=/usr/local/vim --enable-multibyte  #--enable-multibyte开启多字符编码，必选，不然VIM中文乱码。
```

6. 编译与安装

```shell
make -j 8

make install
```

7. 新建`~/.local`文件，配置别名

```shell
alias vim='/usr/local/vim/bin/vim'
```

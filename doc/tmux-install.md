# 如何在 redhat 平台安装新版的 tmux

如果在 Debian/Ubuntu 平台， 仅执行`apt-get install tmux`即可。
而在 redhat/CentOS 平台，`yum install tmux` 安装的 tmux 版本是 1.8，版本过老。

If you use Debian/Ubuntu, you can just run apt-get install tmux, and voila.

With CentOS 7, also can run yum install tmux, but the version of tmux in repo is 1.8, it's too old. You can do the following steps to install the latest stable tmux:

tmux has a library dependency on libevent which, of course, isn’t installed by

linux 无法编译 libevent，一直报错，但是有装 openssl

报错信息：

```
bufferevent_openssl.c: In function ‘bio_bufferevent_new’:
bufferevent_openssl.c:106:3: error: dereferencing pointer to incomplete type ‘BIO {aka struct bio_st}’
  b->init = 0;
   ^~
bufferevent_openssl.c: At top level:
bufferevent_openssl.c:228:1: error: variable ‘methods_bufferevent’ has initializer but incomplete type
 static BIO_METHOD methods_bufferevent = {
```

这是 libevent 与 openssl 版本不兼容导致。

一般来说，它们的版本关系是这样的

| libevent | openssl |
| -------- | ------- |
| 2.1.x    | 1.1     |
| 2.0.x    | 1.0     |

因此你有两个选择

- 使用 `libevent 2.1.x` 版本，这与你本机的 openssl 1.1 匹配，无需任何修改直接编译即可。
- 使用 `libevent 2.0.x` 版本，你需要安装 openssl 1.0 版本，然后在编译时指定链接版本。

```
# Install tmux on Centos release 6.5

# install deps
yum install gcc kernel-devel make ncurses-devel

# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
curl -OL https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar -xvzf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=/usr/local
make
sudo make install

# DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL
curl -OL https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
tar -xvzf tmux-2.8.tar.gz
cd tmux-2.8
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
make
sudo make install

# pkill tmux
# close your terminal window (flushes cached tmux executable)
# open new shell and check tmux version
tmux -V
```

# 配置 git 环境

裸机安装步骤：

## 1. 首先安装最基础的 git 和 ruby 和 rake

```shell
yum -y update
yum install git
```

如果是 ubuntu 则执行以下：

```shell
sudo apt-get install git
sudo apt-get install rake
```

## 2. 然后配置 git 的用户名

```shell
$ git config --global user.name "yurielzhang"
$ git config --global user.email "yurielzhang@tencent.com"
```

## 3. 生成 SSH 并在 github 上设置

```shell
ssh-keygen -t rsa -C "yurielzhang@tencent.com"
```

生成 SSH 密匙，保存在`.ssh/id_rsa.pub`文件中。

## 4. 配置 ssh key

把生成的密匙复制粘贴到`github–>settings–>SSH and GPG keys–>new SSH key`中，保存

## 5. 修改 ssh 的配置文件

`.ssh`文件夹中添加 `config` 文件，内容如下

```
Host git.code.oa.com
      HostName git.code.oa.com
      Port 22
```

修改 `config` 文件的读取权限

```
chmod 400 config
```

## 6.这时应该就可以拉取 git 代码了

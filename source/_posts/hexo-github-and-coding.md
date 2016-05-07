---
title: 将hexo博客同时托管到github和coding
date: 2016-04-27 14:30:58
tags: [hexo,备份,git,命令]
categories: 学习笔记
---
> 生命在于折腾！

hexo博客的安装和使用本文不再讲述。见文章：[用hexo建博客](http://blog.ynxiu.com/2016/hexo-you-blog-2016-04-27.html "用hexo建博客")

在coding和github上建立pages项目，按要求建立。不会的自行百度。

# 配置_config.yml #

想要把博客同时部署到coding和github上，关键一步就是`_config.yml`配置。

根据Hexo官方文档需要修改成下面的形式
```
deploy:
  type: git
  message: [message]
  repo:
    github: <repository url>,[branch]
    gitcafe: <repository url>,[branch]
```

<!--more-->


所以我的是这样：
```
deploy:
  type: git
  repo: 
       coding: git@git.coding.net:xxx/xxx.git,master
       github: git@github.com:xxx/xxx.github.io.git,master
```
> 我这边提交采用的SSH密钥，这个方法有个好处，提交的时候不用输入用户名和密码。如果你习惯用http的方式，只要将地址改成相应的http地址即可。


# 部署 #

最后使用部署命令就能把博客同步到`coding`和`github`上面：
```
hexo g
hexo d
```
> 以上只是把`hexo`生成的静态文件部署到`coding`和`github`的`master`分支上。稍等片刻就能用系统给的地址访问到你的博客。

# 源文件的备份。 #

> 如果以后换了工作环镜，电脑也更换了，要如何备份源文件呢。这里我使用了git的支分特性。

在`hexo`本地客博根目录打开`git bash`使用：
```
git init
```
添加 `coding`和`github`远程仓库
```
git remote add origin xxx/xxx.git    coding仓库地址
git remote add github xxx/xxx.git    github仓库地址
```
因为hexo博客生成时自带了.gitignore文件，无需担心不必要的文档被git管理。

因为编译后的文件对应的是`coding和github`的`master`分支，所以我们把源文件`push`到其它分支如：`coding-pages`分支。然后执行:
```
git checkout -b coding-pages
```
这时当前分支为`coding-pages`

接着`git add -A` ， `git commit -m "注释"`

然后分别`Push`到`coding`和`github`的`coding-pages`分支上
```
git push origin coding-pages
git push github coding-pages
```

以上是我手动同步到`coding`和`github`的方法。

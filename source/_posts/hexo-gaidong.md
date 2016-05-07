---
title: 多台电脑维护hexo博客
date: 2016-04-27 00:43:49
tags: [hexo,备份,git,命令]
categories: 学习笔记
---
# 安装hexo #
```
npm install -g hexo-cli
```
# 安装 Hexo 完成后 #

请执行下列命令，Hexo 将会在指定文件夹中新建所需要的文件。
```
$ hexo init <folder>
$ cd <folder>
$ npm install
```
# 新建完成后，指定文件夹的目录如下： #
```
.
├── _config.yml
├── package.json
├── scaffolds
├── source
|   ├── _drafts
|   └── _posts
└── themes

_config.yml
```

<!--more-->

网站的 配置 信息，您可以在此配置大部分的参数。如：
```
deploy:
  type: git
  repository: git@git.coding.net:xxx/xxx.git
  branch: master
```
此时，`hexo g`     `hexo s`   启动服务，打开： `http://localhost:4000/` 能在本地正常显示网页。

> 首次安装`hexo`结束，以下为备份。

# 部署到远程仓库 #

修改好所有博客设置,文章写好后 `hexo g`  部署，接着`hexo d`  `push`到远程`maste`分支，并开启`coding-pages`功能稍等片刻就能看到博客。

# 备份博客源文件 #

在本地博客根目录打开`git bash` 

`git init`后 
```
git remote add origin <远程项目地址>

git checkout -b coding-pages分支

git add -A  

git commit -m "提交"

git push origin coding-pages
```
此时备份到`coding-pages`分支成功

# 在另一台电脑写博备份操作。 #

某盘下：打开`git bash`键入
```
git clone <远程博客地址> <本地文件夹名>
```
当前默认为`master`分支，也就是`hexo`编译后的静态博客。

切换到`coding-pages`分支。
 
```
git branch -a 
git checkout coding-pages
```


输入以下指令：

```
npm install -g hexo-cli    # 安装hexo

npm install                # 安装依赖包

npm install hexo-deployer-git   # 用git部署插件

（记得，不需要hexo init这条指令）。

npm install hexo-generator-feed --save       RSS插件
```
输入

```
hexo g  
hexo s
```
打开： `http://localhost:4000/`   博客又完整回来了，神奇吧。。




 







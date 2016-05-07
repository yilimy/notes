---
title: 如何删除 Master 分支
date: 2016-04-26 13:52:26
tags: [git,分支]
categories: 学习笔记
---
# 为什么要删除 master 分支 #
当你在创建一个新的仓库的时候没有指定分支的话，`Git` 会默认创建 `master` 分支并指定它为默认分支。
一般情况下使用 master 分支作为整个项目的核心分支是很普遍的行为，
而 `Pages` 服务之所以使用 `gitcafe-pages` 分支的方式区别项目文件和 `Pages` 文件。
这样你就可以在一个仓库中保存他们而且彼此不会有任何影响。
但是像是个人主页类的 `Pages` 服务或其他一些应用场合，可能并不需要 `master` 的存在，
甚至必须要删除它，或者只是你有洁癖┑(￣Д ￣)┍
那么你就需要如下的方法来删除 master 分支。

<!--more-->

# 如何删除你的 master 分支 #
首先，删除你在本地的 master 分支，你需要首先切换到一个另一个分支上，如果没有可以新建一个：
> git branch gitcafe-pages
> git checkout gitcafe-pages
> git branch -D master


为了删除远端的 `master` 分支，可以运行命令：
> git push origin :master


而你很有可能会得到这样一个错误提示：

```
remote: error: By default, deleting the current branch is denied, because the next
remote: error: 'git clone' won't result in any file checked out, causing confusion.
remote: error:
remote: error: You can set 'receive.denyDeleteCurrent' configuration variable to
remote: error: 'warn' or 'ignore' in the remote repository to allow deleting the
remote: error: current branch, with or without a warning message.
remote: error:
remote: error: To squelch this message, you can set it to 'refuse'.
remote: error: refusing to delete the current branch: refs/heads/coding-pages
To git@git.condin.net:ranmocy/ranmocy.git
 ! [remote rejected] gitcafe-pages (deletion of the current branch prohibited)
error: failed to push some refs to 'git@coding.net:ranmocy/ranmocy.git'
```

这是因为 `coding` 需要指定一个默认分支，并在你访问这个项目页面的时候默认显示这个分支的代码。
这个时候我们就需要提交另外一个分支到远端：
> git push origin gitcafe-pages


并在项目管理页面中，将`“默认分支”`选项，设置为除 `master` 以外的分支上：

这样，我们就可以使用正确删除远端的 `master` 分支了：
 > git push origin :master


---
title: 如何进行远程版本回退
date: 2016-05-19 09:52:05
tags: [hexo,备份,git,命令]
categories: 学习笔记
---

如果远程只有一个master分支,请你创建一个非master分支,然后推送到远程。同时也是备份一下master分支。

```
git branch the_master_backup
git push origin the_master_backup
```
此时你查看远程分支应该有两个 master和the_master_backup
设置默认的分支为 the_master_backup
```
git branch -D branch_name //删除本地master分支

git push :master //推送一个空分支,相当于删除远程master分支
```

<!--more-->

# 删除远程分支 #

如何删除远程 Master 分支,为什么要删除远程 master 分支?[请看这里!](https://gitcafe.com/GitCafe/Help/wiki/%E5%A6%82%E4%BD%95%E5%88%A0%E9%99%A4-Master-%E5%88%86%E6%94%AF)
然后

# 操作步骤 #

然后你在the_master_backup分支上 回滚到你要回滚的commit_id,然后重建master分支并推送到远程,顺便删除the_master_backup分支(包括远程the_master_backup分支)。
```
git checkout the_master_backup

git reset --hard commit_id

git branch master //重新创建master分支

git push origin master //重新推送master分支

git branch -D the_master_backup //删除本地the_master_backup分支

git push origin :the_master_backup//删除远程the_master_backup分支

```

# 总结过程 #
```
git checkout the_branch

git pull

git branch the_branch_backup //备份一下这个分支当前的情况,如果你开始执行过，这一步可以省略。

git reset --hard the_commit_id //把the_branch本地回滚到the_commit_id

git push origin :the_branch //删除远程 the_branch

git push origin the_branch //用回滚后的本地分支重新建立远程分支

git push origin :the_branch_backup //如果前面都成功了，删除这个备份分支
```
本文引用于[大海的文章](https://jeffsui.github.io/2015/05/16/how-git-version-rollback/)
---
title: 删除掉没有与远程分支对应的本地分支
date: 2016-04-25 23:28:04
tags: [git,分支,git-fetch]
categories: 学习笔记
---
假设这样一种情况：

 1. 我创建了本地分支b1并pull到远程分支 origin/b1；
 2. 其他人在本地使用fetch或pull创建了本地的b1分支；
 3. 我删除了 origin/b1 远程分支；
 4. 其他人再次执行fetch或者pull并不会删除这个他们本地的 b1 分支，运行 git branch -a 
 5. 也不能看出这个branch被删除了，如何处理？

<!--more-->
 
使用下面的代码查看b1的状态：

    $ git remote show origin
    * remote origin
      Fetch URL: git@github.com:xxx/xxx.git
      Push  URL: git@github.com:xxx/xxx.git
      HEAD branch: master
      Remote branches:
        master                 tracked
        refs/remotes/origin/b1 stale (use 'git remote prune' to remove)
      Local branch configured for 'git pull':
        master merges with remote master
      Local ref configured for 'git push':
        master pushes to master (up to date)
		
		
这时候能够看到b1是stale的，使用 git remote prune origin 可以将其从本地版本库中去除。

更简单的方法是使用这个命令，它在fetch之后删除掉没有与远程分支对应的本地分支：
`git fetch -p`
---
title: 暂存git stash 命令
date: 2016/9/5 11:23:53 
tags: [hexo,Git]
categories: 学习笔记
---
当在一个分支的开发工作未完成，却又要切换到另外一个分支进行开发的时候，除了commit原分支的代码改动的方法外，我觉得git stash是一个更加便捷的选择。
步骤如下：

----------

# 添加改动到stash。 #
在原分支 `git stash save -a "messeag"`，网上很多很多资料都没有加 `-a` 这个`option`选项，我想他们的代码开发可能都是在原代码上进行修改吧。而对于在项目里加入了代码新文件的开发来说，`-a`选项才会将新加入的代码文件同时放入暂存区。

# 恢复改动。 #
如果你要恢复的是最近的一次改动，`git stash pop`即可，我用这个用的最多。如果有多次`stash`操作，那就通过`git stash list`查看`stash`列表，从中选择你想要`pop`的`stash`，运行命令`git stash pop stash@{id}`或者` git stash apply stash@{id}`即可。这方面网上的资料挺多的。

<!--more-->

# 删除stash。  #
`git stash drop <stash@{id}>`  如果不加`stash`编号，默认的就是删除最新的，也就是编号为0的那个，加编号就是删除指定编号的`stash`。`git  stash clear `是清除所有`stash`,整个世界一下子清净了！

> `git stash pop`  与 `git stash apply <stash@{id}>` 的区别。 

当我使用`git stash pop `和 `git stash apply` 几次以后，我发现`stash  list` 好像比我预计的多了几个`stash`。于是我便上网去了解了一下这两个命令的区别。原来`git stash pop stash@{id}`命令会在执行后将对应的`stash id 从stash list`里删除，而` git stash apply stash@{id}` 命令则会继续保存`stash id`。对于有点强迫症的我来说，是容不下越来越多的陈旧`stash id` 仍然存在的，所以我更习惯于用`git stash pop `命令。
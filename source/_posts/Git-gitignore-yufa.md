---
title: Git中的.gitignore的语法规范
date: 2016-07-10 19:00:09
tags: [git,语法]
categories: 学习笔记
---

当我们需要将一个项目提交到Git时，并不是所有的文件都需要提交，比如一些自动生成的文件，这时候就可以使用`.gitignore`来忽略一些不需要提交的文件，本文着重介绍一下`.gitignore`的配置语法。

# 创建 #

由于Windows下创建文件必须键入文件名，而要创建的`.gitignore`是没有文件名的，所以我们可以使用move命令来实现，打开`Git Bash` ，使用 `mv gitignore .gitignore`，然后可以编辑器编辑这个文件。

<!--more-->

# 语法规范 #

- 空行或是以`#开`头的行即注释行将被忽略。
- 可以在前面添加正斜杠`/`来避免递归,下面的例子中可以很明白的看出来与上一个的区别。
- 可以在后面添加正斜杠`/`来定义文件夹，例如`build/`。
- 可以使用`!`来否定忽略，即比如在前面用了`*.apk`，然后使用!`a.apk`，则这个`a.apk`不会被忽略。
- `*`用来匹配零个或多个字符，如`*.[oa]`忽略所有以”.o”或”.a”结尾，`*~ `忽略所有以`~`结尾的文件（这种文件通常被许多编辑器标记为临时文件）；`[]`用来匹配括号内的任一字符，如`[abc]`，也可以在括号内加连接符，如`[0-9]`匹配0至9的数；`?`用来匹配单个字符。
看了这么多，还是应该来个例子：


```
# no .a files
*.a

# but do track lib.a, even though you're ignoring .a files above
!lib.a

# only ignore the TODO file in the current directory, not subdir/TODO
/TODO

# ignore all files in the build/ directory
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .pdf files in the doc/ directory
doc/**/*.pdf
```

更多gitignore格式请参考：
[gitignore collection on github](https://github.com/github/gitignore "gitignore collection on github")

[The Ignoring Files chapter of the Pro Git book](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#Ignoring-Files "The Ignoring Files chapter of the Pro Git book")
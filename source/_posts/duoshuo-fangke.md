---
title: NexT主题'留言'页面增加最近访客
date: 2016-05-19 12:43:30
tags: [hexo,多说]
categories: 学习笔记
---
# 功能 #
在NexT主题上增加留言板的功能。 

# 实现方法 #
## 在菜单中添加guestbook ##

修改主题配置文件_config.yml（要注意是NexT目录下的_config.yml，不是hexo站点目录下的_config.yml），即hexo初始化目录下的/themes/next/_config.yml，添加 guestbook 到 menu 中:

<!--more-->


```
menu:
  home: /  
  #categories: /categories  
  about: /about  
  archives: /archives  
  tags: /tags  
  #commonweal: /404.html  
  guestbook: /guestbook
```

这样就在网站menu中增加了一个菜单：guestbook，此时留言板还没有真的实现。

添加对应译文显示

修改NexT主题zh-Hans.yml文件（我用的是简体中文的，其他语言也是类似的），即hexo初始化目录下/themes/next/languages/zh-Hans.yml，添加 guestbook: 留言 到 menu 中
```
menu:
  home: 首页
  archives: 归档
  categories: 分类
  tags: 标签
  about: 关于
  search: 搜索
  commonweal: 公益404
  guestbook: 留言
```
这样在网站上就可以显示中文留言两个字。

## 新建guestbook页面 ##

新建guestbook页面，[查看官方方法](http://theme-next.iissnan.com/theme-settings.html#tags-page "添加「标签」页面")一样新建guestbook，在hexo初始化目录下，右键选择`Git Bash Here`。

执行`hexo new page "guestbook"`。此时会在hexo初始化目录下的/source中看到名为guestbook的文件夹，在index.md中添加`comments: true`如
```
---
title: guestbook
date: 2016-03-11 22:42:56
comments: true
---
```
## 添加最近访客（多说插件） ##

### 修改guestbook目录下的index.md,在正文部分添加 ###
```
> 最近访客
<div class="ds-recent-visitors" data-num-items="28" data-avatar-size="42" id="ds-recent-visitors"></div>
```

### 修改多说CSS ###

登陆多说，点击后台管理，选择设置，向下找到自定义CSS，插入如下代码，滑到最底部点击保存即可。
```
#ds-reset .ds-avatar img,
#ds-recent-visitors .ds-avatar img {
    width: 54px;
    height: 54px;     /*設置圖像的長和寬，這裏要根據自己的評論框情況更改*/
    border-radius: 27px;     /*設置圖像圓角效果,在這裏我直接設置了超過width/2的像素，即為圓形了*/
    -webkit-border-radius: 27px;     /*圓角效果：兼容webkit瀏覽器*/
    -moz-border-radius: 27px;
    box-shadow: inset 0 -1px 0 #3333sf;     /*設置圖像陰影效果*/
    -webkit-box-shadow: inset 0 -1px 0 #3333sf;
}


#ds-recent-visitors .ds-avatar {
    float: left
}
/*隱藏多說底部版權*/
#ds-thread #ds-reset .ds-powered-by {
    display: none;
}
```

本文转载自： [万物博客](http://www.lovexing.cn/2016/04/29/NexT%E4%B8%BB%E9%A2%98%E6%96%B0%E5%BB%BA-%E7%95%99%E8%A8%80-%E9%A1%B5%E9%9D%A2/ "万物博客")



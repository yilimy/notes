---
title: NexT主题自定义面页无序列表样式
date: 2016-07-12 16:37:18
tags: [NexT主题,样式,list]
categories: 学习笔记
---
[原文请看感谢@weeson大神提供的方法](https://github.com/iissnan/hexo-theme-next/issues/934 "点我看方法！")。
不知道是什么原因，自定义页面列表都没有样式。很不方便。修改方法如下
解决about等页面无序列表不显示小圆圈问题
在样式文件的`blog\themes\next\source\css_custom`文件夹下找到`custom.styl`文件

<!--more-->

加入：
```
ul {
list-style-type: disc;
}
```
以上为实心圆，如需要调整到和文章页面相同的空心圆，修改为：
```
ul {
list-style-type: circle;
}
```
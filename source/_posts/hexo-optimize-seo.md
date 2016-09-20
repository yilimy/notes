---
title: Hexo Seo优化搜索排名
date: 2016-09-20 12:08:50
tags: [Hexo,Google,Seo]
categories: 学习笔记
---
# 首页title优化 #

更改index.swig文件`(your-hexo-site\themes\next\layout)`;
将下面这段代码
```
{% block title %} {{ config.title }} {% endblock %}
```
改成
```
{% block title %} {{ config.title }} - {{ theme.description }} {% endblock %}
```

这时候你的首页会更符合网站名称 - 网站描述这习惯。
进阶，做了`seo`优化，把关键词也显示在`title`标题里，可改成：	

```
{% block title %} {{ theme.keywords }} - {{ config.title }}{{ theme.description }} {% endblock %}
```
让你的关键字出现在`title`标题里
**注意：** *关键字出现在`title`标题里是有利于`seo`优化的，前提是你的目标关键词已经确定好。如果确定好的话，尽可能让它们在`title`标题尽量靠前，同时标题总字数注意控制在`80`个字符以内，切勿堆砌关键字。`title`的标点符号：关键词分割符号英文半角逗号`，_ | ;`品牌与关键词分割符号 `-`*

<!--more-->

# 给你的hexo站点添加sitemap网站地图 #
- 安装hexo的sitemap网站地图生成插件 
```
npm install hexo-generator-sitemap --save
npm install hexo-generator-baidu-sitemap --save
```
- 在你的hexo站点的`_config.yml`添加下面的代码(注意缩进格式)
```
# hexo sitemap网站地图
sitemap:
  path: sitemap.xml
baidusitemap:
  path: baidusitemap.xml
```
- 配置成功后，hexo编译时会在hexo站点根目录生成sitemap.xml和baidusitemap.xml
  其中sitemap.xml适合提交给谷歌搜素引擎，baidusitemap.xml适合提交百度搜索引擎。
  其次，在robots.txt中添加下面的一段代码：
```
Sitemap: http://yoursite.com/sitemap.xml
Sitemap: http://yoursite.com/baidusitemap.xml
```

请自行改成自己的网站。

# 给你的hexo网站添加蜘蛛协议robots.txt #

可以参考我的robots.txt，代码如下
```
# hexo robots.txt
User-agent: *
Allow: /
Allow: /archives/
Allow: /tags/
Allow: /guestbook/
Allow: /links/
Allow: /about/

Disallow: /vendors/
Disallow: /js/
Disallow: /css/
Disallow: /fonts/
Disallow: /vendors/
Disallow: /fancybox/

Sitemap: http://blog.ynxiu.com/sitemap.xml
Sitemap: http://blog.ynxiu.com/baidusitemap.xml
```
*把robots.txt放在你的hexo站点的source文件下即可。*

然后`hexo g -d` or `hexo d -g`提交一下，指的是生成后马上部署站点。

# 注册Google Search Console #

- 链接：https://www.google.com/webmasters/
- 根据提示注册好之后，添加你的博客域名。
- 然后点击你的域名进入。
- 测试`robots.txt`

点击左侧的`robots.txt`测试工具，根据提示提交你的`robots.txt`。
*注意要**0**错误才可以，如果有错误的话，会有提示，改正确就可以了。*

# 提交站点地图 #

还记得我们刚才创建创建`sitemap.xml`文件吧，点击左侧工具栏的`站点地图`。
然后点*右上角*的`添加/测试站点地图`。输入`sitemap`先点测试，如果没问题的话，再提交。

# Google 抓取方式 #

提交站点地图之后，点击左侧的`Google` 抓取方式
在这里我们填上我们需要抓取的`url`,不填这表示抓取首页，抓取方式可以选择桌面，智能手机等等，自行根据需要选择。填好`url`之后，点击抓取。
然后可能会出现几种情况，如:完成、部分完成、重定向等，自由这三种情况是可以提交的。
提交完成后，**提交至索引**，根据提示操作就可以了。
比如：下边的页面，也可以是文章的地址~~
```
archives/
tags/
guestbook/
links/
about/
```
到此`Google`收录提交方式完成。
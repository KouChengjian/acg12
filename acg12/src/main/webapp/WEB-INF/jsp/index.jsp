<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/12
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="css/index.css" rel="stylesheet">

</head>
<body>

<div class="title"></div>

<div class="search-box">
    <form action="/search/" method="get" class="new-searching-unit" data-regestered="regestered">
        <input id="query" type="text" size="27" name="q" autocomplete="off" placeholder="搜索你喜欢的" value="">
        <a href="#" onclick="return false;" class="go"></a>
    </form>
    <div class="hot-words">
        <span>热门搜索：</span>
        <a href="http://huaban.com/meiwu/pins/">夏娜</a>
        <span>，</span>
        <a href="http://huaban.com/muse/register">小林家的妹抖龙</a>
        <span>，</span>
        <a href="http://huaban.com/explore/yuanchuangchahua">冰果</a>
        <span>，</span>
        <a href="http://live.huaban.com/">凉宫春日的忧郁</a>
        <span>，</span>
        <a href="http://huaban.com/explore/shejipeise">轻音少女</a>
    </div>
</div>

</body>
</html>

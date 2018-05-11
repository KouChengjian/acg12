<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.acg12.service.person.PersonService" %>
<%@ page import="com.acg12.service.person.impl.PersonServiceImpl" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="com.acg12.utils.StringUtil" %>
<%@ page import="com.acg12.entity.po.person.PersonEntity" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/4
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/acg12/view/css/common/home-header.css">
    <link rel="stylesheet" href="/acg12/view/css/home-person-info.css">

    <script type="text/javascript" src="/acg12/view/js/common/home-header.js"></script>
    <script type="text/javascript" src="/acg12/view/js/common/util.js"></script>
</head>
<body>

<%
    ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
    PersonService personService = (PersonServiceImpl) ctx.getBean("personServiceImpl");
    PersonEntity result = new PersonEntity();
    String personId = (String)request.getAttribute("personId");
    if(StringUtil.isNumeric(personId)){
        result = personService.queryByPersonIdJoinDetail(Integer.valueOf(Integer.valueOf(personId).intValue()));
    }
%>

<div>
    <header id="header-menu"></header>
    <div class="container">
        <div class="container-center">
            <div id="container-centerA">
                <div class="info-left">
                    <div class="cover">
                        <%--<img src="//lain.bgm.tv/pic/cover/l/e9/fb/3110_ucarX.jpg">--%>
                    </div>
                    <ul id="info-box" style="height: 0px">
                        <li><span class="tip">中文名: </span>
                            大雄与动物行星
                        </li>
                        <li><span class="tip">原作: </span>
                            <a href="/person/1523" class="l" title="藤子·F·不二雄">藤子・F・不二雄</a>
                        </li>
                        <li><span class="tip">原作: </span>
                            <a href="/person/1523" class="l" title="藤子·F·不二雄">藤子・F・不二雄</a>
                        </li>
                    </ul>
                </div>

                <div class="info-right">
                    <p class="title">
                        <%--<a href="/manhua3566/" title="灼眼夏娜eternal song" style="color: #252525;">灼眼夏娜</a>--%>
                        <%--<a class="name" title="灼眼夏娜eternal song">灼眼夏娜</a>--%>
                    </p>
                    <p class="subtitle">
                        <%--作者：<a >高桥弥七郎</a>--%>
                    </p>
                    <p class="status">
                        <%--<span class="block">开始时间：<span>2011-10-20</span></span>--%>
                        <%--<span class="block">话数：<span>4</span></span>--%>
                        <!--<span class="block">题材<a href="/manhua-rexue/"><span>热血</span></a></span>-->
                    </p>
                    <p class="content">
                        时间是十六世纪初叶，地点是在欧洲，那是个还没有封绝的时代，曾有着那样的一场大战。这是一场被当时经历的人们以及名世听闻的人们称之以“大战”的巨大的……但是未曾被载入人类史书的秘密的战役
                        电
                    </p>

                    <div class="info-expand">
                        <a id="expand">查看详情>></a>
                    </div>

                </div>

            </div>

            <div class="container-tabs">
                <div class="tabs-content">
                    <a href="/nonononomad/" class="tab active">详情</a>
                    <a href="/nonononomad/" class="tab ">插画</a>
                    <a href="/nonononomad/" class="tab">画集</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<script type="text/javascript" >--%>
    <%--var pId = ${requestScope.personId};--%>
<%--//    console.log(pId);--%>
<%--</script>--%>
<script type="text/javascript" src="/acg12/view/js/home-person-info.js"></script>
</body>
</html>

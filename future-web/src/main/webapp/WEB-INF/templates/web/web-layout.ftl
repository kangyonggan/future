<#assign ctx="${(rca.contextPath)!''}">

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon" href="${ctx}/static/app/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${ctx}/static/ace/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/static/app/css/web.css"/>
<@block name="web-style"/>
</head>
<body>
<#include "banner.ftl">

<div id="main">
    <div class="search">
        <form action="#search" method="get" class="hidden-sm" novalidate>
            <input type="text" name="key" placeholder="搜出你的梦想，搜出你的未来..." autocomplete="off"/>
            <div class="hot">热搜：
                <a href="#search?key=linux">Linux</a>
                <a href="#search?key=ubuntu">Ubuntu</a>
                <a href="#search?key=ssh">SSH</a>
                <a href="#search?key=java">Java</a>
                <a href="#search?key=mysql">MySQL</a>
                <a href="#search?key=redis">Redis</a>
                <a href="#search?key=log4j2">Log4j2</a>
                <a href="#search?key=安装">安装</a>
                <a href="#search?key=配置">配置</a>
                <a href="#search?key=工具">工具</a>
                <a href="#guestbook">留言</a>
            </div>
        </form>
    </div>

    <div class="sim-page"></div>
</div>

<#include "footer.ftl">

<script>var ctx = '${ctx}';</script>
<script src="${ctx}/static/ace/dist/js/jquery.min.js"></script>
<script src="${ctx}/static/libs/simpage/simpage.js"></script>
<script src="${ctx}/static/app/js/web/web.js"></script>
<@block name="web-script"/>
</body>
</html>

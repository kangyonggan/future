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

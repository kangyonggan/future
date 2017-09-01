<#assign ctx="${(rca.contextPath)!''}">
<div class="page-header">
    <h1>
        留言详情
    </h1>
</div>

<div class="row align-center center">
    <h3>${message}</h3>
    <div class="space-32"></div>
    <a class="btn btn-large btn-inverse" href="#web/guestbook/${id}">返回留言详情</a>
    <div class="space-10"></div>
    <a class="btn btn-large btn-inverse" href="#web/guestbook">返回留言列表</a>
</div>

<script src="${ctx}/static/app/js/dashboard/web/guestbook/detail.js"></script>
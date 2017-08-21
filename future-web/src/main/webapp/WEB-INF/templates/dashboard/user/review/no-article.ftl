<#assign ctx="${(rca.contextPath)!''}">
<div class="page-header">
    <h1>
        文章详情
    </h1>
</div>

<div class="row align-center center">
    <h3>${message}</h3>
    <div class="space-32"></div>
    <a class="btn btn-large btn-inverse" href="#user/review/${id}">返回文章详情</a>
    <div class="space-10"></div>
    <a class="btn btn-large btn-inverse" href="#user/review">返回文章列表</a>
</div>

<script src="${ctx}/static/app/js/dashboard/user/review/detail.js"></script>
<#assign ctx="${(rca.contextPath)!''}">
<link rel="stylesheet" href="${ctx}/static/ace/dist/css/prettify.min.css"/>

<div class="page-header">
    <h1>
        消息详情
    </h1>
</div>

<div class="row">
    <div class="col-sm-10 col-sm-offset-1">
        <div class="widget-box transparent">
            <div class="widget-header widget-header-large">
                <h3 class="widget-title grey lighter">
                    <i class="ace-icon fa fa-leaf dark"></i>
                    ${message.title}
                </h3>

                <div class="widget-toolbar no-border invoice-info">
                    <span class="invoice-info-label">发布时间:</span>
                    <span class="red"><@c.relative_date datetime=message.createdTime/></span>

                    <br/>
                    <span class="invoice-info-label">类型:</span>
                    <span class="blue"><#include "type.ftl"></span>
                </div>

                <div class="widget-toolbar hidden-480">
                    <a href="#"></a>
                </div>
            </div>

            <div class="widget-body">
                <div class="widget-main padding-24">

                    <div class="space-10"></div>
                    <h5><i class="ace-icon fa fa-users icon-only"></i>消息接收人（<span class="red">${(message.isGroup==1)?string('群发', '定向')}</span>）</h5>

                    <table class="table table-striped table-bordered table-hove">
                        <thead>
                        <tr>
                            <th>手机号</th>
                            <th>真实姓名</th>
                            <th>邮箱</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list users as user>
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.realname}</td>
                            <td>${user.email}</td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>


                    <div class="space-20"></div>

                    <div class="hr hr8 hr-double hr-dotted"></div>

                    <div class="markdown">
                        ${message.content}
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/ace/dist/js/prettify.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/system/message/detail.js"></script>
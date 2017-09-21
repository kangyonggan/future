<#assign ctx="${(rca.contextPath)!''}">
<div class="page-header">
    <h1>
        正在生成 列表界面
    </h1>
</div>

<div class="space-10"></div>

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">
            <div class="widget-header widget-header-blue widget-header-flat">
                <h4 class="widget-title lighter">生成向导</h4>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div id="fuelux-wizard-container">
                        <div>
                            <ul class="steps">
                                <li data-step="1">
                                    <span class="step">1</span>
                                    <span class="title">使用说明</span>
                                </li>

                                <li data-step="2" class="active">
                                    <span class="step">2</span>
                                    <span class="title">界面设置</span>
                                </li>

                                <li data-step="3">
                                    <span class="step">3</span>
                                    <span class="title">添加表格的列</span>
                                </li>

                                <li data-step="4">
                                    <span class="step">4</span>
                                    <span class="title">添加搜索的列</span>
                                </li>

                                <li data-step="5">
                                    <span class="step">5</span>
                                    <span class="title">生成结果</span>
                                </li>
                            </ul>
                        </div>

                        <hr/>

                        <div class="step-content pos-rel">
                            <div class="step-pane active" data-step="1">
                                就等功能开发完之后再写说明吧。
                            </div>

                            <#include "step2.ftl">

                            <div class="step-pane" data-step="3">

                            </div>

                            <div class="step-pane" data-step="4">

                            </div>

                            <div class="step-pane" data-step="5">

                            </div>
                        </div>
                    </div>

                    <div class="clearboth"></div>

                    <hr/>

                    <div class="wizard-actions">
                        <button class="btn btn-prev">
                            <i class="ace-icon fa fa-arrow-left"></i>
                            上一步
                        </button>

                        <button class="btn btn-inverse btn-next" data-last="Finish">
                            下一步
                            <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/ace/dist/js/fuelux/fuelux.wizard.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/tool/code/list.js"></script>

<#if music.isStick == 1>
<a href="javascript:" data-role="music-tr" title="取消置顶"
   data-url="${ctx}/dashboard/web/music/manager/${music.id}/stick">
    <span class="label label-danger arrowed-in">已置顶</span>
</a>
<#else>
<a href="javascript:" data-role="music-tr" title="立马置顶"
   data-url="${ctx}/dashboard/web/music/manager/${music.id}/stick">
    <span class="label label-success arrowed-in">未置顶</span>
</a>
</#if>
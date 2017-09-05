<#assign ctx="${(rca.contextPath)!''}">

<tr id="music-${music.id}">
    <td>${music.id}</td>
    <td><a target="_blank" href="${ctx}/music/${music.singer} - ${music.name}.mp3">${music.name}</a></td>
    <td>${music.singer}</td>
    <td><a href="${ctx}/${music.albumCoverPath}" target="_blank">${music.album}</a></td>
    <td>${music.duration}</td>
    <td>${music.size}</td>
    <td>${music.uploadUsername}</td>
    <td><#include "stick.ftl"></td>
    <td><@c.relative_date datetime=music.updatedTime/></td>
    <td>
        <a target="_blank" href="${ctx}/music/${music.singer} - ${music.name}.mp3">
            <i class="ace-icon fa-2x fa fa-music"></i>
        </a>
    </td>
</tr>
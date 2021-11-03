<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/3
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="card jt-card jt-top-card sa-bg-blue mt-1 mb-1">
    <div class="jt-card-avatar bg-info"></div>
    <div class="card-body">
        <div class="jt-card-intro">
            <div>你好，欢迎来到Niushop</div>
            <div>有什么问题可以咨询我哦</div>
        </div>
        <div class="jt-card-tel">
            <%=GlobalSettings.getJsonArray("concat").getJsonObject(1).getString("inner")%>
        </div>
        <div class="jt-card-btn jt-card-btn-white us-none">查看演示</div>
        <div class="jt-card-btn jt-card-btn-blue us-none">购买授权</div>
    </div>
</div>
<div class="card jt-card mt-4 mb-1">
    <div class="card-body">
        <div class="jt-card-title">热门应用</div>
        <% for(int i = 0;i < 6;i++){ %>
        <div class="jt-card-child row us-none"
             onclick="window.open('./?r=/product/&aid=<%=i + ""%>','_self')"
        >
            <div class="col-5 jt-card-img"
                 style="background: url('<%=GlobalSettings.getString("hot_app_img")%>') no-repeat center center;background-size: auto 100%;"
            ></div>
            <div class="col-7">
                <div class="jt-card-child-intro jt-card-child-title">社交电商系统</div>
                <div class="jt-card-child-intro jt-card-child-price">399元/年</div>
            </div>
        </div>
        <% } %>
    </div>
</div>

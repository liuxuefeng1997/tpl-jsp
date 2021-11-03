<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/3
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% JsonObject Lists = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/DefaultProductList.json")); %>
<div class="sa-card-title">模块选择</div>
<div class="sa-card-subtitle">内置五套行业模板，不同的模板给您带来不一样的体验</div>
<div class="row">
    <% for(int i = 0;i < Lists.getJsonArray("mList").size();i++){ JsonObject _card_data = Lists.getJsonArray("mList").getJsonObject(i);%>
        <div class="col">
            <div class="acm-card">
                <img src="<%=_card_data.getString("img")%>" alt="">
                <div class="acm-card-title"><%=_card_data.getString("title")%></div>
            </div>
        </div>
    <% } %>
</div>

<div class="sa-card-title">完善系统功能</div>
<div class="sa-card-subtitle">内置五套行业模板，不同的模板给您带来不一样的体验</div>
<div class="acs-area">
    <% for(int i = 0;i < Lists.getJsonArray("sList").size();i++){ JsonObject _card_data = Lists.getJsonArray("sList").getJsonObject(i);%>
        <div class="acs-card"
             style="background-color: <%=_card_data.getString("bg-color")%>"
        >
            <div class="acs-card-icon"
                 style="background: url('<%=_card_data.getString("icon")%>') no-repeat;
                         background-size: 100% 100%;"
            ></div>
            <div class="acs-card-title"><%=_card_data.getString("title")%></div>
            <div class="acs-card-subtitle"><%=_card_data.getString("subtitle")%></div>
        </div>
    <% } %>
</div>
<div class="aci-card">
    <div class="row">
        <div class="col-6 aci-card-child"
             style="background: url('<%=Lists.getJsonObject("vip").getString("img")%>') no-repeat center center;
                     background-size: auto 100%;"
        ></div>
        <div class="col-6 aci-card-child">
            <div class="aci-card-child-intro">
                <div class="aci-card-title"><%=Lists.getJsonObject("vip").getString("title")%></div>
                <div class="aci-card-subtitle"><%=Lists.getJsonObject("vip").getString("intro")%></div>
            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/home/style.css?v=<%=TimerX.getNowTimeStr(10)%>">

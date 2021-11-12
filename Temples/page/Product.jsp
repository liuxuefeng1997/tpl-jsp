<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/2
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% JsonObject ProductSettings = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/ProductSettings.json")); %>
<% JsonObject ProductTags = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("POST",Api_Url_Product_Tags,"",Api_Url_Host)); %>
<div class="container mt-1 mb-1">
    <div class="pd-banner" style="background: url('<%=ProductSettings.getString("banner")%>') no-repeat center center;background-size: auto 100%;">
        <div class="pd-banner-right us-none">
            <div class="pd-banner-card">码云下载</div>
            <div class="pd-banner-card">授权查询</div>
            <div class="pd-banner-card">GitHub</div>
        </div>
    </div>
    <div class="pd-banner-bottom us-none">
        <div class="row">
            <div class="col">
                <div class="pd-banner-bottom-card">
                    <div class="pd-banner-bottom-card-title">正版源码</div>
                    <div class="pd-banner-bottom-card-subtitle">独家正版源码可升级</div>
                </div>
            </div>
            <div class="col">
                <div class="pd-banner-bottom-card">
                    <div class="pd-banner-bottom-card-title">终生授权</div>
                    <div class="pd-banner-bottom-card-subtitle">一次获得，永久免费</div>
                </div>
            </div>
            <div class="col">
                <div class="pd-banner-bottom-card">
                    <div class="pd-banner-bottom-card-title">域名可查</div>
                    <div class="pd-banner-bottom-card-subtitle">授权域名可以查看</div>
                </div>
            </div>
            <div class="col">
                <div class="pd-banner-bottom-card">
                    <div class="pd-banner-bottom-card-title">工单服务</div>
                    <div class="pd-banner-bottom-card-subtitle">工单系统提交问题反馈</div>
                </div>
            </div>
            <div class="col">
                <div class="pd-banner-bottom-card">
                    <div class="pd-banner-bottom-card-title">售后保障</div>
                    <div class="pd-banner-bottom-card-subtitle">技术支持保障您的后续运行</div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <%
                if(ProductTags != null && ProductTags.getInt("code") == 0){
                    JsonArray data = ProductTags.getJsonArray("data");
                    for(int i = 0;i < data.size();i++){
                        JsonObject dt = data.getJsonObject(i);
                        String title = dt.getString("label");
                        String value = dt.getInt("value") + "";
                        String tag = null;
                        if(i == 0){
                            tag = "999";
                        }
            %>
            <button class="nav-link<%=ActiveX.getUnNull(tag," active")%>" id="tab-<%=value%>" data-bs-toggle="tab" data-bs-target="#nav-<%=value%>" type="button" role="tab" aria-controls="nav-<%=value%>" aria-selected="<%=ActiveX.getStu(tag,"999","true","false")%>"><%=title%></button>
            <% }} else { %>
            <button class="nav-link active" id="tab-error" data-bs-toggle="tab" data-bs-target="#nav-error" type="button" role="tab" aria-controls="nav-error" aria-selected="true">API 不可用</button>
            <% } %>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <%
            if(ProductTags != null && ProductTags.getInt("code") == 0){
                JsonArray data = ProductTags.getJsonArray("data");
                for(int i = 0;i < data.size();i++){
                    JsonObject dt = data.getJsonObject(i);
                    String path = dt.getJsonArray("path").toString();
                    String value = dt.getInt("value") + "";
                    String tag = null;
                    if(i == 0){
                        tag = "999";
                    }
        %>
        <div class="tab-pane fade<%=ActiveX.getUnNull(tag," show active")%>" id="nav-<%=value%>" role="tabpanel" aria-labelledby="tab-<%=value%>">
            <div class="w-100 mt-1 overflow-hidden">
                <%
                    //out.print(path);
                    //读取分类
                    JsonObject ProductList = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("POST",Api_Url_Product_List,"{\"tags\":" + path + "}",Api_Url_Host));
                    JsonArray ds = ProductList.getJsonObject("data").getJsonArray("data");
                    for(JsonValue d : ds){
                        JsonObject j = d.asJsonObject();
                %>
                <div class="card pd-card us-none"
                     onclick="window.open('./?r=/product/&aid=<%=j.getInt("id") + ""%>','_self')"
                >
                    <div class="pd-card-img" style="background: url('<%=j.getString("head_pic")%>') no-repeat center center;background-size: 100% 100%;"></div>
                    <div class="pd-card-body">
                        <div class="pd-card-title"><%=j.getString("title")%></div>
                        <div class="pd-card-subtitle"><%=j.getString("subtitle")%></div>
                        <div class="pd-card-bottom">
                            <div class="pd-card-price"><span>￥<%=(j.getInt("price") / 100.00) + ""%></span><span>￥<%=(j.getInt("old_price") / 100.00) + ""%></span></div>
                            <div class="pd-card-buySum"><%=j.getInt("sale_number") + ""%>人购买</div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <% }} else { %>
            <div class="tab-pane fade show active" id="nav-error" role="tabpanel" aria-labelledby="tab-error">
                <div class="w-100 mt-1 overflow-hidden">
                    <%=(ProductTags != null ? "\n<span class=\"fw-bold\">服务器返回：</span>" + ProductTags : "\n<span class=\"fw-bold\">错误：</span>连接至API服务器超时")%>
                </div>
            </div>
        <% } %>
    </div>
</div>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/product/style.css?v=<%=TimerX.getNowTimeStr(10)%>">

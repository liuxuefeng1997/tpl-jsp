<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/2
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String _aid = request.getParameter("aid");
    String _route = request.getParameter("r");
%>
<div class="container mt-1 mb-1">
    <div class="row">
        <div class="col-9">
            <div class="card jt-card jt-top-card mt-1 mb-1"
                 style="background: url('<%=IntroSettings.getJsonObject("top_img").getString(_route.replace("/",""))%>') no-repeat center center;
                         background-size: auto 100%;"
            ></div>
            <div class="card jt-card mt-4 mb-1">
                <%
                    switch (_route){case "/product/":
                        JsonObject ProductDetail = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("POST",Api_Url_Product_Detail,"id=" + _aid,Api_Url_Host));
                        if(ProductDetail.getInt("code") == 0){
                            JsonObject data = ProductDetail.getJsonObject("data");
                %>
                    <div class="sa-card-title us-none"><%=data.getString("title")%></div>
                    <div class="sa-card-subtitle us-none"><%=data.getString("subtitle")%></div>
                    <%=data.getString("content")%>
                <% } else { %>
                    <%@ include file="../modal/DefaultProduct.jsp" %>
                <% } break; case "/case/": %>
                    <%@ include file="../modal/DefaultProduct.jsp" %>
                <% break; } %>
            </div>
        </div>
        <div class="col-3">
            <%@ include file="../modal/CaseRightBar.jsp" %>
        </div>
    </div>
</div>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/home/style.css?v=<%=TimerX.getNowTimeStr(10)%>">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/join/style.css?v=<%=TimerX.getNowTimeStr(10)%>">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/article/style.css?v=<%=TimerX.getNowTimeStr(10)%>">

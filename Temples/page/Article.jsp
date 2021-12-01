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
    String _type = request.getParameter("type");
%>
<div class="container mt-1 mb-1">
    <div class="row">
        <div class="col-9">
            <div class="card jt-card jt-top-card mt-1 mb-1"
                 id="product-head-image"
                 style="background: url('<%=IntroSettings.getJsonObject("top_img").getString(_route.replace("/",""))%>') no-repeat center center;
                         background-size: auto 100%;"
            ></div>
            <div class="card jt-card mt-4 mb-1 us-none">
                <%
                    switch (_route){case "/product/":
                        if(StringX.isNotNull(_type) && _type.equals("check")){ %>
                    <%@ include file="CheckBuy.jsp" %>
                <% break; }
                        JsonObject ProductDetail = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("POST",Api_Url_Product_Detail,"id=" + _aid,Api_Url_Host));
                        if(DebugSettings){System.out.print(ProductDetail);}
                        if(ProductDetail != null && ProductDetail.getInt("code") == 0){
                            JsonObject data = ProductDetail.getJsonObject("data");
                            //out.print(data);
                %>
                    <div class="sa-card-buy us-none">
                        <div class="row">
                            <div class="col-5">
                                <div class="sa-card-buy-img"
                                     style="background: url('<%=data.getString("head_pic")%>') no-repeat center center;
                                             background-size: 100% auto"
                                ></div>
                            </div>
                            <div class="col-7">
                                <div class="sa-card-buy-title"><%=data.getString("title")%></div>
                                <div class="sa-card-buy-subtitle"><%=data.getString("subtitle")%></div>
                                <div class="sa-card-buy-info">
                                    <div class="w-50 float-start text-start">价格<span>￥ <%=(data.getInt("price") / 100.00) + ""%></span></div>
                                    <div class="w-50 float-start text-end"><%=data.getInt("sale_number") + ""%>购买</div>
                                </div>
                                <div class="sa-card-buy-button position-relative">
                                    <button class="btn btn-primary" onclick="window.open('./?r=<%=_route%>&aid=<%=_aid%>&type=check','_self')">立即购买</button>
                                    <%
                                        String show_url = "";
                                        if(!data.get("info").toString().trim().equals("[]") && StringX.isNotNull(data.getJsonObject("info").get("show_url") + "")){
                                            show_url = " onclick=\"window.open('{{url}}','_blank')\"".replace("{{url}}",data.getJsonObject("info").get("show_url") + "");
                                        }
                                    %>
                                    <button class="btn btn-warning"<%=show_url%>>查看演示</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%=data.getString("content")%>
                <% } else { %>
                    <%@ include file="../modal/DefaultProduct.jsp" %>
                <% } break; case "/case/": %>
                    <%@ include file="Case.jsp" %>
                <% break; default:
                    JsonObject NewsDetail = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("POST",Api_Url_News_Detail,"id=" + _aid,Api_Url_Host));
                    if(DebugSettings){out.print(NewsDetail);}
                    //if(DebugSettings){break;}//这是一个断点
                    if(NewsDetail.getInt("code") == 0){
                        JsonObject data = NewsDetail.getJsonObject("data");
                %>
                    <div class="sa-card-title us-none"><%=data.getString("title")%></div>
                    <div class="sa-card-subtitle us-none"><%=data.getString("subtitle")%></div>
                    <div class="container-fluid mt-3 pb-2"><%=data.getString("content")%></div>
                <% } break; } %>
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

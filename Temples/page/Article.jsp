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
                 id="product-head-image"
                 style="background: url('<%=IntroSettings.getJsonObject("top_img").getString(_route.replace("/",""))%>') no-repeat center center;
                         background-size: auto 100%;"
            ></div>
            <div class="card jt-card mt-4 mb-1 us-none">
                <%
                    switch (_route){case "/product/":
                        JsonObject ProductDetail = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("POST",Api_Url_Product_Detail,"id=" + _aid,Api_Url_Host));
                        if(ProductDetail.getInt("code") == 0){
                            JsonObject data = ProductDetail.getJsonObject("data");
                %>
                    <div class="sa-card-title us-none"><%=data.getString("title")%></div>
                    <div class="sa-card-subtitle us-none"><%=data.getString("subtitle")%></div>
                    <%=data.getString("content")%>
                    <%@ include file="../modal/BuyBox.jsp" %>
                    <script>
                        window.onload = function (){
                            document.getElementById("product-buy").setAttribute("data-bs-toggle","modal");
                            document.getElementById("product-buy").setAttribute("data-bs-target","#buyBox");
                            document.getElementById("product-buy").onclick = function (){
                                iu.http.res("POST","<%=Api_Url_Users_Buy%>",true,JSON.stringify({
                                    product_id: <%=_aid%>
                                }),[
                                    {
                                        "name": "content-type",
                                        "value": "application/json;charset=UTF-8"
                                    },
                                    {
                                        "name": "Authorization",
                                        "value": localStorage.getItem("token")
                                    }
                                ],function (e){
                                    if(e.status !== 500){
                                        let json = JSON.parse(e.responseText);
                                        if(json.code === 0){
                                            document.getElementById("product-name-span").innerHTML = "<%=data.getString("title") + " - "%>";
                                            document.getElementById("buyBox-text").innerHTML = "";
                                            let qr_svg = iu.QRCode.generate(json.data.pay_url,200,"resources/images/default/wxpay.jpg",50);
                                            qr_svg.id = "wx_pay_qr";
                                            document.getElementById("buyBox-text").appendChild(qr_svg);
                                            document.getElementById("buyBox-label").setAttribute("order_id",json.data.order_id);
                                            let div = document.createElement("div");
                                            div.style.width = "100%";
                                            div.style.height = "24px";
                                            div.style.lineHeight = "24px";
                                            div.style.fontSize = "18px";
                                            div.style.fontWeight = "bold";
                                            div.style.marginTop = "0.5em";
                                            div.className = "text-center";
                                            div.innerHTML = "需支付： ￥ <%=(data.getInt("price") / 100.00) + ""%>"
                                            document.getElementById("buyBox-text").appendChild(div);
                                            document.getElementById("wx_pay_qr").setAttribute("style","margin-top: 0.5em;");
                                        }else if(json.code === 401){
                                            document.getElementById("buyBox-text").innerHTML = "需要登录才能购买！";
                                            if(document.getElementById("buyBox-check")){document.getElementById("buyBox-check").remove();}
                                        }
                                    }
                                });
                            }
                        }
                    </script>
                <% } else { %>
                    <%@ include file="../modal/DefaultProduct.jsp" %>
                <% } break; default:
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

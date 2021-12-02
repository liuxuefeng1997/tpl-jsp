<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/3
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    JsonObject Lists = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("GET",Api_Url_Case,null));
%>
<style>
    .case-qr {
        display: none;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.36);
        border-radius: 6px;
        position: absolute;
        top: 0;
        left: 0;
    }
    .case-qr-box {
        width: 88px;
        height: 88px;
        margin: 90px auto 0;
        background: #FFF;
        border-radius: 6px;
    }
    .acm-card:hover .case-qr {
        display: block;
    }
    .case-qr-box svg,.case-qr-box img {
        margin: 4px;
        text-align: center;
    }
</style>
<div class="sa-card-title us-none">成功案例</div>
<div class="sa-card-subtitle us-none">内置五套行业模板，不同的模板给您带来不一样的体验</div>
<div class="container-fluid pb-4">
    <div class="row us-none">
        <% for(int i = 0;i < Lists.getJsonArray("data").size();i++){ JsonObject _card_data = Lists.getJsonArray("data").getJsonObject(i);%>
        <div class="col">
            <div class="acm-card position-relative" style="overflow:unset">
                <img src="<%=_card_data.getString("url")%>" alt="">
                <div class="acm-card-title" style="font-size: 18px;"><%=_card_data.getString("title")%></div>
                <div class="case-qr">
                    <div class="case-qr-box" id="qrg-<%=i + ""%>"></div>
                    <script id="qrs-<%=i + ""%>">
                        iu.QRCode.addToHTML(document.getElementById("qrg-<%=i + ""%>"),"<%=_card_data.getString("link").startsWith("http://") || _card_data.getString("link").startsWith("https://") ? _card_data.getString("link") : "http://" + _card_data.getString("link") %>",80);
                        document.getElementById("qrg-<%=i + ""%>").removeAttribute("id");
                        document.getElementById("qrs-<%=i + ""%>").remove();
                    </script>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="./modal/LoginBox.jsp" %>
<%@ include file="./modal/UsersBox.jsp" %>
<%--页尾横幅--%>
<% if (GlobalSettings.getBoolean("is_streamer_show")) { %>
    <!--底部横幅-->
    <div class="bottom-info ns-bg-color position-relative us-none">
        <span><%=GlobalSettings.getJsonObject("streamer").getString("slogan")%></span>
        <% if(StringX.isNotNull(GlobalSettings.getJsonObject("streamer").getString("btn_title"))){ %><button type="button" class="ns-btn" onclick="window.open('./?r=<%=GlobalSettings.getJsonObject("streamer").getString("btn_route")%>','<%=ActiveX.getStW(GlobalSettings.getJsonObject("streamer").getString("btn_route"),"/link/","_blank","_self")%>')"><%=GlobalSettings.getJsonObject("streamer").getString("btn_title")%></button><% } %>
    </div>
<% } %>
<!--页脚开始-->
<div class="base-footer">
    <div class="ns-base-width footer-main">
        <div class="footer-consult">
            <div class="consult-left">
                <% for(int i = 0;i < FooterMenu.getJsonArray("menu").size();i++){
                    JsonObject _menu = FooterMenu.getJsonArray("menu").getJsonObject(i);
                %>
                    <dl class="us-none">
                        <dt><%=_menu.getString("title")%></dt>
                        <% for(int n = 0;n < _menu.getJsonArray("link_list").size();n++){
                            JsonObject _menu_link = _menu.getJsonArray("link_list").getJsonObject(n);
                        %>
                            <dd><a href="./?r=<%=_menu_link.getString("route")%>" target="<%=ActiveX.getStW(_menu_link.getString("route"),"/link/","_blank","_self")%>"><%=_menu_link.getString("title")%></a></dd>
                        <% } %>
                    </dl>
                <% } %>
                <dl>
                    <dt class="us-none">咨询我们</dt>
                    <% for(int i = 0;i < GlobalSettings.getJsonArray("concat").size();i++){ %>
                        <dd>
                            <span class="us-none"><%=GlobalSettings.getJsonArray("concat").getJsonObject(i).getString("title")%>：</span>
                            <span><%=GlobalSettings.getJsonArray("concat").getJsonObject(i).getString("inner")%></span>
                        </dd>
                    <% } %>
                </dl>
            </div>
            <div class="consult-right us-none">
                <div class="consult-right-code">
                    <% if(GlobalSettings.getJsonObject("concat_qr").getJsonObject("a").getBoolean("if_generate")){ %>
                    <div id="iu-lib-qr-box-1"></div>
                    <script id="iu-lib-qr-js-1">
                        document.getElementById("iu-lib-qr-box-1").appendChild(iu.QRCode.generate("<%=GlobalSettings.getJsonObject("concat_qr").getJsonObject("a").getString("img")%>",120));
                        document.getElementById("iu-lib-qr-box-1").removeAttribute("id");
                        document.getElementById("iu-lib-qr-js-1").remove();
                    </script>
                    <% }else { %>
                    <img src="<%=GlobalSettings.getJsonObject("concat_qr").getJsonObject("a").getString("img")%>" width="140" height="140" alt="a">
                    <% } %>
                    <span><%=GlobalSettings.getJsonObject("concat_qr").getJsonObject("a").getString("title")%></span>
                </div>
                <div class="consult-right-code">
                    <% if(GlobalSettings.getJsonObject("concat_qr").getJsonObject("b").getBoolean("if_generate")){ %>
                    <div id="iu-lib-qr-box-2"></div>
                    <script id="iu-lib-qr-js-2">
                        document.getElementById("iu-lib-qr-box-2").appendChild(iu.QRCode.generate("<%=GlobalSettings.getJsonObject("concat_qr").getJsonObject("b").getString("img")%>",120));
                        document.getElementById("iu-lib-qr-box-2").removeAttribute("id");
                        document.getElementById("iu-lib-qr-js-2").remove();
                    </script>
                    <% }else { %>
                    <img src="<%=GlobalSettings.getJsonObject("concat_qr").getJsonObject("b").getString("img")%>" width="140" height="140" alt="b">
                    <% } %>
                    <span><%=GlobalSettings.getJsonObject("concat_qr").getJsonObject("b").getString("title")%></span>
                </div>
            </div>
        </div>
        <div class="footer-other-info">
            <div class="other-company-info">
                <span><a href="https://beian.miit.gov.cn/" target="_blank" style="color:#909192;">备案号：<%=GlobalSettings.getString("beian")%></a></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/28
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!--页面内容-->
<div class="container mt-1 mb-1">
    <div class="row">
        <div class="col-3">
            <div class="container-fluid mt-1 mb-1 bg-white banner-box banner-box-left">
                <% JsonObject BannerLeftLink = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/BannerLeftLink.json")); %>
                <%
                    for(int i = 0;i < BannerLeftLink.getJsonArray("link").size();i++){
                        JsonObject Link = BannerLeftLink.getJsonArray("link").getJsonObject(i);
                %>
                    <div class="mt-3 mb-3">
                        <div class="banner-box-link-title"><%=Link.getString("title")%></div>
                        <div class="banner-box-link-inner">
                            <%
                                for(int n = 0;n < Link.getJsonArray("list").size();n++){
                                    String _c = " | ";
                                    if(n == 0){
                                        _c = "";
                                    }
                                    JsonObject aLink = Link.getJsonArray("list").getJsonObject(n);
                            %>
                                <%=_c%><a href="./?r=<%=aLink.getString("route")%>"><%=aLink.getString("title")%></a>
                            <% } %>
                        </div>
                    </div>
                <% } %>
                <div class="mt-3 pb-1">
                    <div class="banner-box-link-more">没有找到想要的产品或服务？<a href="./?r=<%=BannerLeftLink.getString("more_route")%>">发布需求</a></div>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div id="carouselExampleIndicators" class="carousel slide banner-box banner-box-carousel" data-bs-ride="carousel">
                <% JsonObject BannerList = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/BannerList.json")); %>
                <div class="carousel-indicators">
                    <%
                        for(int i = 0;i < BannerList.getJsonArray("banner").size();i++){
                            String _c = "";
                            if(i == 0){
                                _c = " class=\"active\" aria-current=\"true\"";
                            }
                    %>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%=i + ""%>"<%=_c%> aria-label="Slide 2"></button>
                    <% } %>
                </div>
                <div class="carousel-inner">
                    <%
                        for(int i = 0;i < BannerList.getJsonArray("banner").size();i++){
                            String _c = "";
                            if(i == 0){
                                _c = " active";
                            }
                            JsonObject Banner = BannerList.getJsonArray("banner").getJsonObject(i);
                    %>
                        <div class="carousel-item<%=_c%>">
                            <img src="<%=Banner.getString("img")%>" class="d-block w-100 m-auto" alt="..." onclick="window.open('./?r=<%=Banner.getString("route")%>','_self')">
                        </div>
                    <% } %>
                </div>
            </div>
            <%
                JsonObject BannerADLink = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/BannerADLink.json")),
                        BannerADLink_middle = BannerADLink.getJsonObject("middle_bottom"),
                        BannerADLink_right = BannerADLink.getJsonObject("right_bottom");
            %>
            <div class="banner-box banner-box-trd mt-3 mb-1 pt-1 pb-1">
                <div class="row banner-box-trd-width h-100 m-auto">
                    <div class="col-4">
                        <div class="banner-box-trd-card"
                             style="background: url('<%=BannerADLink_middle.getJsonObject("left").getString("img")%>') no-repeat;background-size:100% 100%;"
                             onclick="window.open('./?r=<%=BannerADLink_middle.getJsonObject("left").getString("route")%>','_self')"
                        ></div>
                    </div>
                    <div class="col-4">
                        <div class="banner-box-trd-card"
                             style="background: url('<%=BannerADLink_middle.getJsonObject("middle").getString("img")%>') no-repeat;background-size:100% 100%;"
                             onclick="window.open('./?r=<%=BannerADLink_middle.getJsonObject("middle").getString("route")%>','_self')"
                        ></div>
                    </div>
                    <div class="col-4">
                        <div class="banner-box-trd-card"
                             style="background: url('<%=BannerADLink_middle.getJsonObject("right").getString("img")%>') no-repeat;background-size:100% 100%;"
                             onclick="window.open('./?r=<%=BannerADLink_middle.getJsonObject("right").getString("route")%>','_self')"
                        ></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="container-fluid mt-1 mb-1 pb-3 bg-white banner-box banner-box-right">
                <div class="banner-box-login-area mt-1 mb-1">
                    <div class="banner-box-login-img-box mt-1 mb-1"
                         style="background: url('<%=GlobalSettings.getString("banner_login_bg")%>') no-repeat;background-size:100% 100%;"
                    ></div>
                    <div class="banner-box-login-button-area mt-1 mb-1">
                        <button type="button" class="btn btn-primary">登录</button>
                        <button type="button" class="btn btn-outline-dark">注册</button>
                    </div>
                </div>
                <div class="banner-box-ad-area mt-1"
                     style="background: url('<%=BannerADLink_right.getString("img")%>') no-repeat;background-size:100% 100%;"
                     onclick="window.open('./?r=<%=BannerADLink_right.getString("route")%>','_self')"
                ></div>
            </div>
        </div>
    </div>
</div>
<div class="container mt-5 mb-1">
    <div class="sa-card">
        <div class="sa-card-title">热点应用排行</div>
        <div class="sa-card-inner">
            <div class="sa-card-inner-left-img"></div>
            <div class="sa-card-inner-right" id="sa-sm-card-1">
                <div class="sa-sm-card-out">
                    <% for(int i = 0;i < 12;i++){ %>
                        <div class="sa-sm-card">
                            <div class="sa-sm-card-img" onclick="window.open('./?r=/','_self')"></div>
                            <div class="sa-sm-card-title">抖音本地生活小程序</div>
                            <div class="sa-sm-card-old-price">市场价:<span>￥19800.00</span></div>
                            <div class="sa-sm-card-last-price">价格:<span>￥4999.00</span></div>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <script>
        //鼠标拖动事件
        document.getElementById("sa-sm-card-1").onmousedown=function(ev){
            //鼠标移动时事件
            document.onmousemove=function(e){
                //兼容处理
                let _event = e || event;
                document.getElementById("sa-sm-card-1").scrollLeft -= _event.movementX;
            }

            //鼠标脱离事件
            document.onmouseup=function(){
                //让脱离的时候全部东西为空   保证松手后不会继续跟着鼠标移动
                document.onmousemove=null;
                document.onmouseup=null;
                //阻止默认事件
                return false;
            }
        }
    </script>
</div>
<% if (GlobalSettings.getBoolean("is_streamer_show")) { %>
    <div class="bottom-info ns-bg-color position-relative">
        <span><%=GlobalSettings.getJsonObject("streamer").getString("slogan")%></span>
        <button type="button" class="ns-btn" onclick="window.open('./?r=<%=GlobalSettings.getJsonObject("streamer").getString("btn_route")%>','_self')"><%=GlobalSettings.getJsonObject("streamer").getString("btn_title")%></button>
    </div>
<% } %>
<!--加载当页样式-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/home/style.css?v=<%=TimerX.getNowTimeStr(10)%>">

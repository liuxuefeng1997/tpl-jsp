<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/28
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!--页面内容-->
<!--Banner 区域-->
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
                        <div class="carousel-item<%=_c%><%=ActiveX.getUnNull(Banner.getString("route")," us-hover")%>">
                            <img src="<%=Banner.getString("img")%>"
                                 class="d-block w-100 m-auto"
                                 alt="..."
                                <% if(StringX.isNotNull(Banner.getString("route"))){ %> onclick="window.open('./?r=<%=Banner.getString("route")%>','_self')"<% } %>
                            >
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
                             style="background: url('<%=BannerADLink_middle.getJsonObject("left").getString("img")%>') no-repeat center center;background-size:auto 100%;"
                             onclick="window.open('./?r=<%=BannerADLink_middle.getJsonObject("left").getString("route")%>','_self')"
                        ></div>
                    </div>
                    <div class="col-4">
                        <div class="banner-box-trd-card"
                             style="background: url('<%=BannerADLink_middle.getJsonObject("middle").getString("img")%>') no-repeat center center;background-size:auto 100%;"
                             onclick="window.open('./?r=<%=BannerADLink_middle.getJsonObject("middle").getString("route")%>','_self')"
                        ></div>
                    </div>
                    <div class="col-4">
                        <div class="banner-box-trd-card"
                             style="background: url('<%=BannerADLink_middle.getJsonObject("right").getString("img")%>') no-repeat center center;background-size:auto 100%;"
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
                         style="background: url('<%=GlobalSettings.getString("banner_login_bg")%>') no-repeat center center;background-size:auto 100%;"
                    ></div>
                    <div class="banner-box-login-button-area mt-1 mb-1">
                        <button type="button" class="btn btn-primary">登录</button>
                        <button type="button" class="btn btn-outline-dark">注册</button>
                    </div>
                </div>
                <div class="banner-box-ad-area mt-1"
                     style="background: url('<%=BannerADLink_right.getString("img")%>') no-repeat center center;background-size:100% auto;"
                     onclick="window.open('./?r=<%=BannerADLink_right.getString("route")%>','_self')"
                ></div>
            </div>
        </div>
    </div>
</div>
<!--展示 区域-->
<%--热点应用--%>
<% if(GlobalSettings.getBoolean("is_hot_app_show")){ %>
    <!--热点应用排行-->
    <div class="container mt-5 mb-1">
        <% String cid = "sa-sm-card-1"; %>
        <div class="sa-card">
            <div class="sa-card-title">热点应用排行</div>
            <div class="sa-card-inner">
                <div class="sa-card-inner-left-img"
                     style="background: url('<%=GlobalSettings.getString("hot_app_img")%>') no-repeat center center;background-size: 100% auto;"
                ></div>
                <div class="sa-card-inner-right" id="<%=cid%>">
                    <div class="sa-sm-card-out">
                        <% for(int i = 0;i < 4;i++){ %>
                            <div class="sa-sm-card">
                                <div class="sa-sm-card-img" onclick="window.open('./?r=/product/&aid=0','_self')"></div>
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
            document.getElementById("<%=cid%>").onmousedown=function(ev){
                //鼠标移动时事件
                document.onmousemove=function(e){
                    //兼容处理
                    let _event = e || event;
                    document.getElementById("<%=cid%>").scrollLeft -= _event.movementX;
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
<% } %>
<%--广告横幅--%>
<% if (GlobalSettings.getBoolean("is_inner_streamer_show")) { %>
    <!--广告横幅-->
    <div class="bottom-info sa-bg-color position-relative"
         style="background: url('<%=GlobalSettings.getJsonObject("inner_streamer").getString("img")%>') no-repeat center center;background-size: auto 100%;"
         onclick="window.open('./?r=<%=GlobalSettings.getJsonObject("inner_streamer").getString("route")%>','_self')"
    ></div>
<% } %>
<%--行业解决方案--%>
<% if(GlobalSettings.getBoolean("is_solution_show")){ %>
    <!--行业解决方案-->
    <div class="container mt-5 mb-1">
        <div class="sa-card">
            <div class="sa-card-title">行业解决方案</div>
            <div class="sa-card-inner sa-card-inner-x">
                <div class="sa-card-inner-left-img"
                     style="background: url('<%=GlobalSettings.getString("solution_img")%>') no-repeat center center;background-size: 100% auto;"
                ></div>
                <div class="sa-card-inner-right">
                    <div class="sa-sm-card-out-x">
                        <% for(int i = 0;i < 8;i++){ %>
                            <div class="sa-sm-card sa-sm-card-x">
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
    </div>
<% } %>
<%--网站建设与营销推广--%>
<% if(GlobalSettings.getBoolean("is_web_extend_show")){ %>
    <div class="container mt-5 mb-1">
        <div class="row">
            <div class="col">
                <div class="card us-none">
                    <div class="card-header text-center fw-bold">网站建设</div>
                    <img src="<%=GlobalSettings.getJsonObject("web").getString("img")%>" onclick="window.open('./?r=<%=GlobalSettings.getJsonObject("web").getString("route")%>','_self')" alt="" class="card-img-bottom us-hover">
                </div>
            </div>
            <div class="col">
                <div class="card us-none">
                    <div class="card-header text-center fw-bold">营销推广</div>
                    <img src="<%=GlobalSettings.getJsonObject("extend").getString("img")%>" onclick="window.open('./?r=<%=GlobalSettings.getJsonObject("extend").getString("route")%>','_self')" alt="" class="card-img-bottom us-hover">
                </div>
            </div>
        </div>
    </div>
<% } %>
<%--小程序系统--%>
<% if(GlobalSettings.getBoolean("is_wx_app_show")){ %>
    <!--小程序系统-->
    <div class="container mt-5 mb-1">
        <% String cid = "sa-sm-card-3"; %>
        <div class="sa-card">
            <div class="sa-card-title">小程序系统</div>
            <div class="sa-card-inner">
                <div class="sa-card-inner-left-img"
                     style="background: url('<%=GlobalSettings.getString("wx_app_img")%>') no-repeat center center;background-size: 100% auto;"
                ></div>
                <div class="sa-card-inner-right" id="<%=cid%>">
                    <div class="sa-sm-card-out">
                        <% for(int i = 0;i < 4;i++){ %>
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
            document.getElementById("<%=cid%>").onmousedown=function(ev){
                //鼠标移动时事件
                document.onmousemove=function(e){
                    //兼容处理
                    let _event = e || event;
                    document.getElementById("<%=cid%>").scrollLeft -= _event.movementX;
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
<% } %>
<%--独立部署软件--%>
<% if(GlobalSettings.getBoolean("is_onOne_show")){ %>
    <!--独立部署软件-->
    <div class="container mt-5 mb-1">
        <div class="sa-card">
            <div class="sa-card-title">独立部署软件</div>
            <div class="sa-card-inner sa-card-inner-x">
                <div class="sa-card-inner-left-img"
                     style="background: url('<%=GlobalSettings.getString("onOne_img")%>') no-repeat center center;background-size: 100% auto;"
                ></div>
                <div class="sa-card-inner-right">
                    <div class="sa-sm-card-out-x">
                        <% for(int i = 0;i < 7;i++){ %>
                            <div class="sa-sm-card sa-sm-card-x">
                                <div class="sa-sm-card-img" onclick="window.open('./?r=/','_self')"></div>
                                <div class="sa-sm-card-title">抖音本地生活小程序</div>
                                <div class="sa-sm-card-old-price">市场价:<span>￥19800.00</span></div>
                                <div class="sa-sm-card-last-price">价格:<span>￥4999.00</span></div>
                            </div>
                        <% } %>
                        <div class="sa-sm-card sa-sm-card-x" onclick="window.open('./?r=/','_self')">
                            <div class="sa-sm-card-more-top">其他/社群粉丝</div>
                            <div class="sa-sm-card-more-bottom">查看更多></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<% } %>
<%--新闻模块--%>
<% if(GlobalSettings.getBoolean("is_news_modal_show")){ %>
    <div class="container mt-5 mb-1">
        <div class="sa-card-title">资讯信息</div>
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <button class="nav-link active" id="news-tab" data-bs-toggle="tab" data-bs-target="#nav-news" type="button" role="tab" aria-controls="nav-news" aria-selected="true">最新资讯</button>
                <button class="nav-link" id="business-tab" data-bs-toggle="tab" data-bs-target="#nav-business" type="button" role="tab" aria-controls="nav-business" aria-selected="false">行业资讯</button>
                <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">公司新闻</button>
                <button class="nav-link" id="industry-tab" data-bs-toggle="tab" data-bs-target="#nav-industry" type="button" role="tab" aria-controls="nav-industry" aria-selected="false">业界视点</button>
                <a class="nav-link nav-link-more ms-auto" href="./?r=/">查看更多></a>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-news" role="tabpanel" aria-labelledby="news-tab">
                <div class="w-100 mt-1 overflow-hidden">
                    <% for(int i = 0;i < 4;i++){ %>
                        <div class="card news-card">
                            <div class="row">
                                <div class="col-5">
                                    <img src="https://cn.bing.com/th?id=OHR.UnkindnessRavens_ZH-CN2840574948_1920x1080.jpg&rf=LaDigue_1920x1080.jpg" alt="" class="card-img">
                                </div>
                                <div class="col-7">
                                    <div class="news-card-title mt-2 mb-1">《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书发布</div>
                                    <div class="news-card-intro mt-4 mb-1">《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书在2021年世界互联网大会乌镇峰会上发...</div>
                                    <div class="news-card-times mt-3 mb-2">2021-10-23 10:56:51</div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
            <div class="tab-pane fade" id="nav-business" role="tabpanel" aria-labelledby="business-tab">
                <div class="w-100 mt-1 overflow-hidden">
                    <% for(int i = 0;i < 4;i++){ %>
                        <div class="card news-card">
                            <div class="row">
                                <div class="col-5">
                                    <img src="https://cn.bing.com/th?id=OHR.UnkindnessRavens_ZH-CN2840574948_1920x1080.jpg&rf=LaDigue_1920x1080.jpg" alt="" class="card-img">
                                </div>
                                <div class="col-7">
                                    <div class="news-card-title mt-2 mb-1">搭建私域流量池，企业应该选择微商城or小程序?</div>
                                    <div class="news-card-intro mt-4 mb-1">企业基于微信天然的社交属性，打造IP人设，快速实现社交裂变。</div>
                                    <div class="news-card-times mt-3 mb-2">2021-10-23 10:56:51</div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="contact-tab">
                <div class="w-100 mt-1 overflow-hidden">
                    <% for(int i = 0;i < 4;i++){ %>
                        <div class="card news-card">
                            <div class="row">
                                <div class="col-5">
                                    <img src="https://cn.bing.com/th?id=OHR.UnkindnessRavens_ZH-CN2840574948_1920x1080.jpg&rf=LaDigue_1920x1080.jpg" alt="" class="card-img">
                                </div>
                                <div class="col-7">
                                    <div class="news-card-title mt-2 mb-1">《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书发布</div>
                                    <div class="news-card-intro mt-4 mb-1">《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书在2021年世界互联网大会乌镇峰会上发...</div>
                                    <div class="news-card-times mt-3 mb-2">2021-10-23 10:56:51</div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
            <div class="tab-pane fade" id="nav-industry" role="tabpanel" aria-labelledby="industry-tab">
                <div class="w-100 mt-1 overflow-hidden">
                    <% for(int i = 0;i < 4;i++){ %>
                        <div class="card news-card">
                            <div class="row">
                                <div class="col-5">
                                    <img src="https://cn.bing.com/th?id=OHR.UnkindnessRavens_ZH-CN2840574948_1920x1080.jpg&rf=LaDigue_1920x1080.jpg" alt="" class="card-img">
                                </div>
                                <div class="col-7">
                                    <div class="news-card-title mt-2 mb-1">搭建私域流量池，企业应该选择微商城or小程序?</div>
                                    <div class="news-card-intro mt-4 mb-1">企业基于微信天然的社交属性，打造IP人设，快速实现社交裂变。</div>
                                    <div class="news-card-times mt-3 mb-2">2021-10-23 10:56:51</div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
<% } %>
<!--加载当页样式-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/home/style.css?v=<%=TimerX.getNowTimeStr(10)%>">

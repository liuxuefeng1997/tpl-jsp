<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/2
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% JsonObject ProductSettings = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/ProductSettings.json")); %>
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
            <button class="nav-link active" id="news-tab" data-bs-toggle="tab" data-bs-target="#nav-news" type="button" role="tab" aria-controls="nav-news" aria-selected="true">小程序系统</button>
            <button class="nav-link" id="business-tab" data-bs-toggle="tab" data-bs-target="#nav-business" type="button" role="tab" aria-controls="nav-business" aria-selected="false">独立部署软件</button>
            <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">行业解决方案</button>
            <button class="nav-link" id="industry-tab" data-bs-toggle="tab" data-bs-target="#nav-industry" type="button" role="tab" aria-controls="nav-industry" aria-selected="false">营销推广</button>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-news" role="tabpanel" aria-labelledby="news-tab">
            <div class="w-100 mt-1 overflow-hidden">
                <% for(int i = 0;i < 16;i++){ %>
                    <div class="card pd-card us-none">
                        <div class="pd-card-img" style="background: url('<%=ProductSettings.getString("card")%>') no-repeat center center;background-size: 100% 100%;"></div>
                        <div class="pd-card-body">
                            <div class="pd-card-title">单商户V4基础版</div>
                            <div class="pd-card-subtitle">单商户V4基础版</div>
                            <div class="pd-card-bottom">
                                <div class="pd-card-price"><span>￥980.00</span><span>￥1900.00</span></div>
                                <div class="pd-card-buySum">1406人购买</div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-business" role="tabpanel" aria-labelledby="business-tab">
            <div class="w-100 mt-1 overflow-hidden">
                <% for(int i = 0;i < 16;i++){ %>
                    <div class="card pd-card">
                        <div class="pd-card-img" style="background: url('<%=ProductSettings.getString("card")%>') no-repeat center center;background-size: 100% 100%;"></div>
                        <div class="pd-card-body">
                            <div class="pd-card-title">单商户V4基础版</div>
                            <div class="pd-card-subtitle">单商户V4基础版</div>
                            <div class="pd-card-bottom">
                                <div class="pd-card-price"><span>￥980.00</span><span>￥1900.00</span></div>
                                <div class="pd-card-buySum">1406人购买</div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="contact-tab">
            <div class="w-100 mt-1 overflow-hidden">
                <% for(int i = 0;i < 16;i++){ %>
                    <div class="card pd-card">
                        <div class="pd-card-img" style="background: url('<%=ProductSettings.getString("card")%>') no-repeat center center;background-size: 100% 100%;"></div>
                        <div class="pd-card-body">
                            <div class="pd-card-title">单商户V4基础版</div>
                            <div class="pd-card-subtitle">单商户V4基础版</div>
                            <div class="pd-card-bottom">
                                <div class="pd-card-price"><span>￥980.00</span><span>￥1900.00</span></div>
                                <div class="pd-card-buySum">1406人购买</div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-industry" role="tabpanel" aria-labelledby="industry-tab">
            <div class="w-100 mt-1 overflow-hidden">
                <% for(int i = 0;i < 16;i++){ %>
                    <div class="card pd-card">
                        <div class="pd-card-img" style="background: url('<%=ProductSettings.getString("card")%>') no-repeat center center;background-size: 100% 100%;"></div>
                        <div class="pd-card-body">
                            <div class="pd-card-title">单商户V4基础版</div>
                            <div class="pd-card-subtitle">单商户V4基础版</div>
                            <div class="pd-card-bottom">
                                <div class="pd-card-price"><span>￥980.00</span><span>￥1900.00</span></div>
                                <div class="pd-card-buySum">1406人购买</div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/product/style.css?v=<%=TimerX.getNowTimeStr(10)%>">

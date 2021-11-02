<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/2
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% JsonObject IntroSettings = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/IntroSettings.json")); %>
    <div class="container mt-1 mb-1">
        <div class="row">
            <div class="col-8">
                <div class="in-top-image mb-3"
                     style="background: url('<%=IntroSettings.getJsonObject("top_img").getString("official")%>') no-repeat center center;
                             background-size: auto 100%;"
                ></div>
                
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="news-tab" data-bs-toggle="tab" data-bs-target="#nav-news"
                                type="button" role="tab" aria-controls="nav-news" aria-selected="true">最新资讯
                        </button>
                        <button class="nav-link" id="business-tab" data-bs-toggle="tab" data-bs-target="#nav-business"
                                type="button" role="tab" aria-controls="nav-business" aria-selected="false">行业资讯
                        </button>
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact"
                                type="button" role="tab" aria-controls="nav-contact" aria-selected="false">公司新闻
                        </button>
                        <button class="nav-link" id="industry-tab" data-bs-toggle="tab" data-bs-target="#nav-industry"
                                type="button" role="tab" aria-controls="nav-industry" aria-selected="false">业界视点
                        </button>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-news" role="tabpanel" aria-labelledby="news-tab">
                        <div class="w-100 mt-1 overflow-hidden">
                            <% for (int i = 0; i < 4; i++) { %>
                            <div class="card news-card-x mb-1">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="https://cn.bing.com/th?id=OHR.UnkindnessRavens_ZH-CN2840574948_1920x1080.jpg&rf=LaDigue_1920x1080.jpg"
                                             alt="" class="card-img">
                                    </div>
                                    <div class="col-8">
                                        <div class="news-card-title mt-2 mb-1">《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书发布</div>
                                        <div class="news-card-intro mt-4 mb-1">
                                            《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书在2021年世界互联网大会乌镇峰会上发...
                                        </div>
                                        <div class="news-card-times mt-3 mb-2">2021-10-23 10:56:51</div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-business" role="tabpanel" aria-labelledby="business-tab">
                        <div class="w-100 mt-1 overflow-hidden">
                            <% for (int i = 0; i < 4; i++) { %>
                            <div class="card news-card-x">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="https://cn.bing.com/th?id=OHR.UnkindnessRavens_ZH-CN2840574948_1920x1080.jpg&rf=LaDigue_1920x1080.jpg"
                                             alt="" class="card-img">
                                    </div>
                                    <div class="col-8">
                                        <div class="news-card-title mt-2 mb-1">《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书发布</div>
                                        <div class="news-card-intro mt-4 mb-1">
                                            《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书在2021年世界互联网大会乌镇峰会上发...
                                        </div>
                                        <div class="news-card-times mt-3 mb-2">2021-10-23 10:56:51</div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="contact-tab">
                        <div class="w-100 mt-1 overflow-hidden">
                            <% for (int i = 0; i < 4; i++) { %>
                            <div class="card news-card-x">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="https://cn.bing.com/th?id=OHR.UnkindnessRavens_ZH-CN2840574948_1920x1080.jpg&rf=LaDigue_1920x1080.jpg"
                                             alt="" class="card-img">
                                    </div>
                                    <div class="col-8">
                                        <div class="news-card-title mt-2 mb-1">《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书发布</div>
                                        <div class="news-card-intro mt-4 mb-1">
                                            《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书在2021年世界互联网大会乌镇峰会上发...
                                        </div>
                                        <div class="news-card-times mt-3 mb-2">2021-10-23 10:56:51</div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-industry" role="tabpanel" aria-labelledby="industry-tab">
                        <div class="w-100 mt-1 overflow-hidden">
                            <% for (int i = 0; i < 4; i++) { %>
                            <div class="card news-card-x">
                                <div class="row">
                                    <div class="col-4">
                                        <img src="https://cn.bing.com/th?id=OHR.UnkindnessRavens_ZH-CN2840574948_1920x1080.jpg&rf=LaDigue_1920x1080.jpg"
                                             alt="" class="card-img">
                                    </div>
                                    <div class="col-8">
                                        <div class="news-card-title mt-2 mb-1">《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书发布</div>
                                        <div class="news-card-intro mt-4 mb-1">
                                            《世界互联网发展报告2021》和《中国互联网发展报告2021》蓝皮书在2021年世界互联网大会乌镇峰会上发...
                                        </div>
                                        <div class="news-card-times mt-3 mb-2">2021-10-23 10:56:51</div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card in-right-newly">
                    <div class="in-right-newly-title">最热资讯</div>
                    <% for(int i = 0;i < 10;i++){
                        String _no = (i + 1) + "";
                        if(_no.length() == 1){
                            _no = "0" + _no;
                        }
                        String _class = "";
                        if(i < 3){
                            _class = "in-right-newly-child-top3";
                        }
                    %>
                        <div class="in-right-newly-child"
                             onclick=""
                        ><span class="<%=_class%>"><%=_no%>&nbsp;&nbsp;&nbsp;&nbsp;</span>搭建私域流量池，企业应该选择微..</div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

<link rel="stylesheet"
      href="<%=request.getContextPath()%>/resources/page/intro/style.css?v=<%=TimerX.getNowTimeStr(10)%>">

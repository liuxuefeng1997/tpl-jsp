<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/2
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
    <div class="container mt-1 mb-1">
        <div class="row">
            <div class="col-8">
                <div class="in-top-image mb-3"
                     style="background: url('<%=IntroSettings.getJsonObject("top_img").getString(request.getParameter("r").replace("/",""))%>') no-repeat center center;
                             background-size: auto 100%;"
                ></div>
                <%--<div class="sa-card-title"><%=IntroSettings.getJsonObject("title").getString(request.getParameter("r").replace("/",""))%></div>--%>
                <div class="tab-content mt-2" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-news" role="tabpanel" aria-labelledby="news-tab">
                        <div class="w-100 mt-1 overflow-hidden">
                            <% for (int i = 0; i < 4; i++) { %>
                            <div class="card news-card-x mb-1 us-none"
                                 onclick="window.open('./?r=<%=request.getParameter("r")%>&aid=<%=i + ""%>','_self')"
                            >
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
                <%@ include file="../modal/IntroRightBar.jsp" %>
            </div>
        </div>
    </div>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/home/style.css?v=<%=TimerX.getNowTimeStr(10)%>">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/intro/style.css?v=<%=TimerX.getNowTimeStr(10)%>">

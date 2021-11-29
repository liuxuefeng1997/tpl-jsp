<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/2
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--接口处理—START--%>
<%
    int News_type = 1;
    switch (request.getParameter("r")){
        case "/news/":
            News_type = 2; //2
            break;
        case "/solution/":
            News_type = 3;
            break;
        case "/case/":
            News_type = 4;
            break;
    }
    JsonObject News_Json = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("POST",Api_Url_News,"type=" + News_type,Api_Url.getString("api_host")));
    if(DebugSettings){out.print(News_Json);}
%>
<%--接口处理—END--%>
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
                            <%
                                for(JsonValue x : News_Json.getJsonObject("data").getJsonArray("data")){
                                    JsonObject data = x.asJsonObject();
                                    int id = data.getInt("id");
                                    String title = data.getString("title");
                                    String subtitle = data.getString("subtitle");
                                    String picture = data.getJsonArray("picture").size() >= 1 ? data.getJsonArray("picture").getJsonObject(0).getString("url") : "https://cn.bing.com/th?id=OHR.UnkindnessRavens_ZH-CN2840574948_1920x1080.jpg&rf=LaDigue_1920x1080.jpg";
                                    String time = data.get("updated_at").toString();
                            %>
                                <div class="card news-card-x mb-1 us-none"
                                     onclick="window.open('./?r=<%=request.getParameter("r")%>&aid=<%=id + ""%>','_self')"
                                >
                                    <div class="row">
                                        <div class="col-4">
                                            <img src="<%=picture%>"
                                                 alt="" class="card-img">
                                        </div>
                                        <div class="col-8">
                                            <div class="news-card-title mt-2 mb-1"><%=title%></div>
                                            <div class="news-card-intro mt-4 mb-1">
                                                <%=subtitle%>
                                            </div>
                                            <div class="news-card-times mt-3 mb-2"><%=time%></div>
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

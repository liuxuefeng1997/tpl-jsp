<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/2
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container mt-1 mb-1">
    <div class="row">
        <div class="col-9">
            <div class="card jt-card jt-top-card mt-1 mb-1"
                 style="background: url('<%=IntroSettings.getJsonObject("top_img").getString("join")%>') no-repeat center center;
                         background-size: auto 100%;"
            ></div>
            <div class="card jt-card mt-4 mb-1">
                <br>
                <% for(int i = 0;i < 15;i++){ %>
                    <center>这里是富文本</center>
                    <hr>
                    <br>
                <% } %>
            </div>
        </div>
        <div class="col-3">
            <%@ include file="../modal/CaseRightBar.jsp" %>
        </div>
    </div>
</div>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/page/join/style.css?v=<%=TimerX.getNowTimeStr(10)%>">

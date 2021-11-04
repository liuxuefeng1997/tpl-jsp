<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!--页首菜单-->
<nav class="navbar navbar-expand-lg navbar-light sa-bg-blue fixed-top us-none">
    <div class="container">
        <a class="navbar-brand"
           href="./?r=<%=request.getParameter("r")%><%=ActiveX.getNull(request.getParameter("aid"),"&aid=" + request.getParameter("aid"))%>"
        >
            <img src="<%=GlobalSettings.getString("logo")%>" alt="" height="44" class="d-inline-block align-text-top">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/"," active","")%>"
                       href="./?r=/"
                    >首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/product/"," active","")%>"
                       href="./?r=/product/"
                    >产品中心</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/solution/"," active","")%>"
                       href="./?r=/solution/"
                    >解决方案</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/join/"," active","")%>"
                       href="./?r=/join/"
                    >加盟代理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/case/"," active","")%>"
                       href="./?r=/case/"
                    >成功案例</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/news/"," active","")%>"
                       href="./?r=/news/"
                    >官方动态</a>
                </li>
            </ul>
            <div class="nav-login ms-auto">
                <button type="button" class="btn btn-primary btn-lg">登录</button>
            </div>
        </div>
    </div>
</nav>

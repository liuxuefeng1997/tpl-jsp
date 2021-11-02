<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--加载项--%>
<%@ include file="../Controller/Addon/Active.jsp" %>
<!--页首菜单-->
<nav class="navbar navbar-expand-lg navbar-light sa-bg-blue fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="https://v5.bootcss.com/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/"," active","")%>" aria-current="page" href="./?r=/">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/product/"," active","")%>" aria-current="page" href="./?r=/product/">产品中心</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/j"," active","")%>" aria-current="page" href="./?r=/">解决方案</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("a"),"/j"," active","")%>" href="#">加盟代理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/c"," active","")%>" href="#">成功案例</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link<%=ActiveX.getStu(request.getParameter("r"),"/g"," active","")%>" href="#">官方动态</a>
                </li>
            </ul>
            <div class="nav-login ms-auto">
                <button type="button" class="btn btn-primary btn-lg">登录</button>
            </div>
        </div>
    </div>
</nav>

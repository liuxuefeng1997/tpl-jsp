<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!--页首菜单-->
<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="https://v5.bootcss.com/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="./?r=/">首页</a>
                    <% if(request.getParameter("r").equals("/")){ %><div class="nav-bottom-active"></div><% } %>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownP" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        产品中心
                    </a>
                    <% if(request.getParameter("r").startsWith("/p")){ %><div class="nav-bottom-active"></div><% } %>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownP">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownK" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        解决方案
                    </a>
                    <% if(request.getParameter("r").startsWith("/j")){ %><div class="nav-bottom-active"></div><% } %>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownK">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">加盟代理</a>
                    <% if(request.getParameter("r").startsWith("/a")){ %><div class="nav-bottom-active"></div><% } %>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">成功案例</a>
                    <% if(request.getParameter("r").startsWith("/c")){ %><div class="nav-bottom-active"></div><% } %>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">官方动态</a>
                    <% if(request.getParameter("r").startsWith("/g")){ %><div class="nav-bottom-active"></div><% } %>
                </li>
            </ul>
            <div class="nav-login">
                <button type="button" class="btn btn-primary btn-lg">登录</button>
            </div>
        </div>
    </div>
</nav>

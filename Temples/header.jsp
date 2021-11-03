<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title><%=GlobalSettings.getString("title")%></title>
    <script src="//www.mailx.top/public-js/iu.library.js?v=<%=TimerX.getNowTimeStr(10)%>" charset="UTF-8" type="text/javascript"></script>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- JQuery 3.6.0 -->
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!--自定义样式及脚本-->
    <script src="resources/main.js?v=<%=TimerX.getNowTimeStr(10)%>" charset="UTF-8" type="text/javascript"></script>
    <link href="resources/main.css?v=<%=TimerX.getNowTimeStr(10)%>" rel="stylesheet" type="text/css">
</head>
<body class="bg-light">
<%@ include file="NavMenu.jsp" %>
<div style="height: 70px"></div>

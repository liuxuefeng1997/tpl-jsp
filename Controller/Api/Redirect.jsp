<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% if(StringX.isNotNull(request.getParameter("b64"))){
    String _url = Base64X.getStr(request.getParameter("b64"));
    if(GlobalSettings.getBoolean("redirect_tip")){ %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>您正在访问：<%=_url%></title>
    <style>
        .error-title{
            margin-top: 25px;
            text-align: center;
            margin-left: 10px;
            user-select: none;
            -webkit-user-drag: none;
            font-size: 22px;
        }
        .error-info{
            width: 100%;
            text-align: center;
            color: rgb(246,83,62);
            overflow: hidden;
            font-size: 18px;
        }
        .error-button-bar{
            /*width: calc(100% - 20px);*/
            margin: 15px auto;
            height: 50px;
            display: inline-flex;
        }
        .error-button-bar button{
            height: calc(100% - 10px);
            width: auto;
            margin: 5px 10px;
            border: none;
            background: #303030;
        }
        .error-button-bar button:hover{
            background: #404040;
            cursor: pointer;
        }
        .error-button-bar button label{
            margin: 0 10px;
            color: #EEEEEE;
            cursor: pointer;
            -webkit-user-drag: none;
            user-select: none;
            font-size: 18px;
        }
        .error-button-bar-out {
            width: 248px;
            margin: auto;
        }
    </style>
</head>
<body>
<h4 class="error-title">您正在访问</h4>
<div class="error-info"><%=_url%></div>
<div class="error-button-bar-out">
    <div class="error-button-bar">
        <button onclick="window.close()">
            <label>取消访问</label>
        </button>
        <button onclick="window.open('<%=_url%>','_self')">
            <label>立即访问</label>
        </button>
    </div>
</div>
</body>
</html>

<% } else { response.sendRedirect(_url); }} else { %>
    <%="Parameter is null"%>
<% } %>
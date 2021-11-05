<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% if(StringX.isNotNull(request.getParameter("b64")) && request.getParameter("b64").length() > 1 && !(request.getParameter("b64").contains("@"))){
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
            outline: 1px solid #303030;
            border-radius: 5px;
        }
        .error-button-bar button:hover{
            cursor: pointer;
        }
        .error-button-bar button label{
            margin: 0 10px;
            cursor: pointer;
            -webkit-user-drag: none;
            user-select: none;
            font-size: 18px;
        }
        .error-button-bar button:nth-child(1),
        .error-button-bar button:nth-child(1) label{
            background: #FFFFFF;
            color: #303030;
        }
        .error-button-bar button:nth-child(1):hover,
        .error-button-bar button:nth-child(1):hover label{
            background: #F0F0F0;
            color: #303030;
        }
        .error-button-bar button:nth-child(2),
        .error-button-bar button:nth-child(2) label{
            background: #303030;
            color: #EEEEEE;
        }
        .error-button-bar button:nth-child(2):hover,
        .error-button-bar button:nth-child(2):hover label{
            background: #404040;
            color: #EEEEEE;
        }
        .error-button-bar-out {
            width: 248px;
            margin: auto;
        }
        .tip-card {
            width: 640px;
            height: 200px;
            padding: 15px 8px 3px;
            outline: 1px solid #909192;
            border-radius: 6px;
            position: absolute;
            left: calc(50% - 328px);
            top: calc(50% - 129px);
        }
        .inner {
            width: 100vw;
            height: 100vh;
            min-height: 250px;
            max-height: calc(100vh - 18px);
            min-width: 660px;
            max-width: calc(100vw - 10px);
            position: relative;
        }
        html::-webkit-scrollbar,body::-webkit-scrollbar {
            display: none;
        }
    </style>
</head>
<body>
<div class="inner">
    <div class="tip-card">
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
    </div>
</div>
</body>
</html>

<% } else { response.sendRedirect(_url); }} else { %>
    <%="Parameter Error"%>
<% } %>
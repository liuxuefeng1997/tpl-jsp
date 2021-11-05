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
            width: 100%;
            margin-top: 25px;
            text-align: center;
            margin-left: 10px;
            user-select: none;
            -webkit-user-drag: none;
            font-size: 22px;
            height: 28px;
            line-height: 28px;
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
        <h4 class="error-title">
            <svg viewBox="0 0 1034 1024" xmlns="http://www.w3.org/2000/svg" width="24" height="22">
                <path d="M1011.982 842.518 606.673 140.565c-49.575-85.822-130.595-85.822-180.157 0L21.205 842.518c-49.562 85.91-9.015 155.99 90.04 155.99l810.693 0C1020.997 998.507 1061.502 928.423 1011.982 842.518zM460.924 339.737c14.565-15.747 33.082-23.622 55.665-23.622 22.595 0 41.095 7.792 55.675 23.307 14.485 15.55 21.725 34.997 21.725 58.382 0 20.12-30.235 168.07-40.32 275.704l-72.825 0c-8.845-107.635-41.652-255.584-41.652-275.704C439.194 374.774 446.446 355.407 460.924 339.737zM571.244 851.538c-15.32 14.92-33.55 22.355-54.65 22.355-21.095 0-39.33-7.435-54.647-22.355-15.275-14.885-22.867-32.915-22.867-54.09 0-21.065 7.592-39.29 22.867-54.565 15.317-15.28 33.552-22.92 54.647-22.92 21.1 0 39.33 7.64 54.65 22.92 15.265 15.275 22.875 33.5 22.875 54.565C594.119 818.623 586.509 836.653 571.244 851.538z" fill="#d81e06"></path>
            </svg>
            您正在访问
        </h4>
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
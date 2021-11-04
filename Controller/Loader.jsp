<%@ page import="com.iuideas.library.*" %>
<%@ page import="javax.json.*" %>
<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--加载项--%>
<%@ include file="../Controller/Addon/Active.jsp" %>
<%
    //获取网站根目录路径
    String wwwRoot = FileReaderX.getFullPath().split("/WEB-INF/")[0].replace("%5B","[").replace("%5D","]");
%>
<%
    //加载全局配置
    JsonObject GlobalSettings = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/GlobalSettings.json"));
    //加载页脚菜单
    JsonObject FooterMenu = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/FooterMenu.json"));
    //内容页设置
    JsonObject IntroSettings = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/IntroSettings.json"));
%>

<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String User = request.getParameter("user");
    String Pwd = request.getParameter("password");
    if(Objects.equals(User, Pwd) && StringX.isNotNull(User) && StringX.isNotNull(Pwd)){
%>
<%="true"%>
<% } else { %>
<%="false"%>
<% } %>
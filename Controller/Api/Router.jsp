<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% switch (request.getParameter("r")){case "/base/": %>
    <%@ include file="UrlBase.jsp" %>
<% break; case "/redirect/": %>
    <%@ include file="Redirect.jsp" %>
<% break; default:
    response.sendRedirect("./?r=/");
    break; } %>

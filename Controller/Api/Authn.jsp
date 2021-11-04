<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%;
    if(StringX.isNotNull(request.getParameter("url"))){
%>
    <%=Base64X.getB64(request.getParameter("url"))%>
<% } else { %>
    <%="url is null"%>
<% } %>
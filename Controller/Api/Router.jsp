<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% switch (request.getParameter("r")){case "/auth/": %>
    <%@ include file="Authn.jsp" %>
<% break; case "/config/": %>
    <%@ include file="ShowConfig.jsp" %>
<% break; default: %>
    <script>
        window.open("./?r=/","_self");
    </script>
<% break; } %>

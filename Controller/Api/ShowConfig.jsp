<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/28
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<% if(StringX.isNotNull(request.getParameter("c"))){ %>
    <%=FileReaderX.getStr(wwwRoot + "/Config/" + request.getParameter("c") + ".json")%>
<% } else { %>
    <%="Parameter error"%>
<% } %>
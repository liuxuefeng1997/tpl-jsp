<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="Controller/Loader.jsp" %>
<% if(StringX.isNotNull(request.getParameter("m")) && Objects.equals(request.getParameter("m"), "api")){ %>
    <%@ include file="Controller/Api/Router.jsp" %>
<% } else if(StringX.isNotNull(request.getParameter("r"))) { %>
    <%--这里插入header--%>
    <%@ include file="Temples/header.jsp" %>
    <%--处理路由--%>
    <%@ include file="Controller/View/Router.jsp" %>
    <%--这里插入footer--%>
    <%@ include file="Temples/footer.jsp" %>
<% } else { response.sendRedirect("./?r=/"); } %>
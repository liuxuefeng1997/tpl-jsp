<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (request.getParameter("r").startsWith("/link/")) {
        String url_c = request.getParameter("r").replace("/link/", "");
        if (StringX.isNotNull(url_c)) {
            response.sendRedirect("./?r=/redirect/&m=api&b64="+url_c);
        } else {
            response.sendRedirect("./?r=/");
        }
    } else {
        switch (request.getParameter("r")) { case "/":
%>
    <%@ include file="../../Temples/page/Home.jsp" %>
<% break; case "/product/": if (StringX.isNotNull(request.getParameter("aid"))) { %>
            <%--加载文章模板--%>
            <%@ include file="../../Temples/page/Article.jsp" %>
        <% } else { %>
            <%--加载列表模板--%>
            <%@ include file="../../Temples/page/Product.jsp" %>
<% } break; case "/news/": if (StringX.isNotNull(request.getParameter("aid"))) { %>
            <%--加载文章模板--%>
            <%@ include file="../../Temples/page/Article.jsp" %>
        <% } else { %>
            <%--加载列表模板--%>
            <%@ include file="../../Temples/page/OfficialNews.jsp" %>
<% } break; case "/solution/": if (StringX.isNotNull(request.getParameter("aid"))) { %>
            <%--加载文章模板--%>
            <%@ include file="../../Temples/page/Article.jsp" %>
        <% } else { %>
            <%--加载列表模板--%>
            <%@ include file="../../Temples/page/List.jsp" %>
<% } break; case "/join/": %>
        <%@ include file="../../Temples/page/JoinTo.jsp" %>
<% break;
    case "/case/": %>
    <% if (StringX.isNotNull(request.getParameter("aid"))) { %>
        <%--加载文章 模板--%>
        <%@ include file="../../Temples/page/Article.jsp" %>
    <% } else { %>
        <%--加载列表 模板--%>
        <%@ include file="../../Temples/page/List.jsp" %>
<% } break; default: response.sendRedirect("./?r=/"); break; }} %>

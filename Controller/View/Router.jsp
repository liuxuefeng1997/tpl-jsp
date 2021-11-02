<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/10/27
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if(request.getParameter("r").startsWith("/link/")){
        String url_c = request.getParameter("r").replace("/link/","");
        if(StringX.isNotNull(url_c)){
            String _url = url_c.split("@")[0] + "://" + url_c.split("@")[1];
%>
    <script>
        window.open("<%=_url%>","_blank");
        window.location.href = "./?r=/";
    </script>
<% } else { %>
    <script>
        window.open("./?r=/","_self");
    </script>
<% }} else { %>
    <% switch (request.getParameter("r")){case "/": %>
        <%@ include file="../../Temples/page/Home.jsp" %>
    <% break; case "/product/": %>
        <%@ include file="../../Temples/page/Product.jsp" %>
    <% break; case "/news/": %>
        <%@ include file="../../Temples/page/Intro.jsp" %>
    <% break; case "/solution/": %>
        <%=request.getContextPath()%>
    <% break; case "/join_to/": %>
        <%=request.getContextPath() + ""%>
    <% break; case "/case/": %>
        <%=request.getContextPath() + "" + ""%>
    <% break; default: %>
        <script>
            window.open("./?r=/","_self");
        </script>
    <% break; } %>
<% } %>

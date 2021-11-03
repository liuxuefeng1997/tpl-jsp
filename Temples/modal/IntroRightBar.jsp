<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/3
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="card in-right-newly">
    <div class="in-right-newly-title">最热资讯</div>
    <% for(int i = 0;i < 10;i++){
        String _no = (i + 1) + "";
        if(_no.length() == 1){
            _no = "0" + _no;
        }
        String _class = "";
        if(i < 3){
            _class = "in-right-newly-child-top3";
        }
    %>
    <div class="in-right-newly-child us-none"
         onclick="window.open('./?r=/news/&aid=<%=_no%>','_self')"
    ><span class="<%=_class%>"><%=_no%>&nbsp;&nbsp;&nbsp;&nbsp;</span>搭建私域流量池，企业应该选择微..</div>
    <% } %>
</div>

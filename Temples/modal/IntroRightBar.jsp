<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/3
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    JsonObject Hot_News_Json = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("POST",Api_Url_News,"type=" + News_type + "&hot_status=1",Api_Url.getString("api_host")));
    if(DebugSettings){out.print(Hot_News_Json);}
%>
<div class="card in-right-newly">
    <div class="in-right-newly-title">最热资讯</div>
    <%
        int i = 0;
        for(JsonValue x : Hot_News_Json.getJsonObject("data").getJsonArray("data")){
            String _no = (i + 1) + "";
            if(_no.length() == 1){
                _no = "0" + _no;
            }
            String _class = "";
            if(i < 3){
                _class = "in-right-newly-child-top3";
            }
            JsonObject data = x.asJsonObject();
            int id = data.getInt("id");
            String title = data.getString("title");
    %>
    <div class="in-right-newly-child us-none"
         onclick="window.open('./?r=<%=request.getParameter("r")%>&aid=<%=id + ""%>','_self')"
    ><span class="<%=_class%>"><%=_no%>&nbsp;&nbsp;&nbsp;&nbsp;</span><%=title%></div>
    <% i++;} %>
</div>

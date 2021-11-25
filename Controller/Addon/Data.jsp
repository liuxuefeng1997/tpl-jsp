<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/9
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    JsonObject Api_Url = JSONReaderX.getJsonObj(FileReaderX.getStr(wwwRoot + "/Config/Api/Url.json"));
    String Api_Url_Host = Api_Url.getString("api_protocol") + Api_Url.getString("api_host");
    String Api_Url_Product_Tags = Api_Url_Host + Api_Url.getJsonObject("api_list").getJsonObject("product").getString("tags");
    String Api_Url_Product_List = Api_Url_Host + Api_Url.getJsonObject("api_list").getJsonObject("product").getString("list");
    String Api_Url_Product_Detail = Api_Url_Host + Api_Url.getJsonObject("api_list").getJsonObject("product").getString("detail");
    String Api_Url_Users_SMS_Send = Api_Url_Host + Api_Url.getJsonObject("api_list").getJsonObject("users").getString("sms_send");
    String Api_Url_Users_SMS_Login = Api_Url_Host + Api_Url.getJsonObject("api_list").getJsonObject("users").getString("sms_login");
    String Api_Url_Users_Order = Api_Url_Host + Api_Url.getJsonObject("api_list").getJsonObject("users").getString("product");
%>

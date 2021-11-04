<%@ page import="java.util.Base64" %>
<%@ page import="java.nio.charset.StandardCharsets" %><%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/4
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    static class Base64X {
        public static String getStr(String _base64){
            return new String(Base64.getUrlDecoder().decode(_base64.getBytes(StandardCharsets.UTF_8)),StandardCharsets.UTF_8);
        }
        public static String getB64(String _src){
            return Base64.getUrlEncoder().encodeToString(_src.getBytes(StandardCharsets.UTF_8));
        }
    }
%>

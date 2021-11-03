<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/2
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%!
    static class ActiveX {
        public static String getStu(String _route,String _str,String _true_str,String _false_str){
            if(StringX.isNotNull(_route) && _route.equals(_str)){
                return _true_str;
            }
            return _false_str;
        }
        public static String getNull(String _can,String _true_str){
            if(StringX.isNotNull(_can)){
                return _true_str;
            }
            return "";
        }
    }
%>

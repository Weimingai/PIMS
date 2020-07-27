<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*" %>
<%

Student student=(Student)session.getAttribute("user");
if(student==null)
{
	response.sendRedirect("../login.jsp");
}

%>